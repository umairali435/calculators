import 'package:flutter/material.dart';
import 'package:mathtool/constants/colors.dart';
import 'package:mathtool/pages/bmi_calculator_main.dart';
import 'package:mathtool/pages/math_calculator.dart';
import 'package:mathtool/pages/percentage_calculator.dart';

class MultipleCalculators extends StatelessWidget {
  const MultipleCalculators({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          "Calculator Tools",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CalculatorContainer(
            image: "assets/math.png",
            title: "Maths Calculator",
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MathsCalculator(),
                ),
              );
            },
          ),
          CalculatorContainer(
            image: "assets/percent.png",
            title: "Discount Calculator",
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const DiscountCalculator(),
                ),
              );
            },
          ),
          CalculatorContainer(
            image: "assets/bmi.png",
            title: "BMI Calculator",
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const BMICalculatorMainPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CalculatorContainer extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback onPressed;
  const CalculatorContainer({
    super.key,
    required this.image,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          margin: const EdgeInsets.all(20.0),
          height: 100.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 80.0,
                width: 80.0,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin: const EdgeInsets.all(15.0),
                child: Center(
                  child: Image.asset(
                    image,
                    color: AppColors.primaryColor,
                    height: 50.0,
                  ),
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                  color: AppColors.whiteColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
