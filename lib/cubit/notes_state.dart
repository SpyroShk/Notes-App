part of 'notes_cubit.dart';

abstract class NotesState extends Equatable {
  const NotesState();

  @override
  List<Object> get props => [];
}

@immutable
class NotesLoaded extends NotesState {
  final List<Note> notes;
  const NotesLoaded({required this.notes});

  @override
  List<Object> get props => [notes];
}
