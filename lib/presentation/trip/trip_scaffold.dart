import 'package:flutter/material.dart';

const titleStyle = const TextStyle(color: Colors.black);

class TripScaffold extends StatelessWidget {
  final String titleText;
  final Widget body;
  final Widget? floatingActionButton;
  final VoidCallback? onConfig;

  const TripScaffold(
      {required this.titleText,
      required this.body,
      this.floatingActionButton,
      this.onConfig});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(titleText, style: titleStyle),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          if (onConfig != null)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: GestureDetector(
                  onTap: onConfig,
                  child: Icon(Icons.settings, color: Colors.black)),
            )
        ],
      ),
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}
