import 'package:flutter/material.dart';

class InputOutputArea extends StatelessWidget {
  final String input;
  final String output;
  final bool hideInput;
  final double outputSize;
  final bool isDarkMode;

  const InputOutputArea({
    Key? key,
    required this.input,
    required this.output,
    required this.hideInput,
    required this.outputSize,
    required this.isDarkMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2, // More space for input/output
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              hideInput ? "" : input,
              style: TextStyle(
                fontSize: input.length > 10 ? 32 : 48, // Adjust text size
                color: isDarkMode ? Colors.white : Colors.black,
                overflow: TextOverflow.ellipsis, // Handle long input
              ),
            ),
            const SizedBox(height: 20),
            Text(
              output,
              style: TextStyle(
                fontSize: outputSize,
                color:
                    (isDarkMode ? Colors.white : Colors.black).withOpacity(0.7),
                overflow: TextOverflow.ellipsis, // Handle long output
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
