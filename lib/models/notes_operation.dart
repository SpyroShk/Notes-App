// import 'package:flutter/cupertino.dart';

// import 'note.dart';

// class NoteOperation extends ChangeNotifier {
//   final List<Note> _notes = [];
//   List<Note> get getNotes => _notes;

//   void addNewNote(String id, String title, String description) {
//     Note note = Note(id: id, title: title, description: description);
//     _notes.add(note);
//     notifyListeners();
//   }

//   void removeNotes(int index) {
//     _notes.removeAt(index);
//     notifyListeners();
//   }

//   void editNote(String title, String description, String id) {
//     Note note = _notes.firstWhere((element) => element.id == id);
//     note.title = title;
//     note.description = description;

//     final index = _notes.indexWhere((element) => element.id == id);
//     _notes[index] = note;
//     notifyListeners();
//   }
// }
