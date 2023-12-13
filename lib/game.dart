import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word Matching Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WordMatchingGameScreen(),
    );
  }
}

class WordMatchingGameScreen extends StatefulWidget {
  @override
  _WordMatchingGameScreenState createState() => _WordMatchingGameScreenState();
}

class _WordMatchingGameScreenState extends State<WordMatchingGameScreen> {
  Map<String, String> wordPairs = {
    'flutter': 'titreme',
    'dart': 'ok',
    'widget': 'araç',
    'mobile': 'taşınabilir',
    'application': 'uygulama',
  };

  List<String> shuffledWords = [];
  late Map<String, String> currentPair;
  String message = '';

  @override
  void initState() {
    super.initState();
    generateWords();
  }

  void generateWords() {
    shuffledWords = wordPairs.keys.toList()..shuffle();
    currentPair = {shuffledWords[0]: wordPairs[shuffledWords[0]]!};
  }

  void checkAnswer(String selectedWord) {
    if (selectedWord == currentPair.keys.first) {
      setState(() {
        message = 'Correct! Well done!';
      });
      // Wait for 1 second before moving to the next word pair
      Future.delayed(Duration(seconds: 1), () {
        nextWordPair();
      });
    } else {
      setState(() {
        message = 'Incorrect. Try again!';
      });
    }
  }
vvs
  void nextWordPair() {
    setState(() {
      message = '';
      shuffledWords.removeAt(0);
      if (shuffledWords.isNotEmpty) {
        currentPair = {shuffledWords[0]: wordPairs[shuffledWords[0]]!};
      } else {
        message = 'Congratulations! You matched all words.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Word Matching Game'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Match the English word with its Turkish equivalent:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              currentPair.keys.first,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: wordPairs.values
                  .map((turkishWord) => ElevatedButton(
                onPressed: () => checkAnswer(turkishWord),
                child: Text(turkishWord),
              ))
                  .toList(),
            ),
            SizedBox(height: 20),
            Text(
              message,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: message.contains('Correct') ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
