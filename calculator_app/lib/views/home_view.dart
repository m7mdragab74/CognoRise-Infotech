import 'package:calculator_app/widget/botton_gird.dart';
import 'package:calculator_app/widget/history_area.dart';
import 'package:calculator_app/widget/input_out_area.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/services.dart'; // For vibration feedback

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String input = "";
  String output = "";
  bool hideInput = false;
  double outputSize = 34.0;
  bool isDarkMode = true;
  List<String> history = []; // To track calculation history

  // Method to handle button clicks
  void onButtonClick(String value) {
    HapticFeedback.lightImpact(); // Vibration feedback on button press

    if (value == "AC") {
      input = "";
      output = "";
    } else if (value == "<") {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    } else if (value == "=") {
      if (input.isNotEmpty) {
        var userInput = input.replaceAll("x", "*");

        try {
          Parser p = Parser();
          Expression expression = p.parse(userInput);
          ContextModel cm = ContextModel();
          var finalValue = expression.evaluate(EvaluationType.REAL, cm);
          output = finalValue.toString();
          if (output.endsWith(".0")) {
            output = output.substring(0, output.length - 2);
          }
          input = output;
          hideInput = true;
          outputSize = 52;
          history.add("$userInput = $output"); // Add to history
        } catch (e) {
          output = "Invalid Expression";
        }
      }
    } else {
      input += value;
      hideInput = false;
      outputSize = 34;
    }

    setState(() {});
  }

  // Clear entire history
  void clearHistory() {
    setState(() {
      history.clear();
    });
  }

  // Delete a specific history entry
  void deleteHistoryEntry(int index) {
    setState(() {
      history.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Toggle theme button
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(isDarkMode ? Icons.wb_sunny : Icons.nights_stay),
                color: isDarkMode ? Colors.white : Colors.black,
                onPressed: () {
                  setState(() {
                    isDarkMode = !isDarkMode;
                  });
                },
              ),
            ),
            // Input and output area
            InputOutputArea(
              input: input,
              output: output,
              hideInput: hideInput,
              outputSize: outputSize,
              isDarkMode: isDarkMode,
            ),
            // Buttons area
            ButtonGrid(
              onButtonClick: onButtonClick,
              isDarkMode: isDarkMode,
            ),
            // Show calculation history with delete options
            HistoryArea(
              history: history,
              isDarkMode: isDarkMode,
              clearHistory: clearHistory,
              deleteHistoryEntry: deleteHistoryEntry,
            ),
          ],
        ),
      ),
    );
  }
}
