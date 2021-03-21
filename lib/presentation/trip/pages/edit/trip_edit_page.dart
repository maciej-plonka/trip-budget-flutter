import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_planner/dependencies/dependencies.dart';
import 'package:trip_planner/presentation/trip/bloc/trip_by_id/trip_by_id_cubit.dart';
import 'package:trip_planner/presentation/trip/bloc/trip_by_id/trip_by_id_state.dart';
import 'package:trip_planner/presentation/trip/pages/edit/trip_edit_form.dart';
import 'package:trip_planner/presentation/trip/trip_page_scaffold.dart';

class TripEditPage extends StatelessWidget {
  final int tripId;
  final TripByIdCubit _tripByIdCubit = dependencies();

  TripEditPage({Key? key, required this.tripId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TripPageScaffold(
      titleText: "Update trip",
      body: BlocBuilder<TripByIdCubit, TripByIdState>(
        bloc: _tripByIdCubit..getTripById(tripId),
        builder: (context, state) {
          if (state is TripByIdError) {
            return _buildError(state.message);
          }
          if (state is TripByIdLoaded) {
            return TripEditForm(
              trip: state.trip,
              onUpdated: () => Navigator.of(context).pop(),
            );
          }
          return _buildLoading();
        },
      ),
    );
  }
}

Widget _buildError(String message) {
  return Container(child: Text("Error: $message"));
}

Widget _buildLoading() {
  return Container(child: Text("Loading..."));
}
