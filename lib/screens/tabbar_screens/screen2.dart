import 'package:flutter/material.dart';
import 'package:responsive/apis/api.dart';

import '../../widgets/custom_textfield.dart';

class TabbarScreenTwo extends StatelessWidget {
  TabbarScreenTwo({super.key});

  final TextEditingController userIdController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  clear() {
    userIdController.clear();
    titleController.clear();
    bodyController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23.0, vertical: 15),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                  label: 'User Id',
                  hintText: 'Enter your userId',
                  controller: userIdController),
              CustomTextField(
                label: 'Title',
                hintText: 'Enter your title',
                controller: titleController,
                textInputType: TextInputType.name,
              ),
              CustomTextField(
                label: 'Body',
                hintText: 'Enter your body',
                controller: bodyController,
                textInputType: TextInputType.name,
                textInputAction: TextInputAction.done,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        var datas = {
                          "userId": userIdController.text,
                          "title": titleController.text,
                          "body": bodyController.text
                        };

                        Apis.postServerDatas(datas).then((value) {
                          clear();
                        });
                      }
                    },
                    child: const Text('Post Datas')),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        var datas = {
                          "userId": userIdController.text,
                          "title": titleController.text,
                          "body": bodyController.text
                        };

                        Apis.updateServerDatas(id: 100, datas: datas)
                            .then((value) {
                          clear();
                        });
                      }
                    },
                    child: const Text('Update Datas')),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Apis.deleteDatas(id: 100);
                      }
                    },
                    child: const Text('Delete Datas')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
