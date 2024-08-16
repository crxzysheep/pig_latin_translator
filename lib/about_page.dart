import 'package:flutter/material.dart';


class PigLatinTranslator extends StatelessWidget {
  const PigLatinTranslator({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 57, 161, 175)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Pig Latin Translator'),
    );
  }
}