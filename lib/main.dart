import 'package:bloc_course_3/bloc/todos_bloc.dart';
import 'package:bloc_course_3/crud/todos_apis.dart';
import 'package:bloc_course_3/views/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/todos_observer.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: "/",
      routes: {
        "/": (_) => BlocProvider(
              create: (_) => TodosBloc(
                toDosApi: ToDosApi(),
              )..add(GetToDosEvent()),
              child: const HomePage(),
            )
      },
    );
  }
}
