import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_planner/dependencies/dependencies.dart';
import 'package:trip_planner/domain/trip/trip_model.dart';
import 'package:trip_planner/presentation/router/navigator_state_extensions.dart';
import 'package:trip_planner/presentation/trip/list/bloc/trip_list_cubit.dart';
import 'package:trip_planner/presentation/trip/list/bloc/trip_list_cubit_impl.dart';
import 'package:trip_planner/presentation/trip/list/bloc/trip_list_state.dart';
import 'package:trip_planner/presentation/trip/list/ui/trip_list_card.dart';
import 'package:trip_planner/presentation/trip/trip_page_scaffold.dart';
import 'package:trip_planner/presentation/widgets/button/gradient_floating_action_button.dart';

class TripListPage extends StatelessWidget {
  final _tripListCubit = TripListCubitImpl(dependencies());

  @override
  Widget build(BuildContext context) {
    return TripPageScaffold(
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
          await Navigator.of(context).pushTripNew();
          await _tripListCubit.getAll();
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
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        child: TripListCard(trip: trips[index]),
      ),
    );
  }

  Widget _buildError() {
    return Text("Error");
  }
}
