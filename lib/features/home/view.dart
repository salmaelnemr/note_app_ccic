// import 'package:design5/core/app_colors/app_colors.dart';
// import 'package:design5/core/caching_utils/caching_utils.dart';
// import 'package:design5/core/dimensions/dimensions.dart';
// import 'package:design5/core/router_utils/route_utils.dart';
// import 'package:design5/features/home/states.dart';
// import 'package:design5/features/login/view.dart';
// import 'package:design5/features/note_editor/view.dart';
// import 'package:design5/features/search/view.dart';
// import 'package:design5/widgets/app/create_your_first_note_vector.dart';
// import 'package:design5/widgets/app/note_card.dart';
// import 'package:design5/widgets/app_app_bar.dart';
// import 'package:design5/widgets/app_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/core/dimensions/dimensions.dart';
import 'package:note_app/features/home/states.dart';
import '../../core/app_colors/app_colors.dart';
import '../../core/caching_utils/caching_utils.dart';
import '../../core/router_utils/route_utils.dart';
import '../../widgets/app/create_your_first_note_vector.dart';
import '../../widgets/app/note_card.dart';
import '../../widgets/app_app_bar.dart';
import '../../widgets/app_icon_button.dart';
import '../../widgets/app_loading_indicator.dart';
import '../../widgets/app_text.dart';
import '../login/view.dart';
import '../note_details/view.dart';
import '../note_editor/view.dart';
import '../search/view.dart';
import 'cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getNotes(),
      child: Scaffold(
        appBar: AppAppBar(
          title: "Notes",
          actions: [
            AppIconButton(
              icon: FontAwesomeIcons.magnifyingGlass,
              onTap: () => RouteUtils.push(
                const SearchView(),
              ),
            ),
            SizedBox(width: 12.width),
            AppIconButton(
              icon: FontAwesomeIcons.arrowRightFromBracket,
              onTap: () async {
                await CachingUtils.deleteUser();
                RouteUtils.pushAndPopAll(const LoginView());
              },
            ),
            SizedBox(width: 16.width),
          ],
        ),
        body: BlocBuilder<HomeCubit, HomeStates>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const AppLoadingIndicator();
            }
            final cubit = BlocProvider.of<HomeCubit>(context);
            if (cubit.notes.isEmpty) {
              return const CreateYourFirstNoteVector();
            }
            final notes = cubit.notes;
            return RefreshIndicator(
              onRefresh: cubit.getNotes,
              color: AppColors.white,
              child: NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  if (notification.metrics.extentAfter <= 0) {
                    cubit.getMoreNotes();
                  }
                  return false;
                },
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: notes.length + 1,
                  itemBuilder: (context, index) {
                    if (index == notes.length) {
                      if (state is HomeMoreLoading) {
                        return const Padding(
                          padding: EdgeInsets.only(bottom: 34),
                          child: AppLoadingIndicator(),
                        );
                      }
                      return const SizedBox.shrink();
                    }
                    return NoteCard(
                      note: notes[index],
                      onTap: () {
                        RouteUtils.push(
                          BlocProvider.value(
                            value: cubit,
                            child: NoteDetailsView(id: notes[index].id),
                          ),
                        );
                      },
                      onDismiss: () => cubit.deleteNote(notes[index]),
                    );
                  },
                ),
              ),
            );
          },
        ),
        floatingActionButton: Builder(
            builder: (context) {
              return FloatingActionButton(
                child: Icon(
                  FontAwesomeIcons.plus,
                  size: 24.height,
                ),
                onPressed: () async {
                  await RouteUtils.push(
                    BlocProvider.value(
                      value: BlocProvider.of<HomeCubit>(context),
                      child: const NoteEditorView(),
                    ),
                  );
                },
              );
            }
        ),
      ),
    );
  }
}
