import 'package:flutter/material.dart';

const titleStyle = const TextStyle(color: Colors.black);

class TripPageScaffold extends StatelessWidget {
  final String titleText;
  final Widget body;
  final Widget floatingActionButton;

  const TripPageScaffold({@required this.titleText, @required this.body, this.floatingActionButton});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          title: Text(titleText, style: titleStyle),
          backgroundColor: Colors.white,
          centerTitle: true
      ),
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }

}
