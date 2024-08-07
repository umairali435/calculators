import 'package:flutter/material.dart';
import 'package:mathtool/constants/colors.dart';
import 'package:mathtool/pages/bmi_calculator_result.dart';

class BMICalculatorMainPage extends StatefulWidget {
  const BMICalculatorMainPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _BMICalculatorMainPageState();
  }
}

class _BMICalculatorMainPageState extends State<BMICalculatorMainPage> {
  var key = GlobalKey<FormState>();
  int grupid = 0;
  double _currentvalueheight = 0;
  double _currentvalueweight = 3;
  double _currentvalueage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI Calculator",
          style: TextStyle(color: AppColors.whiteColor),
        ),
        iconTheme: const IconThemeData(color: AppColors.whiteColor),
        backgroundColor: AppColors.primaryColor,
      ),
      body: (Form(
        key: key,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 30.0, top: 30.0, left: 30.0, bottom: 30.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Male",
                                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                        color: AppColors.whiteColor,
                                      ),
                                ),
                                Radio(
                                  activeColor: AppColors.whiteColor,
                                  overlayColor: MaterialStateProperty.all(AppColors.whiteColor),
                                  value: 0,
                                  onChanged: getCheckbox,
                                  groupValue: grupid,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 30.0, top: 30.0, left: 30.0, bottom: 30.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Female",
                                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                        color: AppColors.whiteColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Radio(
                                  activeColor: AppColors.whiteColor,
                                  overlayColor: MaterialStateProperty.all(AppColors.whiteColor),
                                  value: 1,
                                  onChanged: getCheckbox,
                                  groupValue: grupid,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20.0),
                    margin: const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                    width: double.infinity,
                    height: 130,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Height",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                color: AppColors.whiteColor,
                              ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Slider(
                            value: _currentvalueheight,
                            min: 0,
                            max: 3,
                            divisions: 10,
                            activeColor: AppColors.whiteColor,
                            label: _currentvalueheight.round().toString(),
                            onChanged: (double d) {
                              setState(() {
                                debugPrint(d.toString());
                                _currentvalueheight = d;
                              });
                            },
                          ),
                        ),
                        Text(
                          "${_currentvalueheight.toStringAsPrecision(2)}meters",
                          style: const TextStyle(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          height: 130,
                          width: 140,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 0.0, right: 0.0, top: 20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Weight",
                                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                        color: AppColors.whiteColor,
                                      ),
                                ),
                                Expanded(
                                  child: Slider(
                                    value: _currentvalueweight,
                                    activeColor: AppColors.whiteColor,
                                    min: 3,
                                    max: 100,
                                    label: _currentvalueweight.round().toString(),
                                    divisions: 100,
                                    onChanged: (double d) {
                                      setState(() {
                                        _currentvalueweight = d;
                                      });
                                    },
                                  ),
                                ),
                                Text(
                                  "${_currentvalueweight.toStringAsPrecision(2)} Kg",
                                  style: const TextStyle(
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          height: 130,
                          width: 140,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 0.0, right: 1.0, top: 20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Age",
                                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                        color: AppColors.whiteColor,
                                      ),
                                ),
                                Expanded(
                                    child: Slider(
                                  value: _currentvalueage,
                                  min: 1,
                                  max: 130,
                                  activeColor: AppColors.whiteColor,
                                  label: _currentvalueage.round().toString(),
                                  divisions: 130,
                                  onChanged: (double d) {
                                    setState(() {
                                      _currentvalueage = d;
                                    });
                                  },
                                )),
                                Text(
                                  "${_currentvalueage.round()} years",
                                  style: const TextStyle(
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (key.currentState!.validate()) {
                          computeResult();
                        }
                      });
                    },
                    icon: Container(
                      width: double.infinity,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: const Center(
                        child: Text(
                          "Calculate",
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  void computeResult() {
    //defining

    double sum = (_currentvalueweight / (_currentvalueheight * _currentvalueheight));
    // Navigating the result activity screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return ResultActivity(sum.toString());
        },
      ),
    );
  }

  // Checking state of Switches
  void getCheckbox(int? value) {
    setState(() {
      grupid = value!;
      switch (grupid) {
        case 0:
          debugPrint("0");
          break;
        case 1:
          debugPrint("1");
          break;
        default:
          debugPrint("default");
      }
    });
  }
}
