import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive/provider/api_provider.dart';
import 'package:responsive/provider/home_page_provider.dart';
import 'package:responsive/screens/home_page.dart';
import 'package:responsive/widgets/custom_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeProvider(),
        ),
        ChangeNotifierProvider(create: (_) => ApiProvider()..init())
      ],
      child: MaterialApp(
        title: 'Responsive',
        debugShowCheckedModeBanner: false,
        theme: CustomTheme.customTheme(),
        home: const HomePage(),
      ),
    );
  }
}
