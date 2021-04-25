import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trip_planner/presentation/trip/pages/new/trip_new_form.dart';
import 'package:trip_planner/presentation/trip/trip_scaffold.dart';

class TripNewPage extends StatelessWidget {
  final void Function()? onCreated;

  const TripNewPage({Key? key, this.onCreated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TripScaffold(
      titleText: "Create trip",
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(18.0),
          child: TripNewForm(
            onCreated: () {
              this.onCreated?.call();
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
    );
  }
}
