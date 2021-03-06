import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_planner/dependencies/dependencies.dart';
import 'package:trip_planner/domain/trip/repository/trip_model.dart';
import 'package:trip_planner/presentation/router/app_router.gr.dart';
import 'package:trip_planner/presentation/trip/bloc/trip_list/trip_list_cubit.dart';
import 'package:trip_planner/presentation/trip/bloc/trip_list/trip_list_state.dart';
import 'package:trip_planner/presentation/trip/pages/list/trip_list_card.dart';
import 'package:trip_planner/presentation/trip/trip_scaffold.dart';
import 'package:trip_planner/presentation/widgets/button/gradient_floating_action_button.dart';

class TripListPage extends StatelessWidget {
  final TripListCubit _tripListCubit = dependencies();

  @override
  Widget build(BuildContext context) {
    return TripScaffold(
      titleText: "Trip planner",
      body: Container(
        child: BlocBuilder<TripListCubit, TripListState>(
          bloc: _tripListCubit..getAll(),
          builder: (context, state) {
            if (state is TripListLoading || state is TripListInitial) {
              return _buildLoading();
            }
            if (state is TripListLoaded) {
              return _buildTripList(state.trips);
            }
            return _buildError();
          },
        ),
      ),
      floatingActionButton: GradientFloatingActionButton.primary(
        onPressed: () async {
          await AutoRouter.of(context).push(TripNewRoute(
            onCreated: () => _tripListCubit.getAll()
          ));
        },
      ),
    );
  }

  Widget _buildLoading() {
    return Text("Loading");
  }

  Widget _buildTripList(List<TripModel> trips) {
    return ListView.builder(
      itemCount: trips.length,
      itemBuilder: (context, index) {
        final trip = trips[index];
        return Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: GestureDetector(
            onTap: () {
              AutoRouter.of(context).navigate(TripDetailsRoute(tripId: trip.id!));
            },
            child: TripListCard(trip: trip),
          ),
        );
      },
    );
  }

  Widget _buildError() {
    return Text("Error");
  }
}
