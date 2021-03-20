import 'dart:io';

import 'package:flutter/material.dart';
import 'package:trip_planner/domain/trip/repository/trip_model.dart';
import 'package:trip_planner/presentation/widgets/base_card.dart';

class TripDetailsCard extends StatelessWidget {
  final TripModel trip;

  const TripDetailsCard({Key? key, required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseCard.rounded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _TripDetailsCardImage(imageUrl: trip.imageUrl),
          _TripDetailsCardDescription(trip: trip)
        ],
      ),
    );
  }
}

class _TripDetailsCardImage extends StatelessWidget {
  final String? imageUrl;

  const _TripDetailsCardImage({Key? key, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageFile = File(imageUrl ?? "");
    return Container(
      height: 180.0,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        child: Image.file(imageFile),
      ),
    );
  }
}

class _TripDetailsCardDescription extends StatelessWidget {
  final TripModel trip;

  const _TripDetailsCardDescription({Key? key, required this.trip})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Row(children: [
            Text(
              trip.name,
              style: Theme.of(context).textTheme.subtitle1,
            )
          ]),
          const SizedBox(
            height: 8,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
            Text(
              _formatDate(trip.startDate),
              style: Theme.of(context).textTheme.caption,
            ),
            Text(
              _formatDate(trip.endDate),
              style: Theme.of(context).textTheme.caption,
            )
          ])
        ],
      ),
    );
  }
}

String _formatDate (DateTime dateTime) {
  final fix = (int number) => number < 10 ? "0$number" : "$number";
  final day = fix(dateTime.day);
  final month = fix(dateTime.month);
  final year = dateTime.year;
  return "$day-$month-$year";
}