import 'package:flutter/material.dart';
import 'package:trip_planner/dependencies/dependencies.dart';
import 'package:trip_planner/domain/trip/commands/create/create_trip.dart';
import 'package:trip_planner/domain/trip/commands/create/create_trip_handler.dart';
import 'package:trip_planner/presentation/linear_gradients.dart';
import 'package:trip_planner/presentation/widgets/button/gradient_button.dart';
import 'package:trip_planner/presentation/widgets/form/date_picker_form_field.dart';
import 'package:trip_planner/presentation/widgets/form/image_picker_form_field.dart';

class TripNewForm extends StatefulWidget {
  final Function onCreated;

  const TripNewForm({Key key, @required this.onCreated})
      : assert(onCreated != null),
        super(key: key);

  @override
  _TripNewFormState createState() => _TripNewFormState(onCreated);
}

class _TripNewFormState extends State<TripNewForm> {
  final Function _onCreated;
  final _formKey = GlobalKey<FormState>();
  final _startDateKey = GlobalKey<FormFieldState<DateTime>>();
  final _createTripHandler = dependencies<CreateTripHandler>();
  String _name;
  String _imageUrl;
  DateTime _startDate;
  DateTime _endDate;

  _TripNewFormState(this._onCreated);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ImagePickerFormField(
                height: 180,
                onSaved: (image) => _imageUrl = image,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                child: Column(
                  children: [
                    TextFormField(
                      validator: _nameValidator,
                      onSaved: (value) => _name = value,
                      decoration: const InputDecoration(
                        labelText: "Name",
                        icon: const Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: const Icon(
                            Icons.sticky_note_2,
                            color: const Color(0xFFD04545),
                          ),
                        ),
                      ),
                    ),
                    DatePickerFormField(
                        key: _startDateKey,
                        initialValue: DateTime.now(),
                        onSaved: (startDate) => _startDate = startDate,
                        label: "Start Date",
                        validator: _startDateValidator),
                    DatePickerFormField(
                        initialValue: DateTime.now(),
                        onSaved: (endDate) => _endDate = endDate,
                        label: "End Date",
                        validator: _createEndDateValidator(_startDateKey)),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: GradientButton(
                        onPressed: _handleSubmit,
                        gradient: LinearGradients.primary,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: const EdgeInsets.only(right: 4.0),
                              child: const Icon(Icons.check, color: Colors.white, size: 18.0),
                            ),
                            const Padding(
                              padding: const EdgeInsets.only(left: 4.0),
                              child: const Text("Create",style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
      ),
    );
  }

  void _handleSubmit() async {
    final valid = _formKey.currentState.validate();
    if (!valid) return;
    _formKey.currentState.save();
    final createTrip =
        CreateTrip(name: _name, startDate: _startDate, endDate: _endDate, imageUrl: _imageUrl);
    await _createTripHandler.createTrip(createTrip);
    _onCreated.call();
  }
}

String _nameValidator(String name) {
  if (name == null || name.isEmpty) return "Name is required";
  return null;
}

String _startDateValidator(DateTime startDate) {
  if (startDate == null || DateTime.now().isAfter(startDate))
    return "Trip should start in the future";
  return null;
}

FormFieldValidator<DateTime> _createEndDateValidator(
    GlobalKey<FormFieldState<DateTime>> startDateKey) {
  return (endDate) {
    final startDate = startDateKey.currentState.value;
    if (startDate == null) return null;

    if (endDate == null || !endDate.isAfter(startDate))
      return "Trip should end after Start Date";
    return null;
  };
}
