import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/routing.dart';
import 'package:url_strategy/url_strategy.dart';
import 'cubit/notes_cubit.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => BlocProvider<NotesCubit>(
        create: (context) => NotesCubit(),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily:
                GoogleFonts.nunito(fontWeight: FontWeight.w700).fontFamily,
          ),
          routerDelegate: AppRoute.router.routerDelegate,
          routeInformationParser: AppRoute.router.routeInformationParser,
          routeInformationProvider: AppRoute.router.routeInformationProvider,
          // home: const HomePage(),
        ),
      );
}
