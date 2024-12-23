import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:tflite/tflite.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class Stockprediction extends StatefulWidget {
  const Stockprediction({super.key});

  @override
  State<Stockprediction> createState() => _StockpredictionState();
}

class _StockpredictionState extends State<Stockprediction> {
 bool _isModelLoaded = false;
   @override
  void initState() {
    super.initState();
    loadModel();
  }
Future<void> loadModel() async {
    try {
      debugPrint("Loading model...");
  final interpreter = await Interpreter.fromAsset('assets/models/LSTM.tflite');
      debugPrint("Model loaded: $interpreter");
      setState(() {
        _isModelLoaded = true; // Update UI after the model is loaded
      });
    } catch (e) {
      debugPrint("Error loading model: $e");
    }
  }

  // Future<void> runModel() async {
  //   // Prepare your input data here
  //   var input = [/* Your input data */];

  //   var output = await Tflite.runModelOnBinary(
  //     binary: input, // Input data in the required format
  //   );

  //   print("Model output: $output");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stock Prediction'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Welcome to Stock Prediction',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                textStyle: const TextStyle(fontSize: 18),
              ),
              onPressed: () {
                // Add your onPressed code here!
              },
              child: const Text('Generated Prediction for next 30 days ' ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: List.generate(30, (index) => FlSpot(index.toDouble(), (index * 2).toDouble())),
                      isCurved: true,
                      color: Colors.blue,
                      barWidth: 4,
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
                    bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
                  ),
                  borderData: FlBorderData(show: true),
                  gridData: FlGridData(show: true),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}