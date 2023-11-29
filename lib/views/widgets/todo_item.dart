import 'package:bloc_course_3/core/app_colors.dart';
import 'package:bloc_course_3/models/todo_model.dart';
import 'package:flutter/material.dart';

Widget toDoItem({required TodoModel item, required int index}) {
  return Card(
    color: AppColors.greyColor,
    child: ListTile(
      isThreeLine: true,
      title: Text(
        item.title!,
        style: const TextStyle(
            color: AppColors.whiteColor,
            fontSize: 26,
            fontWeight: FontWeight.bold),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        "User : ${item.id}",
        style: const TextStyle(
            color: AppColors.whiteColor,
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
      trailing: item.completed!
          ? const Icon(
              Icons.check_box_outlined,
              color: AppColors.greenColor,
              size: 35,
            )
          : null,
      leading: CircleAvatar(
        backgroundColor: AppColors.blueGreyColor,
        child: Text("$index",
            style: const TextStyle(
                color: AppColors.whiteColor,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
      ),
    ),
  );
}
