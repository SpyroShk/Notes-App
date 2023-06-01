import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'edit_note.dart';
import 'home_page.dart';
import 'models/note.dart';

class AppRoute {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: <GoRoute>[
      GoRoute(
        path: "/",
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
        routes: <GoRoute>[
          GoRoute(
            path: "editPage",
            builder: (BuildContext context, GoRouterState state) {
              return EditNote(note: state.extra as Note?);
            },
          ),
        ],
      )
    ],
  );
}
