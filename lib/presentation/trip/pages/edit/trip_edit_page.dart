import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_planner/domain/trip/commands/update/trip_update_command_handler.dart';
import 'package:trip_planner/presentation/trip/bloc/trip_by_id/trip_by_id_cubit.dart';
import 'package:trip_planner/presentation/trip/bloc/trip_by_id/trip_by_id_state.dart';
import 'package:trip_planner/presentation/trip/pages/edit/trip_edit_form.dart';
import 'package:trip_planner/presentation/trip/trip_scaffold.dart';

class TripEditPage extends StatelessWidget {
  final int tripId;
  final TripByIdCubit tripByIdCubit;
  final TripUpdateCommandHandler updateCommandHandler;

  const TripEditPage(
      {Key? key,
      required this.tripId,
      required this.tripByIdCubit,
      required this.updateCommandHandler})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TripScaffold(
      titleText: "Update trip",
      body: BlocBuilder<TripByIdCubit, TripByIdState>(
        bloc: tripByIdCubit..getTripById(tripId),
        builder: (context, state) {
          if (state is TripByIdError) {
            return _buildError(state.message);
          }
          if (state is TripByIdLoaded) {
            return TripEditForm(
              trip: state.trip,
              onUpdated: () => Navigator.of(context).pop(),
              updateCommandHandler: updateCommandHandler,
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
