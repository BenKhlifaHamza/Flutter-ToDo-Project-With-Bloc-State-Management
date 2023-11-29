part of 'todos_bloc.dart';

enum ToDoStatus { loading, success, error }

class ToDosState {
  final ToDoStatus toDoStatus;
  final bool noMoreData;
  final String errorMessage;
  final List<TodoModel> toDos;

  const ToDosState({
    this.toDoStatus = ToDoStatus.loading,
    this.noMoreData = false,
    this.errorMessage = "",
    this.toDos = const [],
  });

  ToDosState copyWith({
    ToDoStatus? toDoStatus,
    bool? noMoreData,
    String? errorMessage,
    List<TodoModel>? toDos,
  }) {
    return ToDosState(
      toDoStatus: toDoStatus ?? this.toDoStatus,
      noMoreData: noMoreData ?? this.noMoreData,
      errorMessage: errorMessage ?? this.errorMessage,
      toDos: toDos ?? this.toDos,
    );
  }
}
