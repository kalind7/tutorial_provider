import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive/provider/api_provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    super.key,
  });

  // final PostModel postModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Detail Page'),
            floating: true,
            snap: true,
            // flexibleSpace: ,
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) =>
                      Consumer<ApiProvider>(builder: (context, apiProv, child) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(15),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 7.5),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: Colors.black54, width: 1.25),
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
                                  Text(apiProv.postDetailModel?.id.toString() ??
                                      'dataas'),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(apiProv.postDetailModel?.userId
                                          .toString() ??
                                      ''),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(apiProv.postDetailModel?.title ?? ''),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(apiProv.postDetailModel?.body ?? ''),
                                ],
                              ),
                            ),
                          ],
                        );
                      }),
                  childCount: 1))
        ],
      ),
    );
  }
}
