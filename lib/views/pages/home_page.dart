import 'package:bloc_course_3/bloc/todos_bloc.dart';
import 'package:bloc_course_3/core/app_colors.dart';
import 'package:bloc_course_3/core/app_sizing.dart';
import 'package:bloc_course_3/views/widgets/error_widget.dart';
import 'package:bloc_course_3/views/widgets/todo_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    if (currentScroll >= (maxScroll * 0.9)) {
      context.read<TodosBloc>().add(GetToDosEvent());
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.greyColor,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          centerTitle: true,
          backgroundColor: AppColors.greyColor,
          title: const Text(
            "ToDos",
            style: TextStyle(
                color: AppColors.blueGreyColor,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.blueGreyColor,
                borderRadius: BorderRadius.circular(8)),
            margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<TodosBloc, ToDosState>(
              builder: (context, state) {
                switch (state.toDoStatus) {
                  case ToDoStatus.loading:
                    return const CircularProgressIndicator(
                      color: AppColors.greyColor,
                    );
                  case ToDoStatus.success:
                    return ListView.builder(
                      controller: _scrollController,
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.toDos.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (index == state.toDos.length - 1 &&
                            !state.noMoreData) {
                          return Container(
                            height: 35,
                            margin: EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal:
                                    AppSizing.widthtSize(context) / 2 - 35),
                            child: const CircularProgressIndicator(
                              color: AppColors.greyColor,
                            ),
                          );
                        }
                        return toDoItem(item: state.toDos[index], index: index);
                      },
                    );
                  case ToDoStatus.error:
                    return MyErrorWidget(
                        msg: state.errorMessage,
                        onPressed: () {
                          BlocProvider.of<TodosBloc>(context)
                              .add(GetToDosEvent());
                        });
                }
              },
            ),
          ),
        ));
  }
}
