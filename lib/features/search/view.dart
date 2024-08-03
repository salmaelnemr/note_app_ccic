//import 'package:design5/widgets/app/no_search_result.dart';
//import 'package:design5/widgets/app/note_card.dart';
// import 'package:design5/widgets/app/search_text_field.dart';
// import 'package:design5/widgets/app_app_bar.dart';
import 'package:flutter/material.dart' hide SearchController;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/app/search_text_field.dart';
import '../../widgets/app_app_bar.dart';

//import '../../core/models/note.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key,});

  //final List<Note> notes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SearchTextField(
              onChanged: (v) {},
            ),
            SizedBox(height: 32.h),
            Expanded(
              child: Builder(
                builder: (context) {
                 /* if (controller.filteredNotes.isEmpty) {
                    return NoSearchResult();
                  }
                  return ListView.builder(
                    itemCount: controller.filteredNotes.length,
                    itemBuilder: (context, index) {
                      return NoteCard(
                        note: controller.filteredNotes[index],
                        onTap: () {},
                      );
                    },
                  );*/
                  return const SizedBox();
                },
              ),
            ),
            /*Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index){
                  return NoteCard(note: );
                },
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
