// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mathtool/constants/colors.dart';

// Result Activity
class ResultActivity extends StatelessWidget {
  String data = "";
  ResultActivity(String updatedData, {super.key}) {
    data = updatedData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: Datashowing(data),
    );
  }
}

class Datashowing extends StatefulWidget {
  String data = "";

  Datashowing(String updatedData, {super.key}) {
    data = updatedData;
  }

  @override
  State<StatefulWidget> createState() {
    return ResultActivityState(data);
  }
}

class ResultActivityState extends State<Datashowing> {
  String data = "";
  String category = "category";
  double cate = 0.0;

  ResultActivityState(String dataupdated) {
    data = dataupdated;
    cate = double.parse(dataupdated);
    if (cate < 18.5) {
      category = "Thin";
      debugPrint("Thin ->$cate");
    } else if (cate >= 18.5 && cate <= 24.9) {
      category = "Healthy";
      debugPrint("Healthy ->$cate");
    } else if (cate >= 25 && cate <= 29.9) {
      category = "Overweight";
      debugPrint("Overwight ->$cate");
    } else {
      category = "Obese";
      debugPrint("Obese ->$cate");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: (Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              child: Center(
                child: Text(
                  cate.toStringAsPrecision(4),
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: AppColors.whiteColor,
                      ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              child: Center(
                child: Text(
                  "Score",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColors.whiteColor,
                      ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              child: Center(
                child: Text(
                  category,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.whiteColor,
                      ),
                ),
              ),
            ),
            const Divider(),
            Container(
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.only(bottom: 10.0),
              child: Center(
                child: Text(
                  """Body mass index (BMI) is a value derived from the mass (weight) and height of a person. The BMI is defined as the body mass divided by the square of the body height, and is expressed in units of kg/ m2, resulting from mass in kilograms and height in metres.
The calculations within this app do not contain medical advice. 

The contents of this app, such as text, graphics, images and other material are intended for informational and educational purposes only and not for the purpose of rendering medical advice. The contents of this app are not intended to substitute for professional medical advice, diagnosis or treatment. Although we take efforts to keep the medical information on our app updated, we cannot guarantee that the information on our app reflects the most up-to- date research. Please consult your physician for personalized medical advice.""",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColors.whiteColor,
                      ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
