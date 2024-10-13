//import 'package:design5/features/home/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/home/states.dart';
import '../../core/models/note.dart';
import '../../core/network_utils/network_utils.dart';
import '../../widgets/snack_bar.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInit());

  int currentNotesPage = 1;
  List<Note> notes = [];
  int? totalNotesPages;

  Future<void> getNotes() async {
    notes.clear();
    currentNotesPage = 1;
    emit(HomeLoading());
    try {
      final response = await NetworkUtils.get('note?page=$currentNotesPage');
      totalNotesPages = response.data['total'];
      for (var i in response.data['notes']) {
        notes.add(Note.fromJson(i));
      }
    } catch (e, s) {
      print(e);
      print(s);
    }
    emit(HomeInit());
  }

  Future<void> getMoreNotes() async {
    if (state is HomeMoreLoading || currentNotesPage == totalNotesPages){
      return;
    }
    currentNotesPage++;
    emit(HomeMoreLoading());
    try {
      final response = await NetworkUtils.get('note?page=$currentNotesPage');
      for (var i in response.data['notes']) {
        notes.add(Note.fromJson(i));
      }
    } catch (e) {
      currentNotesPage--;
    }
    emit(HomeInit());
  }

  void insertNote(Note note) {
    notes.insert(0, note);
    emit(HomeInit());
  }

  void editNote(Note note) {
    notes.removeWhere((element) => element.id == note.id);
    notes.insert(0, note);
    emit(HomeInit());
  }

  Future<void> deleteNote(Note note) async {
    try {
      final response = await NetworkUtils.delete('note/${note.id}');
      if (response.statusCode == 200) {
        notes.remove(note);
        showSnackBar('Note Deleted Successfully!');
      } else {
        showSnackBar(response.data['message'], error: true);
      }
    } catch (e, s) {
      showSnackBar('Failed try again!', error: true);
      print(e);
      print(s);
    }
    emit(HomeInit());
  }

}