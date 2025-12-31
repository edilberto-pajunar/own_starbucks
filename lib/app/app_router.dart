import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:go_router/go_router.dart';
import 'package:own_starbucks/admin/features/custom_drinks/view/custom_drinks_page.dart';
import 'package:own_starbucks/admin/features/dashboard/view/dashboard_page.dart';
import 'package:own_starbucks/admin/features/drinks/view/drink_details_page.dart';
import 'package:own_starbucks/admin/features/drinks/view/drinks_page.dart';
import 'package:own_starbucks/features/custom/model/custom_drink.dart';
import 'package:own_starbucks/features/custom/view/add/add_custom_page.dart';
import 'package:own_starbucks/features/custom/view/custom_page.dart';
import 'package:own_starbucks/features/custom/view/edit/edit_custom_page.dart';
import 'package:own_starbucks/features/home/model/drink.dart';
import 'package:own_starbucks/features/home/view/home_page.dart';
import 'package:own_starbucks/features/layout/layout_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: kIsWeb ? '/admin' : '/',
    redirect: (context, state) {
      print("Current route: ${state.uri}");

      return null;
    },
    routes: [
      if (kIsWeb)
        GoRoute(
          path: '/admin',
          name: AdminDashboardPage.route,
          builder: (context, state) => AdminDashboardPage(),
          routes: [
            // GoRoute(
            //   path: "drinks",
            //   name: AdminDrinksPage.route,
            //   builder: (context, state) => AdminDrinksPage(),
            //   routes: [
            //     GoRoute(
            //       path: "details/:drink_id",
            //       name: AdminDrinkDetailsPage.route,
            //       builder: (context, state) {
            //         final drinkId = state.pathParameters["drink_id"] ?? "";
            //         return AdminDrinkDetailsPage(drinkId: drinkId);
            //       },
            //     ),
            //   ],
            // ),
            // GoRoute(
            //   path: "custom-drinks",
            //   name: AdminCustomDrinksPage.route,
            //   builder: (context, state) => AdminCustomDrinksPage(),
            // ),
          ],
        )
      else
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
                  name: CustomPage.route,
                  builder: (context, state) => CustomPage(),
                  routes: [
                    GoRoute(
                      path: "edit",
                      name: EditCustomPage.route,
                      builder: (context, state) =>
                          EditCustomPage(drink: state.extra as CustomDrink),
                    ),
                  ],
                ),
                GoRoute(
                  path: "/customize/add",
                  name: AddCustomPage.route,
                  builder: (context, state) => AddCustomPage(),
                ),
              ],
            ),
          ],
        ),
    ],
  );
}
