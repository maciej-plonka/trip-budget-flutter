
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trip_planner/presentation/linear_gradients.dart';

class ShoppingScaffold extends StatelessWidget {
  final Widget body;
  final String titleText;
  final Widget? floatingActionButton;

  const ShoppingScaffold({
    Key? key,
    required this.titleText,
    required this.body,
    this.floatingActionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleText, style: TextStyle(color: Colors.white)),
        flexibleSpace: Container(
          decoration: const BoxDecoration(gradient: LinearGradients.purple),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: floatingActionButton,
      body: body,
    );
  }
}

@immutable
class ShoppingCategory extends Equatable {
  final String name;
  final Widget widget;

  ShoppingCategory({required this.name, required this.widget});

  @override
  List<Object?> get props => [name];
}

class ShoppingTabAdvancedScaffold extends StatefulWidget {
  final String titleText;
  final List<ShoppingCategory> categories;
  final Widget? floatingActionButton;
  final void Function(ShoppingCategory category)? onCategoryChanged;

  const ShoppingTabAdvancedScaffold({
    Key? key,
    required this.titleText,
    required this.categories,
    this.floatingActionButton,
    this.onCategoryChanged,
  })  : assert(categories.length > 0),
        super(key: key);

  @override
  _ShoppingTabAdvancedScaffoldState createState() =>
      _ShoppingTabAdvancedScaffoldState();
}

class _ShoppingTabAdvancedScaffoldState
    extends State<ShoppingTabAdvancedScaffold>
    with SingleTickerProviderStateMixin {

  List<Widget> get tabs =>
      widget.categories.map((category) => Tab(text: category.name)).toList();

  List<Widget> get tabViews =>
      widget.categories.map((category) => category.widget).toList();

  late TabController _tabController;
  late ShoppingCategory _lastCategory;



  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: widget.categories.length, vsync: this);
    _lastCategory = widget.categories.first;
    _tabController.addListener(_notify);
  }

  void _notify() {
    final category = widget.categories[_tabController.index];
    if(category != _lastCategory) {
      _lastCategory = category;
      widget.onCategoryChanged?.call(category);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titleText, style: TextStyle(color: Colors.white)),
        flexibleSpace: Container(
          decoration: const BoxDecoration(gradient: LinearGradients.purple),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: widget.floatingActionButton,
      body: TabBarView(
        controller: _tabController,
        children: tabViews,
      ),
    );
  }

  @override
  void dispose() {
    _tabController.removeListener(_notify);
    _tabController.dispose();
    super.dispose();
  }
}