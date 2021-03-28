import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_planner/domain/budget/repository/budget_model.dart';
import 'package:trip_planner/presentation/budget/bloc/budget_by_trip_id/budget_by_trip_id_cubit.dart';
import 'package:trip_planner/presentation/budget/bloc/budget_by_trip_id/budget_by_trip_id_state.dart';
import 'package:trip_planner/presentation/linear_gradients.dart';
import 'package:trip_planner/presentation/widgets/button/gradient_button.dart';
import 'package:trip_planner/presentation/router/navigator_state_extensions.dart';

class BudgetHomePage extends StatelessWidget {
  final int tripId;
  final BudgetByTripIdCubit cubit;

  BudgetHomePage({required this.tripId, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Budget home", style: TextStyle(color: Colors.white)),
        flexibleSpace: Container(
          decoration: const BoxDecoration(gradient: LinearGradients.orange),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<BudgetByTripIdCubit, BudgetByTripIdState>(
          bloc: cubit..getByTripId(tripId),
          builder: (context, state) {
            if (state is BudgetByTripIdNotFound) {
              return _buildNotFound(context);
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

  Widget _buildNotFound(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Budget for this trip doesn't exist yet"),
          const SizedBox(height: 16.0),
          GradientButton(
            gradient: LinearGradients.primary,
              child: const Center(child: Text("Create budget", style: const TextStyle(color: Colors.white),)),
              onPressed: () {
              Navigator.of(context).pushBudgetNew(tripId);
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
      child: Text("Budget home"),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: Text("Loading..."),
    );
  }
}
