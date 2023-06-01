import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/home_page.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'cubit/notes_cubit.dart';

class RecentNotes extends StatefulWidget {
  const RecentNotes({Key? key}) : super(key: key);

  @override
  State<RecentNotes> createState() => _RecentNotesState();
}

class _RecentNotesState extends State<RecentNotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8EEE2),
      body: BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) {
          if (state is NotesLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: MasonryGridView.builder(
                scrollDirection: Axis.vertical,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                itemCount: state.notes.length,
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  final note = state.notes[index];
                  return GestureDetector(
                    onTap: () {
                      context.go("/editPage", extra: note);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: const Color(0xFFFFFDFA),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              constraints: const BoxConstraints(),
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                if (state.notes.isEmpty) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomePage()));
                                }
                                context.read<NotesCubit>().removeNote(note.id);
                              },
                              icon: const Icon(Icons.delete),
                              color: const Color(0xFF403B36),
                            ),
                          ),
                          Text(
                            note.title,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                color: Color(0xFF595550)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            note.description,
                            maxLines: 11,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF595550)),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
