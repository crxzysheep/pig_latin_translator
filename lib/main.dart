import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const PigLatinTranslator());
}

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String inputText = "text shows here";
  final _vowelList = <String> {'a', 'e', 'i', 'o', 'u'};
  TextEditingController _controller = TextEditingController();

  void _translateText(String text) {
    setState(() {
      List<String> splittedText = text.toLowerCase().split(' ');
      String translatedText = '';

      for(int i = 0; i < splittedText.length; i++){
        String word = splittedText[i];
        for(int char = 0; char < word.length; char++){
          if(_vowelList.contains(word[char])) {
            if (char == 0) {
              word += 'way';
              break;
            }
            else {
              word =
                  word.substring(char) + word.substring(0, char) + 'ay';
              break;
            }
          }
        }
        translatedText += word + ' ';
      }
      inputText = translatedText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'Open shopping cart',
            onPressed: () {
              // handle the press
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('English to Pig Latin translator'),
            const SizedBox(height: 10),
            SizedBox(
              width: 250,
              child: TextField(

                onSubmitted: (text) {
                  _translateText(text);
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Type something',
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 400,
              child: Text(
                inputText,
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.center,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
