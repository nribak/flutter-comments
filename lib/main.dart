import 'package:comments_app/src/app.dart';
import 'package:comments_app/src/data/blocs/comments/comments_events.dart';
import 'package:comments_app/src/data/blocs/comments_bloc.dart';
import 'package:comments_app/src/data/di/app_di_resolver.dart';
import 'package:comments_app/src/data/di/app_injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  diSetup(AppEnvironment.prod);
  runApp(MaterialApp(
      title: "comments app",
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: BlocProvider(
        create: (_) => CommentsBloc.newInstance(
            repository: DIResolver.instance().repository(),
            initialEvent: FetchCommentsEvent()
        ),
        child: const App(),
      )
    )
  );
}

