

import 'package:flutter/material.dart';

class DatePickerFormField extends FormField<DateTime> {
  DatePickerFormField(
      {Key key,
        FormFieldValidator<DateTime> validator,
        DateTime initialValue,
        FormFieldSetter<DateTime> onSaved,
        String label})
      : super(
    key: key,
    validator: validator,
    builder: _createBuilder(label, validator),
    onSaved: onSaved,
    initialValue: initialValue,
  );

  static FormFieldBuilder<DateTime> _createBuilder(String label, FormFieldValidator<DateTime> validator) {
    final textFieldKey = GlobalKey<FormFieldState<String>>();
    return (FormFieldState<DateTime> field) {
      return Column(

        children: [
          TextFormField(
            key: textFieldKey,
            initialValue: _formatDate(field.value),
            readOnly: true,
            onTap: () async {
              final date = await showDatePicker(
                context: field.context,
                initialDate: field.value ?? DateTime.now(),
                firstDate: DateTime(DateTime.now().day - 1),
                lastDate: DateTime(DateTime.now().year + 5),
              );
              field.didChange(date);
              textFieldKey.currentState?.didChange(_formatDate(date));
            },
            validator: (_) => validator.call(field.value),
            decoration: InputDecoration(
              labelText: label,
              icon: const Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: const Icon(
                  Icons.calendar_today,
                  color: const Color(0xFFD04545),
                ),
              ),
            ),
          ),
        ],
      );
    };
  }

  static String _formatDate(DateTime dateTime) {
    if (dateTime == null) {
      return "__/__/____";
    }
    return "${_formatNumber(dateTime.day)}/${_formatNumber(dateTime.month)}/${dateTime.year}";
  }

  static String _formatNumber(int number) {
    return number < 10 ? "0$number" : "$number";
  }
}
