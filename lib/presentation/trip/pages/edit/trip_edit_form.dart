import 'package:flutter/material.dart';
import 'package:trip_planner/dependencies/dependencies.dart';
import 'package:trip_planner/domain/trip/commands/update/trip_update_command.dart';
import 'package:trip_planner/domain/trip/commands/update/trip_update_command_handler.dart';
import 'package:trip_planner/domain/trip/repository/trip_model.dart';
import 'package:trip_planner/presentation/linear_gradients.dart';
import 'package:trip_planner/presentation/widgets/base_card.dart';
import 'package:trip_planner/presentation/widgets/button/gradient_button.dart';
import 'package:trip_planner/presentation/widgets/form/date_picker_form_field.dart';
import 'package:trip_planner/presentation/widgets/form/image_picker_form_field.dart';

class TripEditForm extends StatefulWidget {
  final Function onUpdated;
  final TripModel trip;

  const TripEditForm(
      {Key? key, required this.onUpdated, required this.trip})
      : super(key: key);

  @override
  _TripEditFormState createState() => _TripEditFormState(onUpdated, trip);
}

class _TripEditFormState extends State<TripEditForm> {
  final Function _onUpdated;
  final TripModel _currentTrip;
  final TripUpdateCommandHandler _updateTripHandler = dependencies();

  final _formKey = GlobalKey<FormState>();
  final _startDateKey = GlobalKey<FormFieldState<DateTime>>();

  String? _name;
  String? _imageUrl;
  DateTime? _startDate;
  DateTime? _endDate;

  _TripEditFormState(this._onUpdated, this._currentTrip);

  @override
  Widget build(BuildContext context) {
    return BaseCard.rounded(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ImagePickerFormField(
              initialValue: _currentTrip.imageUrl,
              height: 180,
              onSaved: (image) => _imageUrl = image,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Column(
                children: [
                  TextFormField(
                    validator: _nameValidator,
                    initialValue: _currentTrip.name,
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
                      initialValue: _currentTrip.startDate,
                      onSaved: (startDate) => _startDate = startDate,
                      label: "Start Date",
                      validator: _startDateValidator),
                  DatePickerFormField(
                      initialValue: _currentTrip.endDate,
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
                            child: const Icon(Icons.check,
                                color: Colors.white, size: 18.0),
                          ),
                          const Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: const Text("Update",
                                style: TextStyle(color: Colors.white)),
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
    final formState = _formKey.currentState;
    if(formState == null) return;
    final valid = formState.validate();
    if (!valid) return;
    formState.save();
    final updateTrip = TripUpdateCommand(
        id: _currentTrip.id!,
        name: _name!,
        startDate: _startDate!,
        endDate: _endDate!,
        imageUrl: _imageUrl);
    await _updateTripHandler.updateTrip(updateTrip);
    _onUpdated.call();
  }
}

String? _nameValidator(String? name) {
  if (name == null || name.isEmpty) return "Name is required";
  return null;
}

String? _startDateValidator(DateTime? startDate) {
  if (startDate == null || DateTime.now().isAfter(startDate))
    return "Trip should start in the future";
  return null;
}

FormFieldValidator<DateTime> _createEndDateValidator(
    GlobalKey<FormFieldState<DateTime>> startDateKey) {
  return (endDate) {
    final startDate = startDateKey.currentState!.value;
    if (startDate == null) return null;

    if (endDate == null || !endDate.isAfter(startDate))
      return "Trip should end after Start Date";
    return null;
  };
}
