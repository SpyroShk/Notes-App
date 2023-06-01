// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/recent_notes.dart';

import 'cubit/notes_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(builder: (context, state) {
      if (state is NotesLoaded) {
        return Scaffold(
          backgroundColor: const Color(0xFFF8EEE2),
          appBar: AppBar(
            toolbarHeight: 80,
            elevation: 0,
            backgroundColor: Colors.transparent,
            leadingWidth: 60,
            leading: IconButton(
              icon: SvgPicture.asset('assets/icons/align-left-1.svg'),
              onPressed: () {},
            ),
            title: Text(
              state.notes.isNotEmpty ? 'Recent Notes' : 'All Notes',
              style: TextStyle(
                color: Color(0xFF403B36),
                fontWeight: FontWeight.w900,
                fontSize: 15,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  context.go("/editPage");
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const EditNote()));
                },
                icon: Icon(state.notes.isNotEmpty ? Icons.add : null),
                color: const Color(0xFF403B36),
              ),
              const SizedBox(width: 10),
            ],
            centerTitle: true,
          ),
          body: state.notes.isNotEmpty
              ? RecentNotes()
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(38),
                          child: Image.asset('assets/homepic.png'),
                        ),
                        const Text(
                          'Create Your First Note',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF403B36),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Add a note about anything (your thoughts on climate change, or your history essay) and share it witht the world.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF595550),
                          ),
                        ),
                        const SizedBox(
                          height: 75,
                        ),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          color: const Color(0xFFD9614C),
                          height: 74,
                          minWidth: 319,
                          onPressed: (() {
                            context.go("/editPage");
                          }),
                          child: const Text(
                            'Create A Note',
                            style: TextStyle(
                                letterSpacing: 2.5,
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        );
      }
      return CircularProgressIndicator();
    });
  }
}
