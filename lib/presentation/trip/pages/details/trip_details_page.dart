import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_planner/dependencies/dependencies.dart';
import 'package:trip_planner/domain/trip/repository/trip_model.dart';
import 'package:trip_planner/presentation/router/app_router.gr.dart';
import 'package:trip_planner/presentation/trip/bloc/trip_by_id/trip_by_id_cubit.dart';
import 'package:trip_planner/presentation/trip/bloc/trip_by_id/trip_by_id_state.dart';
import 'package:trip_planner/presentation/trip/pages/details/trip_details_card.dart';
import 'package:trip_planner/presentation/trip/pages/details/modules/trip_details_modules.dart';
import 'package:trip_planner/presentation/trip/trip_scaffold.dart';

class TripDetailsPage extends StatelessWidget {
  final int tripId;
  final TripByIdCubit cubit;

  TripDetailsPage(
      {Key? key, @pathParam required this.tripId, TripByIdCubit? cubit})
      : this.cubit = cubit ?? dependencies(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TripScaffold(
      titleText: "Trip details",
      onConfig: () {
        context.router.push(TripEditRoute(
          tripId: tripId,
          onEdited: () => cubit.getTripById(tripId),
        ));
      },
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<TripByIdCubit, TripByIdState>(
          bloc: cubit..getTripById(tripId),
          builder: (context, state) {
            if (state is TripByIdError) {
              return _buildError(state.message);
            }
            if (state is TripByIdLoaded) {
              return _buildTripDetails(state.trip);
            }
            return _buildLoading();
          },
        ),
      ),
    );
  }

  Widget _buildTripDetails(TripModel trip) {
    return Container(
        child: Column(
      children: [
        TripDetailsCard(trip: trip),
        const SizedBox(height: 16),
        TripDetailsModules(tripId: trip.id!),
      ],
    ));
  }
}

Widget _buildLoading() {
  return Container(
    child: Text("Loading"),
  );
}

Widget _buildError(String message) {
  return Container(
    child: Text("Error: $message"),
  );
}
