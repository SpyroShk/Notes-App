import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/note.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(const NotesLoaded(notes: []));

  void addNote(Note note) {
    if (state is NotesLoaded) {
      final loadedState = state as NotesLoaded;
      final newNotes = [...loadedState.notes, note];
      emit(
        NotesLoaded(notes: newNotes),
      );
    }
  }

  void removeNote(String id) {
    if (state is NotesLoaded) {
      final loadedState = state as NotesLoaded;
      final removedNotes = [
        for (Note prevNote in loadedState.notes)
          if (prevNote.id != id) prevNote
      ];
      emit(
        NotesLoaded(notes: removedNotes),
      );
    }
  }

  void editNote(String title, String description, String id) {
    if (state is NotesLoaded) {
      final loadedState = state as NotesLoaded;
      final editedNotes = [
        for (Note prevNote in loadedState.notes)
          (prevNote.id == id)
              ? Note(description: description, title: title, id: id)
              : prevNote
      ];
      emit(
        NotesLoaded(notes: editedNotes),
      );
    }
  }
}
