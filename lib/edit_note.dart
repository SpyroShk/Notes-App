import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/models/note.dart';
import 'cubit/notes_cubit.dart';
import 'models/validator.dart';

class EditNote extends StatefulWidget {
  final Note? note;
  const EditNote({Key? key, this.note}) : super(key: key);

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  final _formKey = GlobalKey<FormState>();
  go(BuildContext context) async {
    if (_formKey.currentState!.validate()) {}
  }

  @override
  void initState() {
    titleText = widget.note?.title;
    descriptionText = widget.note?.description;

    super.initState();
  }

  String? titleText;
  String? descriptionText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8EEE2),
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: 60,
        leading: IconButton(
            icon: SvgPicture.asset('assets/icons/Arrow left 1.svg'),
            onPressed: () => context.go("/")
            // Navigator.pop(context);
            ),
        title: Text(
          widget.note == null ? 'Add note' : 'Edit Note',
          style: const TextStyle(
            color: Color(0xFF403B36),
            fontWeight: FontWeight.w900,
            fontSize: 15,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert_rounded,
              color: Color(0xFF403B36),
            ),
          ),
          const SizedBox(width: 10)
        ],
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              TextFormField(
                initialValue: widget.note?.title,
                validator: Validator.validateTitle,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter Title',
                  hintStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF403B36),
                  ),
                ),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF403B36),
                ),
                onChanged: (value) {
                  titleText = value;
                },
              ),
              Expanded(
                child: TextFormField(
                  initialValue: widget.note?.description,
                  validator: Validator.validateDesc,
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter Description',
                    hintStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF595550),
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF595550),
                  ),
                  onChanged: (value) {
                    descriptionText = value;
                  },
                ),
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: const Color(0xFFD9614C),
                height: 74,
                minWidth: 319,
                onPressed: () {
                  final go = _formKey.currentState!.validate();
                  if (go) {
                    if (widget.note == null) {
                      final note = Note(
                          id: DateTime.now().toString(),
                          title: titleText!,
                          description: descriptionText!);
                      context
                          .read<NotesCubit>()
                          // Provider.of<NoteOperation>(context, listen: false)
                          .addNote(note
                              // DateTime.now().toString(), titleText!,
                              //   descriptionText!
                              );
                    } else {
                      context
                          .read<NotesCubit>()
                          // Provider.of<NoteOperation>(context, listen: false)
                          .editNote(
                            titleText!,
                            descriptionText!,
                            widget.note!.id,
                          );
                    }
                    context.go("/");
                    // Navigator.of(context).pop();
                  }
                },
                child: Text(
                  (widget.note == null) ? 'Add Note' : 'Save Note',
                  style: const TextStyle(
                      letterSpacing: 2.5,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 90,
              )
            ],
          ),
        ),
      ),
    );
  }
}
