import 'package:hive/hive.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mathtool/constants/colors.dart';
import 'package:mathtool/models/history_model.dart';
import 'package:mathtool/pages/history_page.dart';
import 'package:mathtool/widgets/button_widget.dart';

class MathsCalculator extends StatefulWidget {
  const MathsCalculator({super.key});

  @override
  State<MathsCalculator> createState() => _MathsCalculatorState();
}

class _MathsCalculatorState extends State<MathsCalculator> {
  String _history = '';
  String _expression = '';

  void numClick(String text) {
    setState(() => _expression += text);
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();

    setState(() {
      _history = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
    final historyItem = HistoryItem()
      ..title = _history
      ..subtitle = _expression;
    Hive.box<HistoryItem>('history').add(historyItem);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: const Text("Math Calculator"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => History(),
                ),
              );
            },
            icon: const Icon(
              Icons.history,
              size: 25.0,
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            alignment: const Alignment(1.0, 1.0),
            child: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Text(
                _history,
                style: GoogleFonts.rubik(
                  textStyle: const TextStyle(
                    fontSize: 24,
                    color: Color(0xFF545F61),
                  ),
                ),
              ),
            ),
          ),
          Container(
            alignment: const Alignment(1.0, 1.0),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                _expression,
                style: GoogleFonts.rubik(
                  textStyle: const TextStyle(
                    fontSize: 48,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CalcButton(
                text: 'AC',
                fillColor: 0xFF6C807F,
                textSize: 20,
                callback: allClear,
              ),
              CalcButton(
                text: 'C',
                fillColor: 0xFF6C807F,
                callback: clear,
              ),
              CalcButton(
                text: '%',
                fillColor: 0xFFFFFFFF,
                textColor: 0xFF65BDAC,
                callback: numClick,
              ),
              CalcButton(
                text: '/',
                fillColor: 0xFFFFFFFF,
                textColor: 0xFF65BDAC,
                callback: numClick,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CalcButton(
                text: '7',
                callback: numClick,
              ),
              CalcButton(
                text: '8',
                callback: numClick,
              ),
              CalcButton(
                text: '9',
                callback: numClick,
              ),
              CalcButton(
                text: '*',
                fillColor: 0xFFFFFFFF,
                textColor: 0xFF65BDAC,
                textSize: 24,
                callback: numClick,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CalcButton(
                text: '4',
                callback: numClick,
              ),
              CalcButton(
                text: '5',
                callback: numClick,
              ),
              CalcButton(
                text: '6',
                callback: numClick,
              ),
              CalcButton(
                text: '-',
                fillColor: 0xFFFFFFFF,
                textColor: 0xFF65BDAC,
                textSize: 38,
                callback: numClick,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CalcButton(
                text: '1',
                callback: numClick,
              ),
              CalcButton(
                text: '2',
                callback: numClick,
              ),
              CalcButton(
                text: '3',
                callback: numClick,
              ),
              CalcButton(
                text: '+',
                fillColor: 0xFFFFFFFF,
                textColor: 0xFF65BDAC,
                textSize: 30,
                callback: numClick,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CalcButton(
                text: '.',
                callback: numClick,
              ),
              CalcButton(
                text: '0',
                callback: numClick,
              ),
              CalcButton(
                text: '00',
                callback: numClick,
                textSize: 26,
              ),
              CalcButton(
                text: '=',
                fillColor: 0xFFFFFFFF,
                textColor: 0xFF65BDAC,
                callback: evaluate,
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
