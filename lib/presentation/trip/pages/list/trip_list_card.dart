import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trip_planner/domain/trip/repository/trip_model.dart';
import 'package:trip_planner/presentation/widgets/base_card.dart';

class TripListCard extends StatelessWidget {
  final TripModel trip;

  const TripListCard({Key? key, required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseCard.rounded(
      child: Column(
        children: [
          _TripHomeCardImage(trip: trip),
          _TripHomeCardDescription(trip: trip)
        ],
      ),
    );
  }
}

class _TripHomeCardImage extends StatelessWidget {
  final TripModel trip;

  const _TripHomeCardImage({Key? key, required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
    );
  }
}

class _TripHomeCardDescription extends StatelessWidget {
  final TripModel trip;

  const _TripHomeCardDescription({Key? key, required this.trip}) : super(key: key);

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
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Text(
              _prepareDateMessage(),
              style: Theme.of(context).textTheme.caption,
            )
          ])
        ],
      ),
    );
  }

  String _prepareDateMessage() {
    final now = DateTime.now();
    if (now.isAfter(trip.endDate)) return "Finished";
    if (now.isAfter(trip.startDate)) return "Already started";
    final differenceInDays = trip.startDate.difference(now).inDays;
    if (differenceInDays == 1) return "Starts tomorrow";
    return "Starts in $differenceInDays days";
  }
}
