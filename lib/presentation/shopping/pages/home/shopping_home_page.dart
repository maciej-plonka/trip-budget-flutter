import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_planner/dependencies/dependencies.dart';
import 'package:trip_planner/presentation/shopping/bloc/filtered_search_cubit/shopping_filtered_search_cubit.dart';
import 'package:trip_planner/presentation/shopping/bloc/filtered_search_cubit/shopping_filtered_search_state.dart';
import 'package:trip_planner/presentation/shopping/pages/home/shopping_home_page_error_content.dart';
import 'package:trip_planner/presentation/shopping/pages/home/shopping_home_page_list_content.dart';
import 'package:trip_planner/presentation/shopping/pages/shopping_scaffold.dart';
import 'package:trip_planner/presentation/widgets/button/gradient_floating_action_button.dart';
import 'package:trip_planner/presentation/router/navigator_state_extensions.dart';

class ShoppingHomePage extends StatefulWidget {
  final int tripId;

  ShoppingHomePage({Key? key, required this.tripId})
      : super(key: key);

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
    final cubit = dependencies<ShoppingFilteredSearchCubit>();
    if (_category == "All") {
      cubit.getAllByTrip(widget.tripId);
    } else {
      cubit.getAllBoughtByTrip(widget.tripId);
    }
    final builder = _ShoppingListBuilder(cubit: cubit);
    return ShoppingTabAdvancedScaffold(
      onCategoryChanged: (category) => setState(() => _category = category.name),
      titleText: "Shopping List",
      categories: [
        ShoppingCategory(name: "All", widget: builder),
        ShoppingCategory(name: "Bought", widget: builder)
      ],
      floatingActionButton: GradientFloatingActionButton.primary(
        onPressed: () async {
          await Navigator.of(context).pushShoppingNewItem(widget.tripId);
          setState(() => _category = _category);
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
