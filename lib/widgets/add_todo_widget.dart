import 'package:flutter/material.dart';
import 'package:responsive/widgets/custom_textfield.dart';

class AddTodoWidget extends StatelessWidget {
  AddTodoWidget(
      {super.key,
      required this.idController,
      required this.titleController,
      required this.descriptionController,
      this.btnTitle,
      this.onPress,
      this.mainAxisSize});

  final TextEditingController idController;
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  String? btnTitle;
  Function()? onPress;
  MainAxisSize? mainAxisSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: mainAxisSize ?? MainAxisSize.max,
      children: [
        CustomTextField(
            label: 'Id', hintText: 'Enter your Id', controller: idController),
        CustomTextField(
          label: 'Title',
          hintText: 'Enter your todo title',
          controller: titleController,
          textInputType: TextInputType.name,
        ),
        CustomTextField(
          label: 'Description',
          hintText: 'Enter your todo description',
          controller: descriptionController,
          textInputType: TextInputType.name,
          textInputAction: TextInputAction.done,
        ),
        SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
                onPressed: onPress, child: Text(btnTitle ?? 'Save'))),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
