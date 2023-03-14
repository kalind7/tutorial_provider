import 'package:flutter/material.dart';
import 'package:responsive/model/todo_model.dart';

import '../../widgets/add_todo_widget.dart';

class TabScreenThree extends StatefulWidget {
  const TabScreenThree({super.key});

  @override
  State<TabScreenThree> createState() => _TabScreenThreeState();
}

class _TabScreenThreeState extends State<TabScreenThree> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _idController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  List<TodoModel> todoList = [];

  Future<bool> addTodo(TodoModel model) {
    todoList.add(model);
    setState(() {});

    return Future.value(true);
  }

  Future<bool> updateTodo(TodoModel model) {
    var index = todoList.indexWhere((todo) => todo.id == model.id);
    todoList[index] = model;
    setState(() {});

    return Future.value(true);
  }

  removeTodo(TodoModel model) {
    todoList.removeWhere((todo) => todo.id == model.id);
    setState(() {});
  }

  clear() {
    _idController.clear();
    _titleController.clear();
    _descriptionController.clear();
  }

  fillData(TodoModel model) {
    _idController.text = model.id.toString();
    _titleController.text = model.title;
    _descriptionController.text = model.description;
  }

  final _addFormKey = GlobalKey<FormState>();
  final _updateFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23.0, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              key: _addFormKey,
              child: AddTodoWidget(
                idController: _idController,
                titleController: _titleController,
                descriptionController: _descriptionController,
                btnTitle: 'Add',
                onPress: () {
                  var model = TodoModel(
                      id: _idController.text.isEmpty
                          ? 0
                          : int.parse(_idController.text),
                      title: _titleController.text,
                      description: _descriptionController.text);
                  if (_addFormKey.currentState!.validate()) {
                    addTodo(model).then((value) {
                      print(value);
                      if (value) {
                        clear();
                      }
                    });
                  }
                },
              ),
            ),
            todoList.isEmpty
                ? Center(
                    child: Text(
                    'Your todo list is empty'.toUpperCase(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ))
                : ListView.separated(
                    shrinkWrap: true,
                    primary: false,
                    separatorBuilder: (context, index) {
                      return Column(
                        children: const [
                          SizedBox(
                            height: 10,
                          ),
                          Divider(
                            thickness: 1,
                            color: Colors.black,
                          )
                        ],
                      );
                    },
                    itemCount: todoList.length,
                    itemBuilder: (context, index) {
                      var todoDatas = todoList[index];
                      return InkWell(
                        onTap: () {
                          fillData(todoDatas);
                          updateDialog(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(todoDatas.id.toString()),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(todoDatas.title),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(todoDatas.description)
                              ],
                            ),
                            IconButton(
                                onPressed: () {
                                  removeTodo(todoDatas);
                                },
                                icon: const Icon(Icons.delete))
                          ],
                        ),
                      );
                    })
          ],
        ),
      ),
    );
  }

  Future<dynamic> updateDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
            title: const Text('Are you sure to update database'),
            content: SingleChildScrollView(
              child: Form(
                key: _updateFormKey,
                child: AddTodoWidget(
                  idController: _idController,
                  titleController: _titleController,
                  descriptionController: _descriptionController,
                  btnTitle: 'Update Datas',
                  onPress: () {
                    var updateModel = TodoModel(
                        id: _idController.text.isEmpty
                            ? 0
                            : int.parse(_idController.text),
                        title: _titleController.text,
                        description: _descriptionController.text);

                    if (_updateFormKey.currentState!.validate()) {
                      updateTodo(updateModel).then((value) {
                        clear();
                        Navigator.pop(context);
                      });
                    }
                  },
                  mainAxisSize: MainAxisSize.min,
                ),
              ),
            )));
  }
}
