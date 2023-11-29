part of 'todos_bloc.dart';

sealed class TodosEvent {
  const TodosEvent();
}

class GetToDosEvent extends TodosEvent {}
