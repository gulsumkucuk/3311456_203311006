import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_proje/genel.dart';
import 'package:flutter_proje/ing.dart';

class BarChartSample6 extends StatefulWidget {
  const BarChartSample6({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BarChartSample6State();
}

class BarChartSample6State extends State<BarChartSample6> {
  int touchedIndex_1 = -1;
  int touchedIndex_2 = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grafik"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Text("İngilizce Test Sonuçları"),
            AspectRatio(
              aspectRatio: 1.3,
              child: Row(
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: PieChart(
                      PieChartData(
                        pieTouchData: PieTouchData(
                          touchCallback:
                              (FlTouchEvent event, pieTouchResponse) {
                            setState(() {
                              if (!event.isInterestedForInteractions ||
                                  pieTouchResponse == null ||
                                  pieTouchResponse.touchedSection == null) {
                                touchedIndex_1 = -1;
                                return;
                              }
                              touchedIndex_1 = pieTouchResponse
                                  .touchedSection!.touchedSectionIndex;
                            });
                          },
                        ),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        sectionsSpace: 0,
                        centerSpaceRadius: 40,
                        sections: ingSections(),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Başarı",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "${calculateAccuracy(touchedIndex_1, TestYapisi.d_y_bilgisi_state).floor()}%",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Text("Genel Test Sonuçları"),
            AspectRatio(
              aspectRatio: 1.3,
              child: Row(
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: PieChart(
                      PieChartData(
                        pieTouchData: PieTouchData(
                          touchCallback:
                              (FlTouchEvent event, pieTouchResponse) {
                            setState(() {
                              if (!event.isInterestedForInteractions ||
                                  pieTouchResponse == null ||
                                  pieTouchResponse.touchedSection == null) {
                                touchedIndex_2 = -1;
                                return;
                              }
                              touchedIndex_2 = pieTouchResponse
                                  .touchedSection!.touchedSectionIndex;
                            });
                          },
                        ),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        sectionsSpace: 0,
                        centerSpaceRadius: 40,
                        sections: genelSections(),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Başarı",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "${calculateAccuracy(touchedIndex_2, SoruSayfasi.genelList).floor()}%",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  double calculateAccuracy(int touchedIndex, List list) {
    int totalAnswers = list.length;
    int correctAnswers = list.where((element) => element == 1).length;

    if (totalAnswers == 0) {
      return 0.0; // To avoid division by zero
    }

    double accuracy = (correctAnswers / totalAnswers) * 100;

    return accuracy;
  }

  List<PieChartSectionData> ingSections() {
    int totalAnswers = TestYapisi.d_y_bilgisi_state.length;
    int correctAnswers =
        TestYapisi.d_y_bilgisi_state.where((element) => element == 1).length;
    int incorrectAnswers = totalAnswers - correctAnswers;
    double correctPercentage = (correctAnswers / totalAnswers) * 100;
    double incorrectPercentage = (incorrectAnswers / totalAnswers) * 100;

    return [
      PieChartSectionData(
        color: Colors.red, // Color for incorrect answers
        value: incorrectAnswers.toDouble(),
        title: '${incorrectAnswers}', // Display number inside chart
        radius: touchedIndex_1 == 0 ? 60.0 : 50.0,
        titleStyle: TextStyle(
          fontSize: touchedIndex_1 == 0 ? 25.0 : 16.0,
          //fontWeight: FontWeight.bold,
          color: Colors.black,
          shadows: [Shadow(color: Colors.black, blurRadius: 2)],
        ),
      ),
      PieChartSectionData(
        color: Colors.green, // Color for correct answers
        value: correctAnswers.toDouble(),
        title: '${correctAnswers}', // Display number inside chart
        radius: touchedIndex_1 == 1 ? 60.0 : 50.0,
        titleStyle: TextStyle(
          fontSize: touchedIndex_1 == 1 ? 25.0 : 16.0,
          //fontWeight: FontWeight.bold,
          color: Colors.black,
          shadows: [Shadow(color: Colors.black, blurRadius: 2)],
        ),
      ),
    ];
  }

  List<PieChartSectionData> genelSections() {
    int totalAnswers = SoruSayfasi.genelList.length;
    int correctAnswers =
        SoruSayfasi.genelList.where((element) => element == 1).length;
    int incorrectAnswers = totalAnswers - correctAnswers;
    double correctPercentage = (correctAnswers / totalAnswers) * 100;
    double incorrectPercentage = (incorrectAnswers / totalAnswers) * 100;

    return [
      PieChartSectionData(
        color: Colors.red, // Color for incorrect answers
        value: incorrectAnswers.toDouble(),
        title: '${incorrectAnswers}', // Display number inside chart
        radius: touchedIndex_2 == 0 ? 60.0 : 50.0,
        titleStyle: TextStyle(
          fontSize: touchedIndex_2 == 0 ? 25.0 : 16.0,
          //fontWeight: FontWeight.bold,
          color: Colors.black,
          shadows: [Shadow(color: Colors.black, blurRadius: 2)],
        ),
      ),
      PieChartSectionData(
        color: Colors.green, // Color for correct answers
        value: correctAnswers.toDouble(),
        title: '${correctAnswers}', // Display number inside chart
        radius: touchedIndex_2 == 1 ? 60.0 : 50.0,
        titleStyle: TextStyle(
          fontSize: touchedIndex_2 == 1 ? 25.0 : 16.0,
          //fontWeight: FontWeight.bold,
          color: Colors.black,
          shadows: [Shadow(color: Colors.black, blurRadius: 2)],
        ),
      ),
    ];
  }
}
