import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive/provider/home_page_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Consumer<HomeProvider>(builder: (context, homeProv, child) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Appbar'),
              bottom: TabBar(tabs: homeProv.tabs),
            ),
            body: TabBarView(children: homeProv.tabScreens));
      }),
    );
  }
}
