import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trip_planner/presentation/trip/new/ui/trip_new_form.dart';
import 'package:trip_planner/presentation/trip/trip_page_scaffold.dart';

class TripNewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TripPageScaffold(
      titleText: "Create trip",
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(18.0),
          child: TripNewForm(
            onCreated: () => Navigator.of(context).pop(),
          ),
        ),
      ),
    );
  }
}
