import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../screens/tabbar_screens/screen1.dart';
import '../screens/tabbar_screens/screen2.dart';
import '../screens/tabbar_screens/screen3.dart';
// import '../screens/tabbar_screens/screen3.dart';

class HomeProvider extends ChangeNotifier {
  final List<Widget> tabs = [
    const Text('Tab 1'),
    const Text('Tab 2'),
    const Text('Tab 3'),
    // const Text('Offline database')
  ];

  final List<Widget> tabScreens = [
    const TabScreenOne(),
    TabbarScreenTwo(),
    TabScreenThree()
    // const Text('data 3')
  ];

  ImagePicker picker = ImagePicker();
  XFile? pickedFile;

  Future<dynamic> imagePick(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    onTap: () async {
                      var pickedImageFromGallery =
                          await picker.pickImage(source: ImageSource.gallery);

                      pickedFile = pickedImageFromGallery;
                      Navigator.pop(context);
                      notifyListeners();
                    },
                    title: const Text('Select image from gallery'),
                    leading: const Icon(Icons.photo),
                    trailing: const Icon(
                      Icons.keyboard_arrow_right,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    onTap: () async {
                      var pickedImageFromCamera =
                          await picker.pickImage(source: ImageSource.camera);

                      pickedFile = pickedImageFromCamera;
                      Navigator.pop(context);
                      notifyListeners();
                    },
                    leading: const Icon(Icons.camera_alt),
                    title: const Text('Select image from camera'),
                    trailing: const Icon(
                      Icons.keyboard_arrow_right,
                    ),
                  ),
                ],
              ),
            ));
  }
}
