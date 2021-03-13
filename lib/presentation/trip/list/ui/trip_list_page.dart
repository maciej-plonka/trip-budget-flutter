import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_planner/dependencies/dependencies.dart';
import 'package:trip_planner/domain/trip/trip_model.dart';
import 'package:trip_planner/presentation/trip/list/bloc/trip_list_cubit.dart';
import 'package:trip_planner/presentation/trip/list/bloc/trip_list_state.dart';
import 'package:trip_planner/presentation/trip/list/ui/trip_list_card.dart';
import 'package:trip_planner/presentation/trip/trip_page_scaffold.dart';
import 'package:trip_planner/presentation/router/router_navigation_helper_methods.dart';

class TripListPage extends StatelessWidget {
  final cubit = dependencies<TripListCubit>();

  @override
  Widget build(BuildContext context) {
    cubit.getAll();
    return TripPageScaffold(
      titleText: "Trip planner",
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<TripListCubit, TripListState>(
          cubit: cubit,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await ExtendedNavigator.of(context).pushTripNewPage();
          await cubit.getAll();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildLoading() {
    return Text("Loading");
  }

  Widget _buildTripList(List<TripModel> trips) {
    return ListView.builder(
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: TripListCard(trip: trips[index]),
      ),
      itemCount: trips.length,
    );
  }

  Widget _buildError() {
    return Text("Error");
  }
}
