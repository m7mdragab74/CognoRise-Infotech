import 'package:flutter/material.dart';

class HistoryArea extends StatelessWidget {
  final List<String> history;
  final bool isDarkMode;
  final VoidCallback clearHistory;
  final Function(int) deleteHistoryEntry;

  const HistoryArea({
    Key? key,
    required this.history,
    required this.isDarkMode,
    required this.clearHistory,
    required this.deleteHistoryEntry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: isDarkMode ? Colors.grey[900] : Colors.grey[300],
      child: Column(
        children: [
          // Clear all history button
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(Icons.delete_sweep),
              color: Colors.orange,
              onPressed: clearHistory,
            ),
          ),
          history.isEmpty
              ? Center(
                  child: Text(
                    "No history yet",
                    style: TextStyle(
                      color: isDarkMode ? Colors.white70 : Colors.black54,
                    ),
                  ),
                )
              : Column(
                  children: [
                    const Text(
                      "History",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                    SizedBox(
                      height: 100, // History section height
                      child: ListView.builder(
                        itemCount: history.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              history[index],
                              style: TextStyle(
                                fontSize: 16,
                                color: isDarkMode
                                    ? Colors.white.withOpacity(0.6)
                                    : Colors.black.withOpacity(0.6),
                              ),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              color: Colors.red,
                              onPressed: () => deleteHistoryEntry(index),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
