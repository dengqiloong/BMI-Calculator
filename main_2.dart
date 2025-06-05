import 'package:flutter/material.dart';

void main() => runApp(BMICalculatorApp());

class BMICalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: BMIScreen());
  }
}

class BMIScreen extends StatefulWidget {
  @override
  _BMIScreenState createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  String result = "";

  void calculateBMI() {
    final double height = double.tryParse(heightController.text) ?? 0;
    final double weight = double.tryParse(weightController.text) ?? 0;

    if (height > 0 && weight > 0) {
      double heightM = height / 100;
      double bmi = weight / (heightM * heightM);
      setState(() {
        if (bmi < 18.5) {
          result = "Your BMI is ${bmi.toStringAsFixed(2)} (Underweight)";
        } else if (bmi < 25) {
          result = "Your BMI is ${bmi.toStringAsFixed(2)} (Normal)";
        } else {
          result = "Your BMI is ${bmi.toStringAsFixed(2)} (Overweight)";
        }
      });
    } else {
      setState(() {
        result = "Please enter valid height and weight.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI Calculator")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Height (cm)"),
            ),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Weight (kg)"),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: calculateBMI, child: Text("Calculate")),
            SizedBox(height: 20),
            Text(result),
          ],
        ),
      ),
    );
  }
}
