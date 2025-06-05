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
  final ageController = TextEditingController();
  String gender = "Male";
  String result = "";
  double userBMI = 0;

  void calculateBMI() {
    final double height = double.tryParse(heightController.text) ?? 0;
    final double weight = double.tryParse(weightController.text) ?? 0;
    final int age = int.tryParse(ageController.text) ?? 0;

    if (height > 0 && weight > 0 && age > 0) {
      double heightM = height / 100;
      double bmi = weight / (heightM * heightM);
      String category = classifyBMI(bmi);
      String meal = getMealPlan(bmi);
      String tip = getTip(bmi, gender, age);

      setState(() {
        userBMI = bmi;
        result =
            "Your BMI is ${bmi.toStringAsFixed(2)} ($category)\n\n🍱 Meal Plan:\n$meal\n\n💡 Tip:\n$tip";
      });
    } else {
      setState(() {
        result = "Please enter valid height, weight, and age.";
      });
    }
  }

  String classifyBMI(double bmi) {
    if (bmi < 18.5)
      return "Underweight";
    else if (bmi < 25.0)
      return "Normal Weight";
    else if (bmi < 30.0)
      return "Overweight";
    else if (bmi < 35.0)
      return "Obesity";
    else
      return "Extreme Obesity";
  }

  String getMealPlan(double bmi) {
    if (bmi < 18.5)
      return "Eat more protein, nuts, rice, and healthy fats.";
    else if (bmi < 25.0)
      return "Balanced meals: fruits, vegetables, fish, grains.";
    else if (bmi < 30.0)
      return "Low fat: oats, lean meats, less sugar.";
    else
      return "Very low-carb: greens, no soda, grilled foods.";
  }

  String getTip(double bmi, String gender, int age) {
    String tip = "";
    if (bmi < 18.5)
      tip = "Do strength workouts and eat more often.";
    else if (bmi < 25.0)
      tip = "Walk 30 mins daily and stretch.";
    else if (bmi < 30.0)
      tip = "Jog 3 times/week and control portions.";
    else
      tip = "Avoid fried foods and move every day.";

    if (gender == "Female")
      tip += " Focus on core and leg workouts.";
    else
      tip += " Add chest and back exercises.";

    if (age >= 40)
      tip += " Do regular checkups.";
    else
      tip += " Stay consistent daily.";

    return tip;
  }

  Widget genderSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Gender: "),
        Radio<String>(
          value: "Male",
          groupValue: gender,
          onChanged: (value) => setState(() => gender = value!),
        ),
        Text("Male"),
        Radio<String>(
          value: "Female",
          groupValue: gender,
          onChanged: (value) => setState(() => gender = value!),
        ),
        Text("Female"),
      ],
    );
  }

  InputDecoration inputStyle(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.purple),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0ceff),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xffe1affd), Color(0xfff0ceff)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.purple.shade200,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  "BMI Calculator",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff9300ff),
                  ),
                ),
                SizedBox(height: 24),
                TextField(
                  controller: heightController,
                  keyboardType: TextInputType.number,
                  decoration: inputStyle("Height (cm)"),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  decoration: inputStyle("Weight (kg)"),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  decoration: inputStyle("Age"),
                ),
                SizedBox(height: 16),
                genderSelector(),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: calculateBMI,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffb042ff),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    "Calculate",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  result,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff9300ff),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 24),
                if (userBMI > 0)
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Image.asset('assets/img1.webp', fit: BoxFit.contain),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
