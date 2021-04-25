import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_planner/dependencies/dependencies.dart';
import 'package:trip_planner/domain/budget/repository/budget_model.dart';
import 'package:trip_planner/presentation/budget/bloc/budget_by_trip_id/budget_by_trip_id_cubit.dart';
import 'package:trip_planner/presentation/budget/bloc/budget_by_trip_id/budget_by_trip_id_state.dart';
import 'package:trip_planner/presentation/budget/pages/budget_scaffold.dart';
import 'package:trip_planner/presentation/trip_id.dart';
import 'package:trip_planner/presentation/linear_gradients.dart';
import 'package:auto_route/auto_route.dart';
import 'package:trip_planner/presentation/router/app_router.gr.dart';
import 'package:trip_planner/presentation/widgets/button/gradient_button.dart';

class BudgetHomePage extends StatelessWidget {
  final BudgetByTripIdCubit cubit;
  final int? tripId;

  BudgetHomePage({this.tripId, BudgetByTripIdCubit? cubit})
      : this.cubit = cubit ?? dependencies();

  @override
  Widget build(BuildContext context) {
    final tripId = this.tripId ?? context.read<TripId>().value;
    return BudgetScaffold(
      titleText: "Budget home",
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<BudgetByTripIdCubit, BudgetByTripIdState>(
          bloc: cubit..getByTripId(tripId),
          builder: (context, state) {
            if (state is BudgetByTripIdNotFound) {
              return _buildNotFound(context, tripId);
            }
            if (state is BudgetByTripIdError) {
              return _buildError(state.message);
            }
            if (state is BudgetByTripIdLoaded) {
              return _buildBudgetHome(state.budget);
            }
            return _buildLoading();
          },
        ),
      ),
    );
  }

  Widget _buildNotFound(BuildContext context, int tripId) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Budget for this trip doesn't exist yet"),
          const SizedBox(height: 16.0),
          GradientButton(
            gradient: LinearGradients.primary,
            child: const Center(
                child: Text(
              "Create budget",
              style: const TextStyle(color: Colors.white),
            )),
            onPressed: () async {
              context.router.navigate(BudgetNewRoute(
                tripId: tripId,
                onCreated: () => cubit.getByTripId(tripId),
              ));
            },
          )
        ],
      ),
    );
  }

  Widget _buildError(String message) {
    return Center(
      child: Text(message, style: const TextStyle(color: Colors.red)),
    );
  }

  Widget _buildBudgetHome(BudgetModel budget) {
    return Center(
      child: Text("Budget home: ${budget.amount}"),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: Text("Loading..."),
    );
  }
}
