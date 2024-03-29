import 'package:flutter/material.dart';
import 'package:remindme/Module/Home/HomeLayout/TasksScreen/TasksModel/note_model.dart';

import '../edit_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({Key? key, required this.note}) : super(key: key);

  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditNoteViewBody(
        note: note,
      ),
    );
  }
}
