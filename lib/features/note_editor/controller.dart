import 'dart:convert';

//import 'package:design5/core/models/note.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/models/note.dart';

class NoteEditorController {
  NoteEditorController({this.note});
  Note? note;

  final formKey = GlobalKey<FormState>();

  TextEditingController titleTXController = TextEditingController();
  TextEditingController subtitleTXController = TextEditingController();

  Future<Note?> addNote() async {
    if (!formKey.currentState!.validate()) {
      return null;
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    List<String> cachedNotes = prefs.getStringList('notes') ?? [];
    cachedNotes.insert(
      0,
      jsonEncode({
      'title': titleTXController.text,
      'subtitle': subtitleTXController.text,
      'id': DateTime.now().millisecondsSinceEpoch.toString(),
      }),
    );
    await prefs.setStringList(
      'notes',
      cachedNotes,
    );
    return Note(
      title: titleTXController.text,
      subtitle: subtitleTXController.text,
      id: id,
    );
  }

  Future<Note?> editNote() async {
    if (!formKey.currentState!.validate()) {
      return null;
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    note!.title = titleTXController.text;
    note!.subtitle = subtitleTXController.text;
    List<String> cachedNotes = prefs.getStringList('notes') ?? [];
    int index = cachedNotes.indexWhere((element) {
      return jsonDecode(element)['id'] == note!.id;
    });
    cachedNotes.removeAt(index);
    cachedNotes.insert(index, jsonEncode({
      'id': note!.id,
      'title': titleTXController.text,
      'subtitle': subtitleTXController.text,
    }));
    await prefs.setStringList(
      'notes',
      cachedNotes,
    );
    return note;
  }
}
