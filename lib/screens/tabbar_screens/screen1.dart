import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive/provider/api_provider.dart';
import 'package:responsive/provider/home_page_provider.dart';
import 'package:responsive/screens/detail_page.dart';

class TabScreenOne extends StatelessWidget {
  const TabScreenOne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer2<HomeProvider, ApiProvider>(
        builder: (context, homeProv, apiProv, child) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Screen of Tab 1'),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Stack(
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
                            color: Colors.grey.shade300,
                            shape: BoxShape.circle),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            apiProv.mainPostList.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: apiProv.mainPostList.length,
                    itemBuilder: (context, index) {
                      var postDatas = apiProv.mainPostList[index];
                      // print(homeProv.mainPostList.length);

                      return InkWell(
                        onTap: () async {
                          await apiProv.fetchDetailModel(id: postDatas.id);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DetailPage()));
                        },
                        child: Container(
                          margin: const EdgeInsets.all(15),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 7.5),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(color: Colors.black54, width: 1.25),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 0.2,
                                  blurRadius: 0.2,
                                  offset: Offset(1, 2)),
                            ],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(postDatas.id.toString()),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(postDatas.userId.toString()),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(postDatas.title),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(postDatas.body),
                            ],
                          ),
                        ),
                      );
                    })
          ],
        ),
      );
    });
  }
}
