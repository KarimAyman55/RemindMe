import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import '../TaskComponents/constants.dart';
import '../TasksModel/note_model.dart';
import 'notes_state.dart';


class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel>? notes;
  fetchAllNotes() {
    var notesBox = Hive.box<NoteModel>(kNotesBox);

    notes = notesBox.values.toList();
    emit(NotesSuccess());
  }
}
