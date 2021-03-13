import 'package:auto_route/auto_route.dart';

import 'router.gr.dart';

extension RouterNavigationHelperMethods on ExtendedNavigatorState {
  Future pushTripNewPage() => push(Routes.tripNewPage);
}