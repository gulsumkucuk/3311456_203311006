import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

import 'homePage.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '1.level:Kelime Eşleştirme Oyunu',
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
    'Application': 'Uygulama',
    'After': 'Sonra',
    'Answer': 'Cevap',
    // Add more w-ord pairs if needed
  };

  late String currentEnglishWord;
  late String correctTurkishTranslation;
  List<String> shuffledTurkishWords = [];
  Set<String> answeredWords = Set<String>();
  int correctAnswersCount = 0;

  @override
  void initState() {
    super.initState();
    startGame();
  }

  void startGame() {
    List<String> englishWords = wordPairs.keys.toList();
    englishWords.shuffle();

    currentEnglishWord = englishWords[0];
    correctTurkishTranslation = wordPairs[currentEnglishWord]!;

    List<String> allTurkishWords = wordPairs.values.toList();
    allTurkishWords.shuffle();

    // Ensure the correct answer is included in the options
    if (!allTurkishWords.contains(correctTurkishTranslation)) {
      allTurkishWords[0] = correctTurkishTranslation;
    }

    shuffledTurkishWords = allTurkishWords;
  }

  void checkAnswer(String selectedTurkishWord) {
    if (selectedTurkishWord == correctTurkishTranslation) {
      setState(() {
        answeredWords.add(currentEnglishWord);
        correctAnswersCount++;
        showNextWord();
      });
    } else {
      // Handle incorrect answer logic if needed
    }
  }

  void showNextWord() {
    setState(() {
      shuffledTurkishWords.shuffle();
      if (answeredWords.length == wordPairs.length) {
        // If all words are answered, show congratulations message and navigate to the second game screen
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Tebrikler! 1. leveli geçtiniz..'),
              content: Text('İkinci aşamaya geçtiniz.'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SecondGameScreen()),
                    );
                  },
                  child: Text('Devam Et'),
                ),
              ],
            );
          },
        );

        // Reset the game
        answeredWords.clear();
        correctAnswersCount = 0;
      } else {
        // Find a new English word that hasn't been answered yet
        currentEnglishWord = wordPairs.keys.firstWhere(
              (word) => !answeredWords.contains(word),
        );

        correctTurkishTranslation = wordPairs[currentEnglishWord]!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('1.level:Kelime Eşleştirme Oyunu'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/blue.jpg'), // blue.jpg adlı asset dosyası
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'İngilizce kelimeyi Türkçe anlamıyla eşleştir:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Doğru Cevaplar: $correctAnswersCount',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Toplam Kelimeler: ${wordPairs.length}',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                currentEnglishWord,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: shuffledTurkishWords
                    .map(
                      (turkishWord) => ElevatedButton(
                    onPressed: () {
                      checkAnswer(turkishWord);
                    },
                    child: Text(turkishWord),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                            (states) {
                          if (answeredWords.contains(currentEnglishWord) &&
                              turkishWord == wordPairs[currentEnglishWord]) {
                            return Colors.green; // Correctly answered
                          } else {
                            return null; // Use default button color
                          }
                        },
                      ),
                    ),
                  ),
                )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondGameScreen extends StatefulWidget {
  @override
  _SecondGameScreenState createState() => _SecondGameScreenState();
}

class _SecondGameScreenState extends State<SecondGameScreen> {
  Map<String, String> secondWordPairs = {
    'Back': 'arka',
    'Backpack': 'Sırt Çantası',
    'Bad': 'Kötü',

  };

  late String currentSecondEnglishWord;
  late String correctSecondTurkishTranslation;
  List<String> shuffledSecondTurkishWords = [];
  Set<String> answeredSecondWords = Set<String>();
  int correctSecondAnswersCount = 0;

  @override
  void initState() {
    super.initState();
    startSecondGame();
  }

  void startSecondGame() {
    List<String> secondEnglishWords = secondWordPairs.keys.toList();
    secondEnglishWords.shuffle();

    currentSecondEnglishWord = secondEnglishWords[0];
    correctSecondTurkishTranslation = secondWordPairs[currentSecondEnglishWord]!;

    List<String> allSecondTurkishWords = secondWordPairs.values.toList();
    allSecondTurkishWords.shuffle();

    // Ensure the correct answer is included in the options
    if (!allSecondTurkishWords.contains(correctSecondTurkishTranslation)) {
      allSecondTurkishWords[0] = correctSecondTurkishTranslation;
    }

    shuffledSecondTurkishWords = allSecondTurkishWords;
  }

  void checkSecondAnswer(String selectedSecondTurkishWord) {
    if (selectedSecondTurkishWord == correctSecondTurkishTranslation) {
      setState(() {
        answeredSecondWords.add(currentSecondEnglishWord);
        correctSecondAnswersCount++;
        showNextSecondWord();
      });
    } else {
      // Handle incorrect answer logic if needed
    }
  }

  void showNextSecondWord() {
    setState(() {
      shuffledSecondTurkishWords.shuffle();
      if (answeredSecondWords.length == secondWordPairs.length) {
        // If all words are answered, show congratulations message and navigate to the third game screen
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Tebrikler! 2.leveli geçtiniz..'),
              content: Text('İkinci aşamayı tamamladınız. Üçüncü aşamaya geçmek ister misiniz?'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => ThirdGameScreen()),
                    );
                  },
                  child: Text('Evet'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                  },
                  child: Text('Hayır'),
                ),
              ],
            );
          },
        );
      } else {
        // Find a new English word that hasn't been answered yet
        currentSecondEnglishWord = secondWordPairs.keys.firstWhere(
              (word) => !answeredSecondWords.contains(word),
        );

        correctSecondTurkishTranslation = secondWordPairs[currentSecondEnglishWord]!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('2.level:Kelime Eşleştirme Oyunu'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'İkinci aşama: İngilizce kelimeyi Türkçe anlamıyla eşleştir:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Doğru Cevaplar: $correctSecondAnswersCount',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Toplam Kelimeler: ${secondWordPairs.length}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              currentSecondEnglishWord,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: shuffledSecondTurkishWords
                  .map(
                    (turkishWord) => ElevatedButton(
                  onPressed: () {
                    checkSecondAnswer(turkishWord);
                  },
                  child: Text(turkishWord),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                          (states) {
                        if (answeredSecondWords.contains(currentSecondEnglishWord) &&
                            turkishWord == secondWordPairs[currentSecondEnglishWord]) {
                          return Colors.green; // Correctly answered
                        } else {
                          return null; // Use default button color
                        }
                      },
                    ),
                  ),
                ),
              )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class ThirdGameScreen extends StatefulWidget {
  @override
  _ThirdGameScreenState createState() => _ThirdGameScreenState();
}

class _ThirdGameScreenState extends State<ThirdGameScreen> {
  Map<String, String> thirdWordPairs = {
    'Cabbage': 'lahana',
    'Carpet': 'Halı',
    'Car': 'Araba',

  };

  late String currentThirdEnglishWord;
  late String correctThirdTurkishTranslation;
  List<String> shuffledThirdTurkishWords = [];
  Set<String> answeredThirdWords = Set<String>();
  int correctThirdAnswersCount = 0;

  @override
  void initState() {
    super.initState();
    startThirdGame();
  }

  void startThirdGame() {
    List<String> thirdEnglishWords = thirdWordPairs.keys.toList();
    thirdEnglishWords.shuffle();

    currentThirdEnglishWord = thirdEnglishWords[0];
    correctThirdTurkishTranslation = thirdWordPairs[currentThirdEnglishWord]!;

    List<String> allThirdTurkishWords = thirdWordPairs.values.toList();
    allThirdTurkishWords.shuffle();

    // Ensure the correct answer is included in the options
    if (!allThirdTurkishWords.contains(correctThirdTurkishTranslation)) {
      allThirdTurkishWords[0] = correctThirdTurkishTranslation;
    }

    shuffledThirdTurkishWords = allThirdTurkishWords;
  }

  void checkThirdAnswer(String selectedThirdTurkishWord) {
    if (selectedThirdTurkishWord == correctThirdTurkishTranslation) {
      setState(() {
        answeredThirdWords.add(currentThirdEnglishWord);
        correctThirdAnswersCount++;
        showNextThirdWord();
      });
    } else {
      // Handle incorrect answer logic if needed
    }
  }

  void showNextThirdWord() {
    setState(() {
      shuffledThirdTurkishWords.shuffle();
      if (answeredThirdWords.length == thirdWordPairs.length) {
        // If all words are answered, show congratulations message
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Tebrikler! 3.leveli geçtiniz..'),
              content: Text('Üçüncü aşamayı tamamladınız. Dördüncü aşamaya geçmek ister misiniz?'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => FourthGameScreen()),
                    );
                  },
                  child: Text('Evet'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                  },
                  child: Text('Hayır'),
                ),
              ],
            );
          },
        );
      } else {
        // Find a new English word that hasn't been answered yet
        currentThirdEnglishWord = thirdWordPairs.keys.firstWhere(
              (word) => !answeredThirdWords.contains(word),
        );

        correctThirdTurkishTranslation = thirdWordPairs[currentThirdEnglishWord]!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('3.level:Kelime Eşleştirme Oyunu'),
          centerTitle: true,
        ),
        body: Padding(
        padding: const EdgeInsets.all(16.0),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text(
    'Üçüncü aşama: İngilizce kelimeyi Türkçe anlamıyla eşleştir:',
    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Doğru Cevaplar: $correctThirdAnswersCount',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            'Toplam Kelimeler: ${thirdWordPairs.length}',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
      SizedBox(height: 20),
      Text(
        currentThirdEnglishWord,
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 20),
      Wrap(
        spacing: 10,
        runSpacing: 10,
        children: shuffledThirdTurkishWords
            .map(
              (turkishWord) => ElevatedButton(
            onPressed: () {
              checkThirdAnswer(turkishWord);
            },
            child: Text(turkishWord),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith(
                    (states) {
                  if (answeredThirdWords.contains(currentThirdEnglishWord) &&
                      turkishWord == thirdWordPairs[currentThirdEnglishWord]) {
                    return Colors.green; // Correctly answered
                  } else {
                    return null; // Use default button color
                  }
                },
              ),
            ),
          ),
        )
            .toList(),
      ),
    ],
    ),
        ),
    );
  }
}
class FourthGameScreen extends StatefulWidget {
  @override
  _FourthGameScreenState createState() => _FourthGameScreenState();
}

class _FourthGameScreenState extends State<FourthGameScreen> {
  Map<String, String> fourthWordPairs = {
    'Daring': 'cesur',
    'Deaf': 'Sağır',
    'Dear': 'Sevgili',


  };

  late String currentFourthEnglishWord;
  late String correctFourthTurkishTranslation;
  List<String> shuffledFourthTurkishWords = [];
  Set<String> answeredFourthWords = Set<String>();
  int correctFourthAnswersCount = 0;

  @override
  void initState() {
    super.initState();
    startFourthGame();
  }

  void startFourthGame() {
    List<String> fourthEnglishWords = fourthWordPairs.keys.toList();
    fourthEnglishWords.shuffle();

    currentFourthEnglishWord = fourthEnglishWords[0];
    correctFourthTurkishTranslation = fourthWordPairs[currentFourthEnglishWord]!;

    List<String> allFourthTurkishWords = fourthWordPairs.values.toList();
    allFourthTurkishWords.shuffle();

    // Ensure the correct answer is included in the options
    if (!allFourthTurkishWords.contains(correctFourthTurkishTranslation)) {
      allFourthTurkishWords[0] = correctFourthTurkishTranslation;
    }

    shuffledFourthTurkishWords = allFourthTurkishWords;
  }

  void checkFourthAnswer(String selectedFourthTurkishWord) {
    if (selectedFourthTurkishWord == correctFourthTurkishTranslation) {
      setState(() {
        answeredFourthWords.add(currentFourthEnglishWord);
        correctFourthAnswersCount++;
        showNextFourthWord();
      });
    } else {
      // Handle incorrect answer logic if needed
    }
  }

  void showNextFourthWord() {
    setState(() {
      shuffledFourthTurkishWords.shuffle();
      if (answeredFourthWords.length == fourthWordPairs.length) {
        // If all words are answered, show congratulations message and navigate to the third game screen
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Tebrikler! 4.leveli geçtiniz..'),
              content: Text('Dördüncü aşamayı tamamladınız.Beşinci aşamaya geçmek ister misiniz?'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => FifthGameScreen()),
                    );
                  },
                  child: Text('Evet'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                  },
                  child: Text('Hayır'),
                ),
              ],
            );
          },
        );
      } else {
        // Find a new English word that hasn't been answered yet
        currentFourthEnglishWord = fourthWordPairs.keys.firstWhere(
              (word) => !answeredFourthWords.contains(word),
        );

        correctFourthTurkishTranslation = fourthWordPairs[currentFourthEnglishWord]!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('4.level:Kelime Eşleştirme Oyunu'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'İkinci aşama: İngilizce kelimeyi Türkçe anlamıyla eşleştir:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Doğru Cevaplar: $correctFourthAnswersCount',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Toplam Kelimeler: ${fourthWordPairs.length}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              currentFourthEnglishWord,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: shuffledFourthTurkishWords
                  .map(
                    (turkishWord) => ElevatedButton(
                  onPressed: () {
                    checkFourthAnswer(turkishWord);
                  },
                  child: Text(turkishWord),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                          (states) {
                        if (answeredFourthWords.contains(currentFourthEnglishWord) &&
                            turkishWord == fourthWordPairs[currentFourthEnglishWord]) {
                          return Colors.green; // Correctly answered
                        } else {
                          return null; // Use default button color
                        }
                      },
                    ),
                  ),
                ),
              )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
class FifthGameScreen extends StatefulWidget {
  @override
  _FifthGameScreenState createState() => _FifthGameScreenState();
}

class _FifthGameScreenState extends State<FifthGameScreen> {
  Map<String, String> fifthWordPairs = {
    'Edit': 'düzenlemek',
    'Ear': 'Kulak',
    'Earth': 'Dünya',

  };

  late String currentFifthEnglishWord;
  late String correctFifthTurkishTranslation;
  List<String> shuffledFifthTurkishWords = [];
  Set<String> answeredFifthWords = Set<String>();
  int correctFifthAnswersCount = 0;

  @override
  void initState() {
    super.initState();
    startFifthGame();
  }

  void startFifthGame() {
    List<String> fifthEnglishWords = fifthWordPairs.keys.toList();
    fifthEnglishWords.shuffle();

    currentFifthEnglishWord = fifthEnglishWords[0];
    correctFifthTurkishTranslation = fifthWordPairs[currentFifthEnglishWord]!;

    List<String> allFifthTurkishWords = fifthWordPairs.values.toList();
    allFifthTurkishWords.shuffle();

    // Ensure the correct answer is included in the options
    if (!allFifthTurkishWords.contains(correctFifthTurkishTranslation)) {
      allFifthTurkishWords[0] = correctFifthTurkishTranslation;
    }

    shuffledFifthTurkishWords = allFifthTurkishWords;
  }

  void checkFifthAnswer(String selectedFifthTurkishWord) {
    if (selectedFifthTurkishWord == correctFifthTurkishTranslation) {
      setState(() {
        answeredFifthWords.add(currentFifthEnglishWord);
        correctFifthAnswersCount++;
        showNextFifthWord();
      });
    } else {
      // Handle incorrect answer logic if needed
    }
  }

  void showNextFifthWord() {
    setState(() {
      shuffledFifthTurkishWords.shuffle();
      if (answeredFifthWords.length == fifthWordPairs.length) {
        // If all words are answered, show congratulations message and navigate to the third game screen
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Tebrikler! 5.leveli geçtiniz..'),
              content: Text('Beşinci aşamayı tamamladınız. Altıncı aşamaya geçmek ister misiniz?'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SixthGameScreen()),
                    );
                  },
                  child: Text('Evet'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                  },
                  child: Text('Hayır'),
                ),
              ],
            );
          },
        );
      } else {
        // Find a new English word that hasn't been answered yet
        currentFifthEnglishWord = fifthWordPairs.keys.firstWhere(
              (word) => !answeredFifthWords.contains(word),
        );

        correctFifthTurkishTranslation = fifthWordPairs[currentFifthEnglishWord]!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('5.level:Kelime Eşleştirme Oyunu'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'İkinci aşama: İngilizce kelimeyi Türkçe anlamıyla eşleştir:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Doğru Cevaplar: $correctFifthAnswersCount',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Toplam Kelimeler: ${fifthWordPairs.length}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              currentFifthEnglishWord,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: shuffledFifthTurkishWords
                  .map(
                    (turkishWord) => ElevatedButton(
                  onPressed: () {
                    checkFifthAnswer(turkishWord);
                  },
                  child: Text(turkishWord),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                          (states) {
                        if (answeredFifthWords.contains(currentFifthEnglishWord) &&
                            turkishWord == fifthWordPairs[currentFifthEnglishWord]) {
                          return Colors.green; // Correctly answered
                        } else {
                          return null; // Use default button color
                        }
                      },
                    ),
                  ),
                ),
              )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
class SixthGameScreen extends StatefulWidget {
  @override
  _SixthGameScreenState createState() => _SixthGameScreenState();
}

class _SixthGameScreenState extends State<SixthGameScreen> {
  Map<String, String> sixthWordPairs = {
    'Favorable': 'olumlu',
    'Fish': 'Balık',
    'Fire': 'Ateş',

  };

  late String currentSixthEnglishWord;
  late String correctSixthTurkishTranslation;
  List<String> shuffledSixthTurkishWords = [];
  Set<String> answeredSixthWords = Set<String>();
  int correctSixthAnswersCount = 0;

  @override
  void initState() {
    super.initState();
    startSixthGame();
  }

  void startSixthGame() {
    List<String> sixthEnglishWords = sixthWordPairs.keys.toList();
    sixthEnglishWords.shuffle();

    currentSixthEnglishWord = sixthEnglishWords[0];
    correctSixthTurkishTranslation = sixthWordPairs[currentSixthEnglishWord]!;

    List<String> allSixthTurkishWords = sixthWordPairs.values.toList();
    allSixthTurkishWords.shuffle();

    // Ensure the correct answer is included in the options
    if (!allSixthTurkishWords.contains(correctSixthTurkishTranslation)) {
      allSixthTurkishWords[0] = correctSixthTurkishTranslation;
    }

    shuffledSixthTurkishWords = allSixthTurkishWords;
  }

  void checkSixthAnswer(String selectedSixthTurkishWord) {
    if (selectedSixthTurkishWord == correctSixthTurkishTranslation) {
      setState(() {
        answeredSixthWords.add(currentSixthEnglishWord);
        correctSixthAnswersCount++;
        showNextSixthWord();
      });
    } else {
      // Handle incorrect answer logic if needed
    }
  }

  void showNextSixthWord() {
    setState(() {
      shuffledSixthTurkishWords.shuffle();
      if (answeredSixthWords.length == sixthWordPairs.length) {
        // If all words are answered, show congratulations message and navigate to the third game screen
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Tebrikler! 6.leveli geçtiniz..'),
              content: Text('Altıncı aşamayı tamamladınız. Yedinci aşamaya geçmek ister misiniz?'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SeventhGameScreen()),
                    );
                  },
                  child: Text('Evet'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                  },
                  child: Text('Hayır'),
                ),
              ],
            );
          },
        );
      } else {
        // Find a new English word that hasn't been answered yet
        currentSixthEnglishWord = sixthWordPairs.keys.firstWhere(
              (word) => !answeredSixthWords.contains(word),
        );

        correctSixthTurkishTranslation = sixthWordPairs[currentSixthEnglishWord]!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('6.level:Kelime Eşleştirme Oyunu'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'İkinci aşama: İngilizce kelimeyi Türkçe anlamıyla eşleştir:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Doğru Cevaplar: $correctSixthAnswersCount',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Toplam Kelimeler: ${sixthWordPairs.length}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              currentSixthEnglishWord,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: shuffledSixthTurkishWords
                  .map(
                    (turkishWord) => ElevatedButton(
                  onPressed: () {
                    checkSixthAnswer(turkishWord);
                  },
                  child: Text(turkishWord),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                          (states) {
                        if (answeredSixthWords.contains(currentSixthEnglishWord) &&
                            turkishWord == sixthWordPairs[currentSixthEnglishWord]) {
                          return Colors.green; // Correctly answered
                        } else {
                          return null; // Use default button color
                        }
                      },
                    ),
                  ),
                ),
              )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
class SeventhGameScreen extends StatefulWidget {
  @override
  _SeventhGameScreenState createState() => _SeventhGameScreenState();
}

class _SeventhGameScreenState extends State<SeventhGameScreen> {
  Map<String, String> seventhWordPairs = {
    'Gain': 'kazanmak',
    'Gap': 'Boşluk',
    'Generous': 'Cömert',

  };

  late String currentSeventhEnglishWord;
  late String correctSeventhTurkishTranslation;
  List<String> shuffledSeventhTurkishWords = [];
  Set<String> answeredSeventhWords = Set<String>();
  int correctSeventhAnswersCount = 0;

  @override
  void initState() {
    super.initState();
    startSeventhGame();
  }

  void startSeventhGame() {
    List<String> seventhEnglishWords = seventhWordPairs.keys.toList();
    seventhEnglishWords.shuffle();

    currentSeventhEnglishWord = seventhEnglishWords[0];
    correctSeventhTurkishTranslation = seventhWordPairs[currentSeventhEnglishWord]!;

    List<String> allSeventhTurkishWords = seventhWordPairs.values.toList();
    allSeventhTurkishWords.shuffle();

    // Ensure the correct answer is included in the options
    if (!allSeventhTurkishWords.contains(correctSeventhTurkishTranslation)) {
      allSeventhTurkishWords[0] = correctSeventhTurkishTranslation;
    }

    shuffledSeventhTurkishWords = allSeventhTurkishWords;
  }

  void checkSeventhAnswer(String selectedSeventhTurkishWord) {
    if (selectedSeventhTurkishWord == correctSeventhTurkishTranslation) {
      setState(() {
        answeredSeventhWords.add(currentSeventhEnglishWord);
        correctSeventhAnswersCount++;
        showNextSeventhWord();
      });
    } else {
      // Handle incorrect answer logic if needed
    }
  }

  void showNextSeventhWord() {
    setState(() {
      shuffledSeventhTurkishWords.shuffle();
      if (answeredSeventhWords.length == seventhWordPairs.length) {
        // If all words are answered, show congratulations message and navigate to the third game screen
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Tebrikler! 7.leveli geçtiniz..'),
              content: Text('Yedinci aşamayı tamamladınız. Sekizinci aşamaya geçmek ister misiniz?'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => EighthGameScreen()),
                    );
                  },
                  child: Text('Evet'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                  },
                  child: Text('Hayır'),
                ),
              ],
            );
          },
        );
      } else {
        // Find a new English word that hasn't been answered yet
        currentSeventhEnglishWord = seventhWordPairs.keys.firstWhere(
              (word) => !answeredSeventhWords.contains(word),
        );

        correctSeventhTurkishTranslation = seventhWordPairs[currentSeventhEnglishWord]!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('7.level:Kelime Eşleştirme Oyunu'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'İkinci aşama: İngilizce kelimeyi Türkçe anlamıyla eşleştir:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Doğru Cevaplar: $correctSeventhAnswersCount',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Toplam Kelimeler: ${seventhWordPairs.length}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              currentSeventhEnglishWord,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: shuffledSeventhTurkishWords
                  .map(
                    (turkishWord) => ElevatedButton(
                  onPressed: () {
                    checkSeventhAnswer(turkishWord);
                  },
                  child: Text(turkishWord),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                          (states) {
                        if (answeredSeventhWords.contains(currentSeventhEnglishWord) &&
                            turkishWord == seventhWordPairs[currentSeventhEnglishWord]) {
                          return Colors.green; // Correctly answered
                        } else {
                          return null; // Use default button color
                        }
                      },
                    ),
                  ),
                ),
              )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
class EighthGameScreen extends StatefulWidget {
  @override
  _EighthGameScreenState createState() => _EighthGameScreenState();
}

class _EighthGameScreenState extends State<EighthGameScreen> {
  Map<String, String> eighthWordPairs = {
    'Hair': 'saç',
    'Honey': 'Bal',
    'Honor': 'Onur',

  };

  late String currentEighthEnglishWord;
  late String correctEighthTurkishTranslation;
  List<String> shuffledEighthTurkishWords = [];
  Set<String> answeredEighthWords = Set<String>();
  int correctEighthAnswersCount = 0;

  @override
  void initState() {
    super.initState();
    startEighthGame();
  }

  void startEighthGame() {
    List<String> eighthEnglishWords = eighthWordPairs.keys.toList();
    eighthEnglishWords.shuffle();

    currentEighthEnglishWord = eighthEnglishWords[0];
    correctEighthTurkishTranslation = eighthWordPairs[currentEighthEnglishWord]!;

    List<String> allEighthTurkishWords = eighthWordPairs.values.toList();
    allEighthTurkishWords.shuffle();

    // Ensure the correct answer is included in the options
    if (!allEighthTurkishWords.contains(correctEighthTurkishTranslation)) {
      allEighthTurkishWords[0] = correctEighthTurkishTranslation;
    }

    shuffledEighthTurkishWords = allEighthTurkishWords;
  }

  void checkEighthAnswer(String selectedEighthTurkishWord) {
    if (selectedEighthTurkishWord == correctEighthTurkishTranslation) {
      setState(() {
        answeredEighthWords.add(currentEighthEnglishWord);
        correctEighthAnswersCount++;
        showNextEighthWord();
      });
    } else {
      // Handle incorrect answer logic if needed
    }
  }

  void showNextEighthWord() {
    setState(() {
      shuffledEighthTurkishWords.shuffle();
      if (answeredEighthWords.length == eighthWordPairs.length) {
        // If all words are answered, show congratulations message and navigate to the third game screen
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Tebrikler! 8.leveli geçtiniz..'),
              content: Text('Sekizinci aşamayı tamamladınız.Dokuzuncu aşamaya geçmek ister misiniz?'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => NinthGameScreen()),
                    );
                  },
                  child: Text('Evet'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                  },
                  child: Text('Hayır'),
                ),
              ],
            );
          },
        );
      } else {
        // Find a new English word that hasn't been answered yet
        currentEighthEnglishWord = eighthWordPairs.keys.firstWhere(
              (word) => !answeredEighthWords.contains(word),
        );

        correctEighthTurkishTranslation = eighthWordPairs[currentEighthEnglishWord]!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('8.level:Kelime Eşleştirme Oyunu'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'İkinci aşama: İngilizce kelimeyi Türkçe anlamıyla eşleştir:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Doğru Cevaplar: $correctEighthAnswersCount',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Toplam Kelimeler: ${eighthWordPairs.length}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              currentEighthEnglishWord,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: shuffledEighthTurkishWords
                  .map(
                    (turkishWord) => ElevatedButton(
                  onPressed: () {
                    checkEighthAnswer(turkishWord);
                  },
                  child: Text(turkishWord),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                          (states) {
                        if (answeredEighthWords.contains(currentEighthEnglishWord) &&
                            turkishWord == eighthWordPairs[currentEighthEnglishWord]) {
                          return Colors.green; // Correctly answered
                        } else {
                          return null; // Use default button color
                        }
                      },
                    ),
                  ),
                ),
              )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
class NinthGameScreen extends StatefulWidget {
  @override
  _NinthGameScreenState createState() => _NinthGameScreenState();
}

class _NinthGameScreenState extends State<NinthGameScreen> {
  Map<String, String> ninthWordPairs = {
    'Information': 'bilgi',
    'Inform': 'Bilgilendirmek',
    'Injured': 'Yaralı',

  };

  late String currentNinthEnglishWord;
  late String correctNinthTurkishTranslation;
  List<String> shuffledNinthTurkishWords = [];
  Set<String> answeredNinthWords = Set<String>();
  int correctNinthAnswersCount = 0;

  @override
  void initState() {
    super.initState();
    startNinthGame();
  }

  void startNinthGame() {
    List<String> ninthEnglishWords = ninthWordPairs.keys.toList();
    ninthEnglishWords.shuffle();

    currentNinthEnglishWord = ninthEnglishWords[0];
    correctNinthTurkishTranslation = ninthWordPairs[currentNinthEnglishWord]!;

    List<String> allNinthTurkishWords = ninthWordPairs.values.toList();
    allNinthTurkishWords.shuffle();

    // Ensure the correct answer is included in the options
    if (!allNinthTurkishWords.contains(correctNinthTurkishTranslation)) {
      allNinthTurkishWords[0] = correctNinthTurkishTranslation;
    }

    shuffledNinthTurkishWords = allNinthTurkishWords;
  }

  void checkNinthAnswer(String selectedNinthTurkishWord) {
    if (selectedNinthTurkishWord == correctNinthTurkishTranslation) {
      setState(() {
        answeredNinthWords.add(currentNinthEnglishWord);
        correctNinthAnswersCount++;
        showNextNinthWord();
      });
    } else {
      // Handle incorrect answer logic if needed
    }
  }

  void showNextNinthWord() {
    setState(() {
      shuffledNinthTurkishWords.shuffle();
      if (answeredNinthWords.length == ninthWordPairs.length) {
        // If all words are answered, show congratulations message and navigate to the third game screen
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Tebrikler! 9. leveli geçtiniz..'),
              content: Text('Dokuzuncu aşamayı tamamladınız. onuncu aşamaya geçmek ister misiniz?'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => TenthGameScreen()),
                    );
                  },
                  child: Text('Evet'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                  },
                  child: Text('Hayır'),
                ),
              ],
            );
          },
        );
      } else {
        // Find a new English word that hasn't been answered yet
        currentNinthEnglishWord = ninthWordPairs.keys.firstWhere(
              (word) => !answeredNinthWords.contains(word),
        );

        correctNinthTurkishTranslation = ninthWordPairs[currentNinthEnglishWord]!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('9.level:Kelime Eşleştirme Oyunu'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'İkinci aşama: İngilizce kelimeyi Türkçe anlamıyla eşleştir:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Doğru Cevaplar: $correctNinthAnswersCount',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Toplam Kelimeler: ${ninthWordPairs.length}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              currentNinthEnglishWord,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: shuffledNinthTurkishWords
                  .map(
                    (turkishWord) => ElevatedButton(
                  onPressed: () {
                    checkNinthAnswer(turkishWord);
                  },
                  child: Text(turkishWord),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                          (states) {
                        if (answeredNinthWords.contains(currentNinthEnglishWord) &&
                            turkishWord == ninthWordPairs[currentNinthEnglishWord]) {
                          return Colors.green; // Correctly answered
                        } else {
                          return null; // Use default button color
                        }
                      },
                    ),
                  ),
                ),
              )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
class TenthGameScreen extends StatefulWidget {
  @override
  _TenthGameScreenState createState() => _TenthGameScreenState();
}

class _TenthGameScreenState extends State<TenthGameScreen> {
  Map<String, String> tenthWordPairs = {
    'Jacket': 'ceket',
    'Jam': 'Reçel',
    'Jar': 'Kavanoz',

  };

  late String currentTenthEnglishWord;
  late String correctTenthTurkishTranslation;
  List<String> shuffledTenthTurkishWords = [];
  Set<String> answeredTenthWords = Set<String>();
  int correctTenthAnswersCount = 0;

  @override
  void initState() {
    super.initState();
    startTenthGame();
  }

  void startTenthGame() {
    List<String> tenthEnglishWords = tenthWordPairs.keys.toList();
    tenthEnglishWords.shuffle();

    currentTenthEnglishWord = tenthEnglishWords[0];
    correctTenthTurkishTranslation = tenthWordPairs[currentTenthEnglishWord]!;

    List<String> allTenthTurkishWords = tenthWordPairs.values.toList();
    allTenthTurkishWords.shuffle();

    // Ensure the correct answer is included in the options
    if (!allTenthTurkishWords.contains(correctTenthTurkishTranslation)) {
      allTenthTurkishWords[0] = correctTenthTurkishTranslation;
    }

    shuffledTenthTurkishWords = allTenthTurkishWords;
  }

  void checkTenthAnswer(String selectedTenthTurkishWord) {
    if (selectedTenthTurkishWord == correctTenthTurkishTranslation) {
      setState(() {
        answeredTenthWords.add(currentTenthEnglishWord);
        correctTenthAnswersCount++;
        showNextTenthWord();
      });
    } else {
      // Handle incorrect answer logic if needed
    }
  }

  void showNextTenthWord() {
    setState(() {
      shuffledTenthTurkishWords.shuffle();
      if (answeredTenthWords.length == tenthWordPairs.length) {
        // If all words are answered, show congratulations message and navigate to the third game screen
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Tebrikler! 10. leveli geçtiniz..'),
              content: Text('Onuncu aşamayı tamamladınız. 11. aşamaya geçmek ister misiniz?'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => EleventhGameScreen()),
                    );
                  },
                  child: Text('Evet'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                  },
                  child: Text('Hayır'),
                ),
              ],
            );
          },
        );
      } else {
        // Find a new English word that hasn't been answered yet
        currentTenthEnglishWord = tenthWordPairs.keys.firstWhere(
              (word) => !answeredTenthWords.contains(word),
        );

        correctTenthTurkishTranslation = tenthWordPairs[currentTenthEnglishWord]!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('10.level:Kelime Eşleştirme Oyunu'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'İkinci aşama: İngilizce kelimeyi Türkçe anlamıyla eşleştir:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Doğru Cevaplar: $correctTenthAnswersCount',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Toplam Kelimeler: ${tenthWordPairs.length}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              currentTenthEnglishWord,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: shuffledTenthTurkishWords
                  .map(
                    (turkishWord) => ElevatedButton(
                  onPressed: () {
                    checkTenthAnswer(turkishWord);
                  },
                  child: Text(turkishWord),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                          (states) {
                        if (answeredTenthWords.contains(currentTenthEnglishWord) &&
                            turkishWord == tenthWordPairs[currentTenthEnglishWord]) {
                          return Colors.green; // Correctly answered
                        } else {
                          return null; // Use default button color
                        }
                      },
                    ),
                  ),
                ),
              )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
class EleventhGameScreen extends StatefulWidget {
  @override
  _EleventhGameScreenState createState() => _EleventhGameScreenState();
}

class _EleventhGameScreenState extends State<EleventhGameScreen> {
  Map<String, String> eleventhWordPairs = {
    'Keep': 'tutmak',
    'Key': 'Anahtar',
    'Kick': 'Tekme',

  };

  late String currentEleventhEnglishWord;
  late String correctEleventhTurkishTranslation;
  List<String> shuffledEleventhTurkishWords = [];
  Set<String> answeredEleventhWords = Set<String>();
  int correctEleventhAnswersCount = 0;

  @override
  void initState() {
    super.initState();
    startEleventhGame();
  }

  void startEleventhGame() {
    List<String> eleventhEnglishWords = eleventhWordPairs.keys.toList();
    eleventhEnglishWords.shuffle();

    currentEleventhEnglishWord = eleventhEnglishWords[0];
    correctEleventhTurkishTranslation = eleventhWordPairs[currentEleventhEnglishWord]!;

    List<String> allEleventhTurkishWords = eleventhWordPairs.values.toList();
    allEleventhTurkishWords.shuffle();

    // Ensure the correct answer is included in the options
    if (!allEleventhTurkishWords.contains(correctEleventhTurkishTranslation)) {
      allEleventhTurkishWords[0] = correctEleventhTurkishTranslation;
    }

    shuffledEleventhTurkishWords = allEleventhTurkishWords;
  }

  void checkEleventhAnswer(String selectedEleventhTurkishWord) {
    if (selectedEleventhTurkishWord == correctEleventhTurkishTranslation) {
      setState(() {
        answeredEleventhWords.add(currentEleventhEnglishWord);
        correctEleventhAnswersCount++;
        showNextEleventhWord();
      });
    } else {
      // Handle incorrect answer logic if needed
    }
  }

  void showNextEleventhWord() {
    setState(() {
      shuffledEleventhTurkishWords.shuffle();
      if (answeredEleventhWords.length == eleventhWordPairs.length) {
        // If all words are answered, show congratulations message and navigate to the third game screen
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Tebrikler! 11.leveli geçtiniz..'),
              content: Text('11. aşamayı tamamladınız. 12. aşamaya geçmek ister misiniz?'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => TwelfthGameScreen()),
                    );
                  },
                  child: Text('Evet'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                  },
                  child: Text('Hayır'),
                ),
              ],
            );
          },
        );
      } else {
        // Find a new English word that hasn't been answered yet
        currentEleventhEnglishWord = eleventhWordPairs.keys.firstWhere(
              (word) => !answeredEleventhWords.contains(word),
        );

        correctEleventhTurkishTranslation = eleventhWordPairs[currentEleventhEnglishWord]!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('11.level:Kelime Eşleştirme Oyunu'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'İkinci aşama: İngilizce kelimeyi Türkçe anlamıyla eşleştir:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Doğru Cevaplar: $correctEleventhAnswersCount',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Toplam Kelimeler: ${eleventhWordPairs.length}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              currentEleventhEnglishWord,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: shuffledEleventhTurkishWords
                  .map(
                    (turkishWord) => ElevatedButton(
                  onPressed: () {
                    checkEleventhAnswer(turkishWord);
                  },
                  child: Text(turkishWord),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                          (states) {
                        if (answeredEleventhWords.contains(currentEleventhEnglishWord) &&
                            turkishWord == eleventhWordPairs[currentEleventhEnglishWord]) {
                          return Colors.green; // Correctly answered
                        } else {
                          return null; // Use default button color
                        }
                      },
                    ),
                  ),
                ),
              )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
class TwelfthGameScreen extends StatefulWidget {
  @override
  _TwelfthGameScreenState createState() => _TwelfthGameScreenState();
}

class _TwelfthGameScreenState extends State<TwelfthGameScreen> {
  Map<String, String> twelfthWordPairs = {
    'Labor': 'iş gücü',
    'Lack': 'Eksi̇kli̇k',
    'Ladder': 'Merdi̇ven',

  };

  late String currentTwelfthEnglishWord;
  late String correctTwelfthTurkishTranslation;
  List<String> shuffledTwelfthTurkishWords = [];
  Set<String> answeredTwelfthWords = Set<String>();
  int correctTwelfthAnswersCount = 0;

  @override
  void initState() {
    super.initState();
    startTwelfthGame();
  }

  void startTwelfthGame() {
    List<String> twelfthEnglishWords = twelfthWordPairs.keys.toList();
    twelfthEnglishWords.shuffle();

    currentTwelfthEnglishWord = twelfthEnglishWords[0];
    correctTwelfthTurkishTranslation = twelfthWordPairs[currentTwelfthEnglishWord]!;

    List<String> allTwelfthTurkishWords = twelfthWordPairs.values.toList();
    allTwelfthTurkishWords.shuffle();

    // Ensure the correct answer is included in the options
    if (!allTwelfthTurkishWords.contains(correctTwelfthTurkishTranslation)) {
      allTwelfthTurkishWords[0] = correctTwelfthTurkishTranslation;
    }

    shuffledTwelfthTurkishWords = allTwelfthTurkishWords;
  }

  void checkTwelfthAnswer(String selectedTwelfthTurkishWord) {
    if (selectedTwelfthTurkishWord == correctTwelfthTurkishTranslation) {
      setState(() {
        answeredTwelfthWords.add(currentTwelfthEnglishWord);
        correctTwelfthAnswersCount++;
        showNextTwelfthWord();
      });
    } else {
      // Handle incorrect answer logic if needed
    }
  }

  void showNextTwelfthWord() {
    setState(() {
      shuffledTwelfthTurkishWords.shuffle();
      if (answeredTwelfthWords.length == twelfthWordPairs.length) {
        // If all words are answered, show congratulations message and navigate to the third game screen
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Tebrikler! 12. leveli geçtiniz..'),
              content: Text('12. aşamayı tamamladınız. 13. aşamaya geçmek ister misiniz?'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => ThirteenthGameScreen()),
                    );
                  },
                  child: Text('Evet'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                  },
                  child: Text('Hayır'),
                ),
              ],
            );
          },
        );
      } else {
        // Find a new English word that hasn't been answered yet
        currentTwelfthEnglishWord = twelfthWordPairs.keys.firstWhere(
              (word) => !answeredTwelfthWords.contains(word),
        );

        correctTwelfthTurkishTranslation = twelfthWordPairs[currentTwelfthEnglishWord]!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('12.level:Kelime Eşleştirme Oyunu'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'İkinci aşama: İngilizce kelimeyi Türkçe anlamıyla eşleştir:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Doğru Cevaplar: $correctTwelfthAnswersCount',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Toplam Kelimeler: ${twelfthWordPairs.length}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              currentTwelfthEnglishWord,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: shuffledTwelfthTurkishWords
                  .map(
                    (turkishWord) => ElevatedButton(
                  onPressed: () {
                    checkTwelfthAnswer(turkishWord);
                  },
                  child: Text(turkishWord),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                          (states) {
                        if (answeredTwelfthWords.contains(currentTwelfthEnglishWord) &&
                            turkishWord == twelfthWordPairs[currentTwelfthEnglishWord]) {
                          return Colors.green; // Correctly answered
                        } else {
                          return null; // Use default button color
                        }
                      },
                    ),
                  ),
                ),
              )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
class ThirteenthGameScreen extends StatefulWidget {
  @override
  _ThirteenthGameScreenState createState() => _ThirteenthGameScreenState();
}

class _ThirteenthGameScreenState extends State<ThirteenthGameScreen> {
  Map<String, String> thirteenthWordPairs = {
    'Memorial': 'anı',
    'Men': 'Adamlar',
    'Mental': '	Zi̇hi̇nsel',

  };

  late String currentThirteenthEnglishWord;
  late String correctThirteenthTurkishTranslation;
  List<String> shuffledThirteenthTurkishWords = [];
  Set<String> answeredThirteenthWords = Set<String>();
  int correctThirteenthAnswersCount = 0;

  @override
  void initState() {
    super.initState();
    startThirteenthGame();
  }

  void startThirteenthGame() {
    List<String> thirteenthEnglishWords = thirteenthWordPairs.keys.toList();
    thirteenthEnglishWords.shuffle();

    currentThirteenthEnglishWord = thirteenthEnglishWords[0];
    correctThirteenthTurkishTranslation = thirteenthWordPairs[currentThirteenthEnglishWord]!;

    List<String> allThirteenthTurkishWords = thirteenthWordPairs.values.toList();
    allThirteenthTurkishWords.shuffle();

    // Ensure the correct answer is included in the options
    if (!allThirteenthTurkishWords.contains(correctThirteenthTurkishTranslation)) {
      allThirteenthTurkishWords[0] = correctThirteenthTurkishTranslation;
    }

    shuffledThirteenthTurkishWords = allThirteenthTurkishWords;
  }

  void checkThirteenthAnswer(String selectedThirteenthTurkishWord) {
    if (selectedThirteenthTurkishWord == correctThirteenthTurkishTranslation) {
      setState(() {
        answeredThirteenthWords.add(currentThirteenthEnglishWord);
        correctThirteenthAnswersCount++;
        showNextThirteenthWord();
      });
    } else {
      // Handle incorrect answer logic if needed
    }
  }

  void showNextThirteenthWord() {
    setState(() {
      shuffledThirteenthTurkishWords.shuffle();
      if (answeredThirteenthWords.length == thirteenthWordPairs.length) {
        // If all words are answered, show congratulations message and navigate to the third game screen
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('TeTebrikler! 13. leveli geçtiniz..'),
              content: Text('13. aşamayı tamamladınız. 14. aşamaya geçmek ister misiniz?'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => FourteenthGameScreen()),
                    );
                  },
                  child: Text('Evet'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                  },
                  child: Text('Hayır'),
                ),
              ],
            );
          },
        );
      } else {
        // Find a new English word that hasn't been answered yet
        currentThirteenthEnglishWord = thirteenthWordPairs.keys.firstWhere(
              (word) => !answeredThirteenthWords.contains(word),
        );

        correctThirteenthTurkishTranslation = thirteenthWordPairs[currentThirteenthEnglishWord]!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('13.level:Kelime Eşleştirme Oyunu'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'İkinci aşama: İngilizce kelimeyi Türkçe anlamıyla eşleştir:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Doğru Cevaplar: $correctThirteenthAnswersCount',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Toplam Kelimeler: ${thirteenthWordPairs.length}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              currentThirteenthEnglishWord,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: shuffledThirteenthTurkishWords
                  .map(
                    (turkishWord) => ElevatedButton(
                  onPressed: () {
                    checkThirteenthAnswer(turkishWord);
                  },
                  child: Text(turkishWord),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                          (states) {
                        if (answeredThirteenthWords.contains(currentThirteenthEnglishWord) &&
                            turkishWord == thirteenthWordPairs[currentThirteenthEnglishWord]) {
                          return Colors.green; // Correctly answered
                        } else {
                          return null; // Use default button color
                        }
                      },
                    ),
                  ),
                ),
              )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
class FourteenthGameScreen extends StatefulWidget {
  @override
  _FourteenthGameScreenState createState() => _FourteenthGameScreenState();
}

class _FourteenthGameScreenState extends State<FourteenthGameScreen> {
  Map<String, String> fourteenthWordPairs = {
    'Nail': 'tırnak',
    'Narrow': 'Dar',
    'Name': '	İsi̇m',

  };

  late String currentFourteenthEnglishWord;
  late String correctFourteenthTurkishTranslation;
  List<String> shuffledFourteenthTurkishWords = [];
  Set<String> answeredFourteenthWords = Set<String>();
  int correctFourteenthAnswersCount = 0;

  @override
  void initState() {
    super.initState();
    startFourteenthGame();
  }

  void startFourteenthGame() {
    List<String> fourteenthEnglishWords = fourteenthWordPairs.keys.toList();
    fourteenthEnglishWords.shuffle();

    currentFourteenthEnglishWord = fourteenthEnglishWords[0];
    correctFourteenthTurkishTranslation = fourteenthWordPairs[currentFourteenthEnglishWord]!;

    List<String> allFourteenthTurkishWords = fourteenthWordPairs.values.toList();
    allFourteenthTurkishWords.shuffle();

    // Ensure the correct answer is included in the options
    if (!allFourteenthTurkishWords.contains(correctFourteenthTurkishTranslation)) {
      allFourteenthTurkishWords[0] = correctFourteenthTurkishTranslation;
    }

    shuffledFourteenthTurkishWords = allFourteenthTurkishWords;
  }

  void checkFourteenthAnswer(String selectedFourteenthTurkishWord) {
    if (selectedFourteenthTurkishWord == correctFourteenthTurkishTranslation) {
      setState(() {
        answeredFourteenthWords.add(currentFourteenthEnglishWord);
        correctFourteenthAnswersCount++;
        showNextFourteenthWord();
      });
    } else {
      // Handle incorrect answer logic if needed
    }
  }

  void showNextFourteenthWord() {
    setState(() {
      shuffledFourteenthTurkishWords.shuffle();
      if (answeredFourteenthWords.length == fourteenthWordPairs.length) {
        // If all words are answered, show congratulations message and navigate to the third game screen
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Tebrikler! 14. leveli geçtiniz..'),
              content: Text('14. aşamayı tamamladınız. 15. aşamaya geçmek ister misiniz?'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => FifteenthGameScreen()),
                    );
                  },
                  child: Text('Evet'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                  },
                  child: Text('Hayır'),
                ),
              ],
            );
          },
        );
      } else {
        // Find a new English word that hasn't been answered yet
        currentFourteenthEnglishWord = fourteenthWordPairs.keys.firstWhere(
              (word) => !answeredFourteenthWords.contains(word),
        );

        correctFourteenthTurkishTranslation = fourteenthWordPairs[currentFourteenthEnglishWord]!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('14.level:Kelime Eşleştirme Oyunu'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'İkinci aşama: İngilizce kelimeyi Türkçe anlamıyla eşleştir:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Doğru Cevaplar: $correctFourteenthAnswersCount',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Toplam Kelimeler: ${fourteenthWordPairs.length}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              currentFourteenthEnglishWord,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: shuffledFourteenthTurkishWords
                  .map(
                    (turkishWord) => ElevatedButton(
                  onPressed: () {
                    checkFourteenthAnswer(turkishWord);
                  },
                  child: Text(turkishWord),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                          (states) {
                        if (answeredFourteenthWords.contains(currentFourteenthEnglishWord) &&
                            turkishWord == fourteenthWordPairs[currentFourteenthEnglishWord]) {
                          return Colors.green; // Correctly answered
                        } else {
                          return null; // Use default button color
                        }
                      },
                    ),
                  ),
                ),
              )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
class FifteenthGameScreen extends StatefulWidget {
  @override
  _FifteenthGameScreenState createState() => _FifteenthGameScreenState();
}

class _FifteenthGameScreenState extends State<FifteenthGameScreen> {
  Map<String, String> fifteenthWordPairs = {
    'Oak': 'meşe',
    'Ocean': 'Okyanus',
    'October': 'Okyanus',

  };

  late String currentFifteenthEnglishWord;
  late String correctFifteenthTurkishTranslation;
  List<String> shuffledFifteenthTurkishWords = [];
  Set<String> answeredFifteenthWords = Set<String>();
  int correctFifteenthAnswersCount = 0;

  @override
  void initState() {
    super.initState();
    startFifteenthGame();
  }

  void startFifteenthGame() {
    List<String> fifteenthEnglishWords = fifteenthWordPairs.keys.toList();
    fifteenthEnglishWords.shuffle();

    currentFifteenthEnglishWord = fifteenthEnglishWords[0];
    correctFifteenthTurkishTranslation = fifteenthWordPairs[currentFifteenthEnglishWord]!;

    List<String> allFifteenthTurkishWords = fifteenthWordPairs.values.toList();
    allFifteenthTurkishWords.shuffle();

    // Ensure the correct answer is included in the options
    if (!allFifteenthTurkishWords.contains(correctFifteenthTurkishTranslation)) {
      allFifteenthTurkishWords[0] = correctFifteenthTurkishTranslation;
    }

    shuffledFifteenthTurkishWords = allFifteenthTurkishWords;
  }

  void checkFifteenthAnswer(String selectedFifteenthTurkishWord) {
    if (selectedFifteenthTurkishWord == correctFifteenthTurkishTranslation) {
      setState(() {
        answeredFifteenthWords.add(currentFifteenthEnglishWord);
        correctFifteenthAnswersCount++;
        showNextFifteenthWord();
      });
    } else {
      // Handle incorrect answer logic if needed
    }
  }

  void showNextFifteenthWord() {
    setState(() {
      shuffledFifteenthTurkishWords.shuffle();
      if (answeredFifteenthWords.length == fifteenthWordPairs.length) {
        // If all words are answered, show congratulations message and navigate to the third game screen
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Tebrikler! 15. leveli geçtiniz..'),
              content: Text('15. aşamayı tamamladınız. 16. aşamaya geçmek ister misiniz?'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SixteenthGameScreen()),
                    );
                  },
                  child: Text('Evet'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                  },
                  child: Text('Hayır'),
                ),
              ],
            );
          },
        );
      } else {
        // Find a new English word that hasn't been answered yet
        currentFifteenthEnglishWord = fifteenthWordPairs.keys.firstWhere(
              (word) => !answeredFifteenthWords.contains(word),
        );

        correctFifteenthTurkishTranslation = fifteenthWordPairs[currentFifteenthEnglishWord]!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('15.level:Kelime Eşleştirme Oyunu'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'İkinci aşama: İngilizce kelimeyi Türkçe anlamıyla eşleştir:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Doğru Cevaplar: $correctFifteenthAnswersCount',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Toplam Kelimeler: ${fifteenthWordPairs.length}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              currentFifteenthEnglishWord,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: shuffledFifteenthTurkishWords
                  .map(
                    (turkishWord) => ElevatedButton(
                  onPressed: () {
                    checkFifteenthAnswer(turkishWord);
                  },
                  child: Text(turkishWord),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                          (states) {
                        if (answeredFifteenthWords.contains(currentFifteenthEnglishWord) &&
                            turkishWord == fifteenthWordPairs[currentFifteenthEnglishWord]) {
                          return Colors.green; // Correctly answered
                        } else {
                          return null; // Use default button color
                        }
                      },
                    ),
                  ),
                ),
              )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
class SixteenthGameScreen extends StatefulWidget {
  @override
  _SixteenthGameScreenState createState() => _SixteenthGameScreenState();
}

class _SixteenthGameScreenState extends State<SixteenthGameScreen> {
  Map<String, String> sixteenthWordPairs = {
    'Pack': 'paketlemek',
    'Page': '	Sayfa',
    'Painful': 'Ağrılı',

  };

  late String currentSixteenthEnglishWord;
  late String correctSixteenthTurkishTranslation;
  List<String> shuffledSixteenthTurkishWords = [];
  Set<String> answeredSixteenthWords = Set<String>();
  int correctSixteenthAnswersCount = 0;

  @override
  void initState() {
    super.initState();
    startSixteenthGame();
  }

  void startSixteenthGame() {
    List<String> sixteenthEnglishWords = sixteenthWordPairs.keys.toList();
    sixteenthEnglishWords.shuffle();

    currentSixteenthEnglishWord = sixteenthEnglishWords[0];
    correctSixteenthTurkishTranslation = sixteenthWordPairs[currentSixteenthEnglishWord]!;

    List<String> allSixteenthTurkishWords = sixteenthWordPairs.values.toList();
    allSixteenthTurkishWords.shuffle();

    // Ensure the correct answer is included in the options
    if (!allSixteenthTurkishWords.contains(correctSixteenthTurkishTranslation)) {
      allSixteenthTurkishWords[0] = correctSixteenthTurkishTranslation;
    }

    shuffledSixteenthTurkishWords = allSixteenthTurkishWords;
  }

  void checkSixteenthAnswer(String selectedSixteenthTurkishWord) {
    if (selectedSixteenthTurkishWord == correctSixteenthTurkishTranslation) {
      setState(() {
        answeredSixteenthWords.add(currentSixteenthEnglishWord);
        correctSixteenthAnswersCount++;
        showNextSixteenthWord();
      });
    } else {
      // Handle incorrect answer logic if needed
    }
  }

  void showNextSixteenthWord() {
    setState(() {
      shuffledSixteenthTurkishWords.shuffle();
      if (answeredSixteenthWords.length == sixteenthWordPairs.length) {
        // If all words are answered, show congratulations message and navigate to the third game screen
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Tebrikler! 16. leveli geçtiniz..'),
              content: Text('16. aşamayı tamamladınız. 17. aşamaya geçmek ister misiniz?'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SeventeenthGameScreen()),
                    );
                  },
                  child: Text('Evet'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                  },
                  child: Text('Hayır'),
                ),
              ],
            );
          },
        );
      } else {
        // Find a new English word that hasn't been answered yet
        currentSixteenthEnglishWord = sixteenthWordPairs.keys.firstWhere(
              (word) => !answeredSixteenthWords.contains(word),
        );

        correctSixteenthTurkishTranslation = sixteenthWordPairs[currentSixteenthEnglishWord]!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('16.level:Kelime Eşleştirme Oyunu'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'İkinci aşama: İngilizce kelimeyi Türkçe anlamıyla eşleştir:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Doğru Cevaplar: $correctSixteenthAnswersCount',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Toplam Kelimeler: ${sixteenthWordPairs.length}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              currentSixteenthEnglishWord,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: shuffledSixteenthTurkishWords
                  .map(
                    (turkishWord) => ElevatedButton(
                  onPressed: () {
                    checkSixteenthAnswer(turkishWord);
                  },
                  child: Text(turkishWord),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                          (states) {
                        if (answeredSixteenthWords.contains(currentSixteenthEnglishWord) &&
                            turkishWord == sixteenthWordPairs[currentSixteenthEnglishWord]) {
                          return Colors.green; // Correctly answered
                        } else {
                          return null; // Use default button color
                        }
                      },
                    ),
                  ),
                ),
              )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class SeventeenthGameScreen extends StatefulWidget {
  @override
  _SeventeenthGameScreenState createState() => _SeventeenthGameScreenState();
}

class _SeventeenthGameScreenState extends State<SeventeenthGameScreen> {
  Map<String, String> seventeenthWordPairs = {
    'Quality': 'kalite',
    'Queue': 'Sıra',
    'Quick': 'Çabuk',

  };

  late String currentSeventeenthEnglishWord;
  late String correctSeventeenthTurkishTranslation;
  List<String> shuffledSeventeenthTurkishWords = [];
  Set<String> answeredSeventeenthWords = Set<String>();
  int correctSeventeenthAnswersCount = 0;

  @override
  void initState() {
    super.initState();
    startSeventeenthGame();
  }

  void startSeventeenthGame() {
    List<String> seventeenthEnglishWords = seventeenthWordPairs.keys.toList();
    seventeenthEnglishWords.shuffle();

    currentSeventeenthEnglishWord = seventeenthEnglishWords[0];
    correctSeventeenthTurkishTranslation = seventeenthWordPairs[currentSeventeenthEnglishWord]!;

    List<String> allSeventeenthTurkishWords = seventeenthWordPairs.values.toList();
    allSeventeenthTurkishWords.shuffle();

    // Ensure the correct answer is included in the options
    if (!allSeventeenthTurkishWords.contains(correctSeventeenthTurkishTranslation)) {
      allSeventeenthTurkishWords[0] = correctSeventeenthTurkishTranslation;
    }

    shuffledSeventeenthTurkishWords = allSeventeenthTurkishWords;
  }

  void checkSeventeenthAnswer(String selectedSeventeenthTurkishWord) {
    if (selectedSeventeenthTurkishWord == correctSeventeenthTurkishTranslation) {
      setState(() {
        answeredSeventeenthWords.add(currentSeventeenthEnglishWord);
        correctSeventeenthAnswersCount++;
        showNextSeventeenthWord();
      });
    } else {
      // Handle incorrect answer logic if needed
    }
  }

  void showNextSeventeenthWord() {
    setState(() {
      shuffledSeventeenthTurkishWords.shuffle();
      if (answeredSeventeenthWords.length == seventeenthWordPairs.length) {
        // If all words are answered, show congratulations message and navigate to the third game screen
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Tebrikler! 17. leveli geçtiniz..'),
              content: Text('17. aşamayı tamamladınız. 18. aşamaya geçmek ister misiniz?'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => EighteenthGameScreen()),
                    );
                  },
                  child: Text('Evet'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                  },
                  child: Text('Hayır'),
                ),
              ],
            );
          },
        );
      } else {
        // Find a new English word that hasn't been answered yet
        currentSeventeenthEnglishWord = seventeenthWordPairs.keys.firstWhere(
              (word) => !answeredSeventeenthWords.contains(word),
        );

        correctSeventeenthTurkishTranslation = seventeenthWordPairs[currentSeventeenthEnglishWord]!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('17.level:Kelime Eşleştirme Oyunu'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'İkinci aşama: İngilizce kelimeyi Türkçe anlamıyla eşleştir:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Doğru Cevaplar: $correctSeventeenthAnswersCount',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Toplam Kelimeler: ${seventeenthWordPairs.length}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              currentSeventeenthEnglishWord,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: shuffledSeventeenthTurkishWords
                  .map(
                    (turkishWord) => ElevatedButton(
                  onPressed: () {
                    checkSeventeenthAnswer(turkishWord);
                  },
                  child: Text(turkishWord),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                          (states) {
                        if (answeredSeventeenthWords.contains(currentSeventeenthEnglishWord) &&
                            turkishWord == seventeenthWordPairs[currentSeventeenthEnglishWord]) {
                          return Colors.green; // Correctly answered
                        } else {
                          return null; // Use default button color
                        }
                      },
                    ),
                  ),
                ),
              )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
class EighteenthGameScreen extends StatefulWidget {
  @override
  _EighteenthGameScreenState createState() => _EighteenthGameScreenState();
}

class _EighteenthGameScreenState extends State<EighteenthGameScreen> {
  Map<String, String> eighteenthWordPairs = {
    'Rabbit': 'tavşan',
    'Rain': 'Yağmur',
    'Raincoat': '	Yağmurluk',

  };

  late String currentEighteenthEnglishWord;
  late String correctEighteenthTurkishTranslation;
  List<String> shuffledEighteenthTurkishWords = [];
  Set<String> answeredEighteenthWords = Set<String>();
  int correctEighteenthAnswersCount = 0;

  @override
  void initState() {
    super.initState();
    startEighteenthGame();
  }

  void startEighteenthGame() {
    List<String> eighteenthEnglishWords = eighteenthWordPairs.keys.toList();
    eighteenthEnglishWords.shuffle();

    currentEighteenthEnglishWord = eighteenthEnglishWords[0];
    correctEighteenthTurkishTranslation = eighteenthWordPairs[currentEighteenthEnglishWord]!;

    List<String> allEighteenthTurkishWords = eighteenthWordPairs.values.toList();
    allEighteenthTurkishWords.shuffle();

    // Ensure the correct answer is included in the options
    if (!allEighteenthTurkishWords.contains(correctEighteenthTurkishTranslation)) {
      allEighteenthTurkishWords[0] = correctEighteenthTurkishTranslation;
    }

    shuffledEighteenthTurkishWords = allEighteenthTurkishWords;
  }

  void checkEighteenthAnswer(String selectedEighteenthTurkishWord) {
    if (selectedEighteenthTurkishWord == correctEighteenthTurkishTranslation) {
      setState(() {
        answeredEighteenthWords.add(currentEighteenthEnglishWord);
        correctEighteenthAnswersCount++;
        showNextEighteenthWord();
      });
    } else {
      // Handle incorrect answer logic if needed
    }
  }

  void showNextEighteenthWord() {
    setState(() {
      shuffledEighteenthTurkishWords.shuffle();
      if (answeredEighteenthWords.length == eighteenthWordPairs.length) {
        // If all words are answered, show congratulations message and navigate to the third game screen
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Tebrikler! 18. leveli geçtiniz..'),
              content: Text('18. aşamayı tamamladınız. 19. aşamaya geçmek ister misiniz?'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => NineteenthGameScreen()),
                    );
                  },
                  child: Text('Evet'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                  },
                  child: Text('Hayır'),
                ),
              ],
            );
          },
        );
      } else {
        // Find a new English word that hasn't been answered yet
        currentEighteenthEnglishWord = eighteenthWordPairs.keys.firstWhere(
              (word) => !answeredEighteenthWords.contains(word),
        );

        correctEighteenthTurkishTranslation = eighteenthWordPairs[currentEighteenthEnglishWord]!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('18.level:Kelime Eşleştirme Oyunu'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'İkinci aşama: İngilizce kelimeyi Türkçe anlamıyla eşleştir:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Doğru Cevaplar: $correctEighteenthAnswersCount',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Toplam Kelimeler: ${eighteenthWordPairs.length}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              currentEighteenthEnglishWord,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: shuffledEighteenthTurkishWords
                  .map(
                    (turkishWord) => ElevatedButton(
                  onPressed: () {
                    checkEighteenthAnswer(turkishWord);
                  },
                  child: Text(turkishWord),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                          (states) {
                        if (answeredEighteenthWords.contains(currentEighteenthEnglishWord) &&
                            turkishWord == eighteenthWordPairs[currentEighteenthEnglishWord]) {
                          return Colors.green; // Correctly answered
                        } else {
                          return null; // Use default button color
                        }
                      },
                    ),
                  ),
                ),
              )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
class NineteenthGameScreen extends StatefulWidget {
  @override
  _NineteenthGameScreenState createState() => _NineteenthGameScreenState();
}

class _NineteenthGameScreenState extends State<NineteenthGameScreen> {
  Map<String, String> nineteenthWordPairs = {
    'Safe': 'güvenli',
    'Same': 'Aynı',
    'Sit': 'Oturmak',

  };

  late String currentNineteenthEnglishWord;
  late String correctNineteenthTurkishTranslation;
  List<String> shuffledNineteenthTurkishWords = [];
  Set<String> answeredNineteenthWords = Set<String>();
  int correctNineteenthAnswersCount = 0;

  @override
  void initState() {
    super.initState();
    startNineteenthGame();
  }

  void startNineteenthGame() {
    List<String> nineteenthEnglishWords = nineteenthWordPairs.keys.toList();
    nineteenthEnglishWords.shuffle();

    currentNineteenthEnglishWord = nineteenthEnglishWords[0];
    correctNineteenthTurkishTranslation = nineteenthWordPairs[currentNineteenthEnglishWord]!;

    List<String> allNineteenthTurkishWords = nineteenthWordPairs.values.toList();
    allNineteenthTurkishWords.shuffle();

    // Ensure the correct answer is included in the options
    if (!allNineteenthTurkishWords.contains(correctNineteenthTurkishTranslation)) {
      allNineteenthTurkishWords[0] = correctNineteenthTurkishTranslation;
    }

    shuffledNineteenthTurkishWords = allNineteenthTurkishWords;
  }

  void checkNineteenthAnswer(String selectedNineteenthTurkishWord) {
    if (selectedNineteenthTurkishWord == correctNineteenthTurkishTranslation) {
      setState(() {
        answeredNineteenthWords.add(currentNineteenthEnglishWord);
        correctNineteenthAnswersCount++;
        showNextNineteenthWord();
      });
    } else {
      // Handle incorrect answer logic if needed
    }
  }

  void showNextNineteenthWord() {
    setState(() {
      shuffledNineteenthTurkishWords.shuffle();
      if (answeredNineteenthWords.length == nineteenthWordPairs.length) {
        // If all words are answered, show congratulations message and navigate to the third game screen
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Tebrikler! 19. leveli geçtiniz..'),
              content: Text('19. aşamayı tamamladınız. 20. aşamaya geçmek ister misiniz?'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => TwentiethGameScreen()),
                    );
                  },
                  child: Text('Evet'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                  },
                  child: Text('Hayır'),
                ),
              ],
            );
          },
        );
      } else {
        // Find a new English word that hasn't been answered yet
        currentNineteenthEnglishWord = nineteenthWordPairs.keys.firstWhere(
              (word) => !answeredNineteenthWords.contains(word),
        );

        correctNineteenthTurkishTranslation = nineteenthWordPairs[currentNineteenthEnglishWord]!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('19.level:Kelime Eşleştirme Oyunu'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'İkinci aşama: İngilizce kelimeyi Türkçe anlamıyla eşleştir:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Doğru Cevaplar: $correctNineteenthAnswersCount',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Toplam Kelimeler: ${nineteenthWordPairs.length}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              currentNineteenthEnglishWord,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: shuffledNineteenthTurkishWords
                  .map(
                    (turkishWord) => ElevatedButton(
                  onPressed: () {
                    checkNineteenthAnswer(turkishWord);
                  },
                  child: Text(turkishWord),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                          (states) {
                        if (answeredNineteenthWords.contains(currentNineteenthEnglishWord) &&
                            turkishWord == nineteenthWordPairs[currentNineteenthEnglishWord]) {
                          return Colors.green; // Correctly answered
                        } else {
                          return null; // Use default button color
                        }
                      },
                    ),
                  ),
                ),
              )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
class TwentiethGameScreen extends StatefulWidget {
  @override
  _TwentiethGameScreenState createState() => _TwentiethGameScreenState();
}

class _TwentiethGameScreenState extends State<TwentiethGameScreen> {
  Map<String, String> twentiethWordPairs = {
    'Table': 'masa',
    'Tail': 'Kuyruk',
    'Talk': '	Konuşmak',

  };

  late String currentTwentiethEnglishWord;
  late String correctTwentiethTurkishTranslation;
  List<String> shuffledTwentiethTurkishWords = [];
  Set<String> answeredTwentiethWords = Set<String>();
  int correctTwentiethAnswersCount = 0;

  @override
  void initState() {
    super.initState();
    startTwentiethGame();
  }

  void startTwentiethGame() {
    List<String> twentiethEnglishWords = twentiethWordPairs.keys.toList();
    twentiethEnglishWords.shuffle();

    currentTwentiethEnglishWord = twentiethEnglishWords[0];
    correctTwentiethTurkishTranslation = twentiethWordPairs[currentTwentiethEnglishWord]!;

    List<String> allTwentiethTurkishWords = twentiethWordPairs.values.toList();
    allTwentiethTurkishWords.shuffle();

    // Ensure the correct answer is included in the options
    if (!allTwentiethTurkishWords.contains(correctTwentiethTurkishTranslation)) {
      allTwentiethTurkishWords[0] = correctTwentiethTurkishTranslation;
    }

    shuffledTwentiethTurkishWords = allTwentiethTurkishWords;
  }

  void checkTwentiethAnswer(String selectedTwentiethTurkishWord) {
    if (selectedTwentiethTurkishWord == correctTwentiethTurkishTranslation) {
      setState(() {
        answeredTwentiethWords.add(currentTwentiethEnglishWord);
        correctTwentiethAnswersCount++;
        showNextTwentiethWord();
      });
    } else {
      // Handle incorrect answer logic if needed
    }
  }

  void showNextTwentiethWord() {
    setState(() {
      shuffledTwentiethTurkishWords.shuffle();
      if (answeredTwentiethWords.length == twentiethWordPairs.length) {
        // If all words are answered, show congratulations message and navigate to the third game screen
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Tebrikler! 20. leveli geçtiniz..'),
              content: Text('20. aşamayı tamamladınız. 21. aşamaya geçmek ister misiniz?'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => TwentyFirstGameScreen()),
                    );
                  },
                  child: Text('Evet'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                  },
                  child: Text('Hayır'),
                ),
              ],
            );
          },
        );
      } else {
        // Find a new English word that hasn't been answered yet
        currentTwentiethEnglishWord = twentiethWordPairs.keys.firstWhere(
              (word) => !answeredTwentiethWords.contains(word),
        );

        correctTwentiethTurkishTranslation = twentiethWordPairs[currentTwentiethEnglishWord]!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('20.level:Kelime Eşleştirme Oyunu'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'İkinci aşama: İngilizce kelimeyi Türkçe anlamıyla eşleştir:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Doğru Cevaplar: $correctTwentiethAnswersCount',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Toplam Kelimeler: ${twentiethWordPairs.length}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              currentTwentiethEnglishWord,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: shuffledTwentiethTurkishWords
                  .map(
                    (turkishWord) => ElevatedButton(
                  onPressed: () {
                    checkTwentiethAnswer(turkishWord);
                  },
                  child: Text(turkishWord),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                          (states) {
                        if (answeredTwentiethWords.contains(currentTwentiethEnglishWord) &&
                            turkishWord == twentiethWordPairs[currentTwentiethEnglishWord]) {
                          return Colors.green; // Correctly answered
                        } else {
                          return null; // Use default button color
                        }
                      },
                    ),
                  ),
                ),
              )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
class TwentyFirstGameScreen extends StatefulWidget {
  @override
  _TwentyFirstGameScreenState createState() => _TwentyFirstGameScreenState();
}

class _TwentyFirstGameScreenState extends State<TwentyFirstGameScreen> {
  Map<String, String> twentyFirstWordPairs = {
    'Ugly': 'çirkin',
    'Umbrella': 'Şemsi̇ye',
    'Under': 'Altta',

  };

  late String currentTwentyFirstEnglishWord;
  late String correctTwentyFirstTurkishTranslation;
  List<String> shuffledTwentyFirstTurkishWords = [];
  Set<String> answeredTwentyFirstWords = Set<String>();
  int correctTwentyFirstAnswersCount = 0;

  @override
  void initState() {
    super.initState();
    startTwentyFirstGame();
  }

  void startTwentyFirstGame() {
    List<String> twentyFirstEnglishWords = twentyFirstWordPairs.keys.toList();
    twentyFirstEnglishWords.shuffle();

    currentTwentyFirstEnglishWord = twentyFirstEnglishWords[0];
    correctTwentyFirstTurkishTranslation = twentyFirstWordPairs[currentTwentyFirstEnglishWord]!;

    List<String> allTwentyFirstTurkishWords = twentyFirstWordPairs.values.toList();
    allTwentyFirstTurkishWords.shuffle();

    // Ensure the correct answer is included in the options
    if (!allTwentyFirstTurkishWords.contains(correctTwentyFirstTurkishTranslation)) {
      allTwentyFirstTurkishWords[0] = correctTwentyFirstTurkishTranslation;
    }

    shuffledTwentyFirstTurkishWords = allTwentyFirstTurkishWords;
  }

  void checkTwentyFirstAnswer(String selectedTwentyFirstTurkishWord) {
    if (selectedTwentyFirstTurkishWord == correctTwentyFirstTurkishTranslation) {
      setState(() {
        answeredTwentyFirstWords.add(currentTwentyFirstEnglishWord);
        correctTwentyFirstAnswersCount++;
        showNextTwentyFirstWord();
      });
    } else {
      // Handle incorrect answer logic if needed
    }
  }

  void showNextTwentyFirstWord() {
    setState(() {
      shuffledTwentyFirstTurkishWords.shuffle();
      if (answeredTwentyFirstWords.length == twentyFirstWordPairs.length) {
        // If all words are answered, show congratulations message and navigate to the third game screen
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Tebrikler! 21. leveli geçtiniz..'),
              content: Text('21. aşamayı tamamladınız. 22. aşamaya geçmek ister misiniz?'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => TwentySecondGameScreen()),
                    );
                  },
                  child: Text('Evet'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                  },
                  child: Text('Hayır'),
                ),
              ],
            );
          },
        );
      } else {
        // Find a new English word that hasn't been answered yet
        currentTwentyFirstEnglishWord = twentyFirstWordPairs.keys.firstWhere(
              (word) => !answeredTwentyFirstWords.contains(word),
        );

        correctTwentyFirstTurkishTranslation = twentyFirstWordPairs[currentTwentyFirstEnglishWord]!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('21.level:Kelime Eşleştirme Oyunu'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'İkinci aşama: İngilizce kelimeyi Türkçe anlamıyla eşleştir:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Doğru Cevaplar: $correctTwentyFirstAnswersCount',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Toplam Kelimeler: ${twentyFirstWordPairs.length}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              currentTwentyFirstEnglishWord,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: shuffledTwentyFirstTurkishWords
                  .map(
                    (turkishWord) => ElevatedButton(
                  onPressed: () {
                    checkTwentyFirstAnswer(turkishWord);
                  },
                  child: Text(turkishWord),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                          (states) {
                        if (answeredTwentyFirstWords.contains(currentTwentyFirstEnglishWord) &&
                            turkishWord == twentyFirstWordPairs[currentTwentyFirstEnglishWord]) {
                          return Colors.green; // Correctly answered
                        } else {
                          return null; // Use default button color
                        }
                      },
                    ),
                  ),
                ),
              )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
class TwentySecondGameScreen extends StatefulWidget {
  @override
  _TwentySecondGameScreenState createState() => _TwentySecondGameScreenState();
}

class _TwentySecondGameScreenState extends State<TwentySecondGameScreen> {
  Map<String, String> twentySecondWordPairs = {
    'Vain': 'gereksiz',
    'Valley': 'Vadi̇',
    'Valuable': 'Değerli̇',

  };

  late String currentTwentySecondEnglishWord;
  late String correctTwentySecondTurkishTranslation;
  List<String> shuffledTwentySecondTurkishWords = [];
  Set<String> answeredTwentySecondWords = Set<String>();
  int correctTwentySecondAnswersCount = 0;

  @override
  void initState() {
    super.initState();
    startTwentySecondGame();
  }

  void startTwentySecondGame() {
    List<String> twentySecondEnglishWords = twentySecondWordPairs.keys.toList();
    twentySecondEnglishWords.shuffle();

    currentTwentySecondEnglishWord = twentySecondEnglishWords[0];
    correctTwentySecondTurkishTranslation = twentySecondWordPairs[currentTwentySecondEnglishWord]!;

    List<String> allTwentySecondTurkishWords = twentySecondWordPairs.values.toList();
    allTwentySecondTurkishWords.shuffle();

    // Ensure the correct answer is included in the options
    if (!allTwentySecondTurkishWords.contains(correctTwentySecondTurkishTranslation)) {
      allTwentySecondTurkishWords[0] = correctTwentySecondTurkishTranslation;
    }

    shuffledTwentySecondTurkishWords = allTwentySecondTurkishWords;
  }

  void checkTwentySecondAnswer(String selectedTwentySecondTurkishWord) {
    if (selectedTwentySecondTurkishWord == correctTwentySecondTurkishTranslation) {
      setState(() {
        answeredTwentySecondWords.add(currentTwentySecondEnglishWord);
        correctTwentySecondAnswersCount++;
        showNextTwentySecondWord();
      });
    } else {
      // Handle incorrect answer logic if needed
    }
  }

  void showNextTwentySecondWord() {
    setState(() {
      shuffledTwentySecondTurkishWords.shuffle();
      if (answeredTwentySecondWords.length == twentySecondWordPairs.length) {
        // If all words are answered, show congratulations message and navigate to the third game screen
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Tebrikler! 22. leveli geçtiniz..'),
              content: Text('22. aşamayı tamamladınız. 23. aşamaya geçmek ister misiniz?'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => TwentyThirdGameScreen()),
                    );
                  },
                  child: Text('Evet'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                  },
                  child: Text('Hayır'),
                ),
              ],
            );
          },
        );
      } else {
        // Find a new English word that hasn't been answered yet
        currentTwentySecondEnglishWord = twentySecondWordPairs.keys.firstWhere(
              (word) => !answeredTwentySecondWords.contains(word),
        );

        correctTwentySecondTurkishTranslation = twentySecondWordPairs[currentTwentySecondEnglishWord]!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('22.level:Kelime Eşleştirme Oyunu'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'İkinci aşama: İngilizce kelimeyi Türkçe anlamıyla eşleştir:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Doğru Cevaplar: $correctTwentySecondAnswersCount',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Toplam Kelimeler: ${twentySecondWordPairs.length}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              currentTwentySecondEnglishWord,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: shuffledTwentySecondTurkishWords
                  .map(
                    (turkishWord) => ElevatedButton(
                  onPressed: () {
                    checkTwentySecondAnswer(turkishWord);
                  },
                  child: Text(turkishWord),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                          (states) {
                        if (answeredTwentySecondWords.contains(currentTwentySecondEnglishWord) &&
                            turkishWord == twentySecondWordPairs[currentTwentySecondEnglishWord]) {
                          return Colors.green; // Correctly answered
                        } else {
                          return null; // Use default button color
                        }
                      },
                    ),
                  ),
                ),
              )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
class TwentyThirdGameScreen extends StatefulWidget {
  @override
  _TwentyThirdGameScreenState createState() => _TwentyThirdGameScreenState();
}

class _TwentyThirdGameScreenState extends State<TwentyThirdGameScreen> {
  Map<String, String> twentyThirdWordPairs = {
    'Wait': 'beklemek',
    'Walk': 'Yürümek',
    'Wall': 'Duvar',

  };

  late String currentTwentyThirdEnglishWord;
  late String correctTwentyThirdTurkishTranslation;
  List<String> shuffledTwentyThirdTurkishWords = [];
  Set<String> answeredTwentyThirdWords = Set<String>();
  int correctTwentyThirdAnswersCount = 0;

  @override
  void initState() {
    super.initState();
    startTwentyThirdGame();
  }

  void startTwentyThirdGame() {
    List<String> twentyThirdEnglishWords = twentyThirdWordPairs.keys.toList();
    twentyThirdEnglishWords.shuffle();

    currentTwentyThirdEnglishWord = twentyThirdEnglishWords[0];
    correctTwentyThirdTurkishTranslation = twentyThirdWordPairs[currentTwentyThirdEnglishWord]!;

    List<String> allTwentyThirdTurkishWords = twentyThirdWordPairs.values.toList();
    allTwentyThirdTurkishWords.shuffle();

    // Ensure the correct answer is included in the options
    if (!allTwentyThirdTurkishWords.contains(correctTwentyThirdTurkishTranslation)) {
      allTwentyThirdTurkishWords[0] = correctTwentyThirdTurkishTranslation;
    }

    shuffledTwentyThirdTurkishWords = allTwentyThirdTurkishWords;
  }

  void checkTwentyThirdAnswer(String selectedTwentyThirdTurkishWord) {
    if (selectedTwentyThirdTurkishWord == correctTwentyThirdTurkishTranslation) {
      setState(() {
        answeredTwentyThirdWords.add(currentTwentyThirdEnglishWord);
        correctTwentyThirdAnswersCount++;
        showNextTwentyThirdWord();
      });
    } else {
      // Handle incorrect answer logic if needed
    }
  }

  void showNextTwentyThirdWord() {
    setState(() {
      shuffledTwentyThirdTurkishWords.shuffle();
      if (answeredTwentyThirdWords.length == twentyThirdWordPairs.length) {
        // If all words are answered, show congratulations message and navigate to the third game screen
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Tebrikler! 23. leveli geçtiniz..'),
              content: Text('23. aşamayı tamamladınız. 24. aşamaya geçmek ister misiniz?'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => TwentyForthGameScreen()),
                    );
                  },
                  child: Text('Evet'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                  },
                  child: Text('Hayır'),
                ),
              ],
            );
          },
        );
      } else {
        // Find a new English word that hasn't been answered yet
        currentTwentyThirdEnglishWord = twentyThirdWordPairs.keys.firstWhere(
              (word) => !answeredTwentyThirdWords.contains(word),
        );

        correctTwentyThirdTurkishTranslation = twentyThirdWordPairs[currentTwentyThirdEnglishWord]!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('23.level:Kelime Eşleştirme Oyunu'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'İkinci aşama: İngilizce kelimeyi Türkçe anlamıyla eşleştir:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Doğru Cevaplar: $correctTwentyThirdAnswersCount',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Toplam Kelimeler: ${twentyThirdWordPairs.length}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              currentTwentyThirdEnglishWord,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: shuffledTwentyThirdTurkishWords
                  .map(
                    (turkishWord) => ElevatedButton(
                  onPressed: () {
                    checkTwentyThirdAnswer(turkishWord);
                  },
                  child: Text(turkishWord),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                          (states) {
                        if (answeredTwentyThirdWords.contains(currentTwentyThirdEnglishWord) &&
                            turkishWord == twentyThirdWordPairs[currentTwentyThirdEnglishWord]) {
                          return Colors.green; // Correctly answered
                        } else {
                          return null; // Use default button color
                        }
                      },
                    ),
                  ),
                ),
              )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
class TwentyForthGameScreen extends StatefulWidget {
  @override
  _TwentyForthGameScreenState createState() => _TwentyForthGameScreenState();
}

class _TwentyForthGameScreenState extends State<TwentyForthGameScreen> {
  Map<String, String> twentyForthWordPairs = {
    'X-ray': 'röntgen',
    'Xenophobia': 'Yabancı Düşmanlığı',
    'Xmas': '	Noel',

  };

  late String currentTwentyForthEnglishWord;
  late String correctTwentyForthTurkishTranslation;
  List<String> shuffledTwentyForthTurkishWords = [];
  Set<String> answeredTwentyForthWords = Set<String>();
  int correctTwentyForthAnswersCount = 0;

  @override
  void initState() {
    super.initState();
    startTwentyForthGame();
  }

  void startTwentyForthGame() {
    List<String> twentyForthEnglishWords = twentyForthWordPairs.keys.toList();
    twentyForthEnglishWords.shuffle();

    currentTwentyForthEnglishWord = twentyForthEnglishWords[0];
    correctTwentyForthTurkishTranslation = twentyForthWordPairs[currentTwentyForthEnglishWord]!;

    List<String> allTwentyForthTurkishWords = twentyForthWordPairs.values.toList();
    allTwentyForthTurkishWords.shuffle();

    // Ensure the correct answer is included in the options
    if (!allTwentyForthTurkishWords.contains(correctTwentyForthTurkishTranslation)) {
      allTwentyForthTurkishWords[0] = correctTwentyForthTurkishTranslation;
    }

    shuffledTwentyForthTurkishWords = allTwentyForthTurkishWords;
  }

  void checkTwentyForthAnswer(String selectedTwentyForthTurkishWord) {
    if (selectedTwentyForthTurkishWord == correctTwentyForthTurkishTranslation) {
      setState(() {
        answeredTwentyForthWords.add(currentTwentyForthEnglishWord);
        correctTwentyForthAnswersCount++;
        showNextTwentyForthWord();
      });
    } else {
      // Handle incorrect answer logic if needed
    }
  }

  void showNextTwentyForthWord() {
    setState(() {
      shuffledTwentyForthTurkishWords.shuffle();
      if (answeredTwentyForthWords.length == twentyForthWordPairs.length) {
        // If all words are answered, show congratulations message and navigate to the third game screen
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Tebrikler! 24. leveli geçtiniz..'),
              content: Text('24. aşamayı tamamladınız. 25. aşamaya geçmek ister misiniz?'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => TwentyFifthGameScreen()),
                    );
                  },
                  child: Text('Evet'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                  },
                  child: Text('Hayır'),
                ),
              ],
            );
          },
        );
      } else {
        // Find a new English word that hasn't been answered yet
        currentTwentyForthEnglishWord = twentyForthWordPairs.keys.firstWhere(
              (word) => !answeredTwentyForthWords.contains(word),
        );

        correctTwentyForthTurkishTranslation = twentyForthWordPairs[currentTwentyForthEnglishWord]!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('24.level:Kelime Eşleştirme Oyunu'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'İkinci aşama: İngilizce kelimeyi Türkçe anlamıyla eşleştir:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Doğru Cevaplar: $correctTwentyForthAnswersCount',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Toplam Kelimeler: ${twentyForthWordPairs.length}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              currentTwentyForthEnglishWord,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: shuffledTwentyForthTurkishWords
                  .map(
                    (turkishWord) => ElevatedButton(
                  onPressed: () {
                    checkTwentyForthAnswer(turkishWord);
                  },
                  child: Text(turkishWord),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                          (states) {
                        if (answeredTwentyForthWords.contains(currentTwentyForthEnglishWord) &&
                            turkishWord == twentyForthWordPairs[currentTwentyForthEnglishWord]) {
                          return Colors.green; // Correctly answered
                        } else {
                          return null; // Use default button color
                        }
                      },
                    ),
                  ),
                ),
              )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
class TwentyFifthGameScreen extends StatefulWidget {
  @override
  _TwentyFifthGameScreenState createState() => _TwentyFifthGameScreenState();
}

class _TwentyFifthGameScreenState extends State<TwentyFifthGameScreen> {
  Map<String, String> twentyFifthWordPairs = {
    'Yard': 'bahçe',
    'Year': 'Yıl',
    'Yellow': 'Sarı',

  };

  late String currentTwentyFifthEnglishWord;
  late String correctTwentyFifthTurkishTranslation;
  List<String> shuffledTwentyFifthTurkishWords = [];
  Set<String> answeredTwentyFifthWords = Set<String>();
  int correctTwentyFifthAnswersCount = 0;

  @override
  void initState() {
    super.initState();
    startTwentyFifthGame();
  }

  void startTwentyFifthGame() {
    List<String> twentyFifthEnglishWords = twentyFifthWordPairs.keys.toList();
    twentyFifthEnglishWords.shuffle();

    currentTwentyFifthEnglishWord = twentyFifthEnglishWords[0];
    correctTwentyFifthTurkishTranslation = twentyFifthWordPairs[currentTwentyFifthEnglishWord]!;

    List<String> allTwentyFifthTurkishWords = twentyFifthWordPairs.values.toList();
    allTwentyFifthTurkishWords.shuffle();

    // Ensure the correct answer is included in the options
    if (!allTwentyFifthTurkishWords.contains(correctTwentyFifthTurkishTranslation)) {
      allTwentyFifthTurkishWords[0] = correctTwentyFifthTurkishTranslation;
    }

    shuffledTwentyFifthTurkishWords = allTwentyFifthTurkishWords;
  }

  void checkTwentyFifthAnswer(String selectedTwentyFifthTurkishWord) {
    if (selectedTwentyFifthTurkishWord == correctTwentyFifthTurkishTranslation) {
      setState(() {
        answeredTwentyFifthWords.add(currentTwentyFifthEnglishWord);
        correctTwentyFifthAnswersCount++;
        showNextTwentyFifthWord();
      });
    } else {
      // Handle incorrect answer logic if needed
    }
  }

  void showNextTwentyFifthWord() {
    setState(() {
      shuffledTwentyFifthTurkishWords.shuffle();
      if (answeredTwentyFifthWords.length == twentyFifthWordPairs.length) {
        // If all words are answered, show congratulations message and navigate to the third game screen
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Tebrikler! 25. leveli geçtiniz..'),
              content: Text('25. aşamayı tamamladınız. 26.aşamaya geçmek ister misiniz?'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => TwentySixthGameScreen()),
                    );
                  },
                  child: Text('Evet'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                  },
                  child: Text('Hayır'),
                ),
              ],
            );
          },
        );
      } else {
        // Find a new English word that hasn't been answered yet
        currentTwentyFifthEnglishWord = twentyFifthWordPairs.keys.firstWhere(
              (word) => !answeredTwentyFifthWords.contains(word),
        );

        correctTwentyFifthTurkishTranslation = twentyFifthWordPairs[currentTwentyFifthEnglishWord]!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('25.level:Kelime Eşleştirme Oyunu'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'İkinci aşama: İngilizce kelimeyi Türkçe anlamıyla eşleştir:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Doğru Cevaplar: $correctTwentyFifthAnswersCount',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Toplam Kelimeler: ${twentyFifthWordPairs.length}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              currentTwentyFifthEnglishWord,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: shuffledTwentyFifthTurkishWords
                  .map(
                    (turkishWord) => ElevatedButton(
                  onPressed: () {
                    checkTwentyFifthAnswer(turkishWord);
                  },
                  child: Text(turkishWord),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                          (states) {
                        if (answeredTwentyFifthWords.contains(currentTwentyFifthEnglishWord) &&
                            turkishWord == twentyFifthWordPairs[currentTwentyFifthEnglishWord]) {
                          return Colors.green; // Correctly answered
                        } else {
                          return null; // Use default button color
                        }
                      },
                    ),
                  ),
                ),
              )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}








class TwentySixthGameScreen extends StatefulWidget {
  @override
  _TwentySixthGameScreenState createState() => _TwentySixthGameScreenState();
}

class _TwentySixthGameScreenState extends State<TwentySixthGameScreen> {
  Map<String, String> twentySixthWordPairs = {
    'Zap': 'vurmak',
    'Zealous': 'Gayretli',
    'Zinc': 'Çinko',
    // Add more word pairs if needed
  };

  late String currentTwentySixthEnglishWord;
  late String correctTwentySixthTurkishTranslation;
  List<String> shuffledTwentySixthTurkishWords = [];
  Set<String> answeredTwentySixthWords = Set<String>();
  int correctTwentySixthAnswersCount = 0;

  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: const Duration(seconds: 4));
    startTwentySixthGame();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  void startTwentySixthGame() {
    List<String> twentySixthEnglishWords = twentySixthWordPairs.keys.toList();
    twentySixthEnglishWords.shuffle();

    currentTwentySixthEnglishWord = twentySixthEnglishWords[0];
    correctTwentySixthTurkishTranslation = twentySixthWordPairs[currentTwentySixthEnglishWord]!;

    List<String> allTwentySixthTurkishWords = twentySixthWordPairs.values.toList();
    allTwentySixthTurkishWords.shuffle();

    // Ensure the correct answer is included in the options
    if (!allTwentySixthTurkishWords.contains(correctTwentySixthTurkishTranslation)) {
      allTwentySixthTurkishWords[0] = correctTwentySixthTurkishTranslation;
    }

    shuffledTwentySixthTurkishWords = allTwentySixthTurkishWords;
  }

  void checkTwentySixthAnswer(String selectedTwentySixthTurkishWord) {
    if (selectedTwentySixthTurkishWord == correctTwentySixthTurkishTranslation) {
      setState(() {
        answeredTwentySixthWords.add(currentTwentySixthEnglishWord);
        correctTwentySixthAnswersCount++;
        showNextTwentySixthWord();

        if (answeredTwentySixthWords.length == twentySixthWordPairs.length) {
          // If all words are answered, show congratulations message and confetti
          _showCongratulationsDialog();
        }
      });
    } else {
      // Handle incorrect answer logic if needed
    }
  }

  void showNextTwentySixthWord() {
    setState(() {
      shuffledTwentySixthTurkishWords.shuffle();
      if (answeredTwentySixthWords.length == twentySixthWordPairs.length) {
        // If all words are answered, show congratulations message and navigate to the third game screen
        _showCongratulationsDialog();
      } else {
        // Find a new English word that hasn't been answered yet
        currentTwentySixthEnglishWord = twentySixthWordPairs.keys.firstWhere(
              (word) => !answeredTwentySixthWords.contains(word),
        );

        correctTwentySixthTurkishTranslation = twentySixthWordPairs[currentTwentySixthEnglishWord]!;
      }
    });
  }

  void _showCongratulationsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Tebrikler! OYUNU TAMAMLADINIZ'),
          content: Text('Oyundan çıkmak ister misiniz?'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text('Evet'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                _confettiController.play();
              },
              child: Text('Hayır'),
            ),
          ],
        );
      },
    );

    _confettiController.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('final:Kelime Eşleştirme Oyunu'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: true,
              emissionFrequency: 0.7,
            ),
            Text(
              'İkinci aşama: İngilizce kelimeyi Türkçe anlamıyla eşleştir:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Doğru Cevaplar: $correctTwentySixthAnswersCount',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Toplam Kelimeler: ${twentySixthWordPairs.length}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              currentTwentySixthEnglishWord,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: shuffledTwentySixthTurkishWords
                  .map(
                    (turkishWord) => ElevatedButton(
                  onPressed: () {
                    checkTwentySixthAnswer(turkishWord);
                  },
                  child: Text(turkishWord),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                          (states) {
                        if (answeredTwentySixthWords.contains(currentTwentySixthEnglishWord) &&
                            turkishWord == twentySixthWordPairs[currentTwentySixthEnglishWord]) {
                          return Colors.green; // Correctly answered
                        } else {
                          return null; // Use default button color
                        }
                      },
                    ),
                  ),
                ),
              )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}







