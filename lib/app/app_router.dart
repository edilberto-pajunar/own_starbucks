import 'package:go_router/go_router.dart';
import 'package:own_starbucks/features/customize/data/model/customized_drink.dart';
import 'package:own_starbucks/features/customize/view/add/add_customize_page.dart';
import 'package:own_starbucks/features/customize/view/customize_page.dart';
import 'package:own_starbucks/features/customize/view/edit/edit_customize_page.dart';
import 'package:own_starbucks/features/home/view/home_page.dart';
import 'package:own_starbucks/features/layout/layout_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            LayoutPage(shell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: "/",
                name: HomePage.route,
                builder: (context, state) => HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: "/customize",
                name: CustomizePage.route,
                builder: (context, state) => CustomizePage(),
                routes: [
                  GoRoute(
                    path: "edit",
                    name: EditCustomizePage.route,
                    builder: (context, state) => EditCustomizePage(
                      drink: state.extra as CustomizedDrink,
                    ),
                  ),
                ],
              ),
              GoRoute(
                path: "/customize/add",
                name: AddCustomizePage.route,
                builder: (context, state) => AddCustomizePage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
