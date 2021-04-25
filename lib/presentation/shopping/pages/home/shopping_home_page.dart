import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_planner/dependencies/dependencies.dart';
import 'package:trip_planner/presentation/router/app_router.gr.dart';
import 'package:trip_planner/presentation/shopping/bloc/filtered_search_cubit/shopping_filtered_search_cubit.dart';
import 'package:trip_planner/presentation/shopping/bloc/filtered_search_cubit/shopping_filtered_search_state.dart';
import 'package:trip_planner/presentation/shopping/pages/home/shopping_home_page_error_content.dart';
import 'package:trip_planner/presentation/shopping/pages/home/shopping_home_page_list_content.dart';
import 'package:trip_planner/presentation/shopping/pages/shopping_scaffold.dart';
import 'package:trip_planner/presentation/trip_id.dart';
import 'package:trip_planner/presentation/widgets/button/gradient_floating_action_button.dart';
import 'package:auto_route/auto_route.dart';

class ShoppingHomePage extends StatefulWidget {
  final int? tripId;
  final ShoppingFilteredSearchCubit cubit;

  ShoppingHomePage({Key? key, this.tripId, ShoppingFilteredSearchCubit? cubit})
      : this.cubit = cubit ?? dependencies(),
        super(key: key);

  @override
  _ShoppingHomePageState createState() => _ShoppingHomePageState();
}

class _ShoppingHomePageState extends State<ShoppingHomePage> {
  String _category = "All";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tripId = widget.tripId ?? context.read<TripId>().value;
    if (_category == "All") {
      widget.cubit.getAllByTrip(tripId);
    } else {
      widget.cubit.getAllBoughtByTrip(tripId);
    }
    final builder = _ShoppingListBuilder(cubit: widget.cubit);
    return ShoppingTabAdvancedScaffold(
      onCategoryChanged: (category) =>
          setState(() => _category = category.name),
      titleText: "Shopping List",
      categories: [
        ShoppingCategory(name: "All", widget: builder),
        ShoppingCategory(name: "Bought", widget: builder)
      ],
      floatingActionButton: GradientFloatingActionButton.primary(
        onPressed: () {
          context.router.push(ShoppingNewItemRoute(
            tripId: tripId,
            onCreated: () => setState(() => _category = _category),
          ));
        },
      ),
    );
  }
}

class _ShoppingListBuilder extends StatelessWidget {
  final ShoppingFilteredSearchCubit cubit;

  const _ShoppingListBuilder({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingFilteredSearchCubit,
            ShoppingFilteredSearchState>(
        bloc: cubit,
        builder: (context, state) {
          if (state is ShoppingFilteredSearchError) {
            return ShoppingHomePageErrorContent(error: state.error);
          }
          if (state is ShoppingFilteredSearchLoaded) {
            return ShoppingHomePageListContent(items: state.items);
          }
          return Center(
            child: const Text("Loading..."),
          );
        });
  }
}
