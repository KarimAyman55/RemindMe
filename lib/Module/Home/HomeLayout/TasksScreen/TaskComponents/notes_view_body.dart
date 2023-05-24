import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../TasksCubit/notes cubit.dart';
import 'custom_appBar.dart';
import 'notes_list_view.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({Key? key}) : super(key: key);

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {

  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: const [
          Expanded(
            child: NotesListView(),
          ),
        ],
      ),
    );
  }
}
