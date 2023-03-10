import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive/provider/home_page_provider.dart';

class TabScreenOne extends StatefulWidget {
  const TabScreenOne({
    super.key,
  });

  @override
  State<TabScreenOne> createState() => _TabScreenOneState();
}

class _TabScreenOneState extends State<TabScreenOne> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, homeProv, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Screen of Tab 1'),
          const SizedBox(
            height: 10,
          ),
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              homeProv.pickedFile?.path == null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CachedNetworkImage(
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                        imageUrl:
                            'https://images.unsplash.com/photo-1617040619263-41c5a9ca7521?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.file(
                        File(homeProv.pickedFile!.path),
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
              Positioned(
                right: 20,
                bottom: 30,
                child: InkWell(
                  onTap: () {
                    homeProv.imagePick(context);
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300, shape: BoxShape.circle),
                    child: const Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      );
    });
  }
}
