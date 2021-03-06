import 'package:flutter/material.dart';
import 'package:trip_planner/presentation/linear_gradients.dart';

class BudgetScaffold extends StatelessWidget {
  final Widget body;
  final String titleText;

  const BudgetScaffold({
    Key? key,
    required this.titleText,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleText, style: TextStyle(color: Colors.white)),
        flexibleSpace: Container(
          decoration: const BoxDecoration(gradient: LinearGradients.purple),
        ),
      ),
      body: body,
    );
  }
}
