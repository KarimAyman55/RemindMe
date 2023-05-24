import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../TasksCubit/add_note_cubit.dart';
import '../TasksCubit/notes cubit.dart';
import 'add_noteForm.dart';


class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFailure) {}

          if (state is AddNoteSuccess) {
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
              top: 40
              ,left: 16,
                  right: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child:  const SingleChildScrollView(
                child: AddNoteForm(),
              ),
            ),
          );
        },
      ),
    );
  }
}
