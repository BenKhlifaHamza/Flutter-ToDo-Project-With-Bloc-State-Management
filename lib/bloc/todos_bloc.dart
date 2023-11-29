import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:bloc_course_3/crud/todos_apis.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_course_3/models/todo_model.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, ToDosState> {
  final ToDosApi toDosApi;
  TodosBloc({required this.toDosApi}) : super(const ToDosState()) {
    on<TodosEvent>(transformer: droppable(), (event, emit) async {
      if (event is GetToDosEvent) {
        if (state.noMoreData) return;
        try {
          switch (state.toDoStatus) {
            case ToDoStatus.loading:
              final toDos = await toDosApi.getTodos();
              emit(state.copyWith(
                toDos: toDos,
                toDoStatus: ToDoStatus.success,
                //toDoStatus: ToDoStatus.success
              ));
              break;
            case ToDoStatus.success:
              final toDos = await toDosApi.getTodos(state.toDos.length);
              if (toDos.isNotEmpty) {
                emit(state.copyWith(
                  toDos: List.of(state.toDos)..addAll(toDos),

                  //toDoStatus: ToDoStatus.success
                  //toDoStatus: ToDoStatus.success
                ));
              } else {
                emit(state.copyWith(
                  noMoreData: true,
                ));
              }

            case ToDoStatus.error:
              emit(state.copyWith(
                  toDoStatus: ToDoStatus.error,
                  errorMessage: "Failed To Fetch ToDos"));
              break;
            default:
          }
        } catch (e) {
          emit(state.copyWith(
              toDoStatus: ToDoStatus.error,
              errorMessage: "Failed To Fetch ToDos"));
        }
      }
    });
  }
}
