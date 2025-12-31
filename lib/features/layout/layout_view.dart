import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:own_starbucks/features/custom/view/custom_page.dart';
import 'package:own_starbucks/features/home/view/home_page.dart';
import 'package:own_starbucks/features/layout/layout_page.dart';
import 'package:own_starbucks/shared/colors.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key, required this.shell});

  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    // List of exact routes where the bottom nav bar should show
    final List<String> tabRoutes = [HomePage.route, CustomPage.route];

    // Show bottom nav only if we are on a tab route
    final showBottomNav = tabRoutes.contains(location);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) {
          // Get the current tab index
          final currentIndex = shell.currentIndex;

          // If we're not on the home tab (index 0), go back to home
          if (currentIndex != 0) {
            shell.goBranch(0);
          }
        }
      },
      child: Scaffold(
        body: shell,
        bottomNavigationBar: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            bottomAppBarTheme: const BottomAppBarThemeData(
              shadowColor: Colors.transparent,
            ),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              enableFeedback: false,
            ),
          ),
          child: SizedBox(
            child: BottomNavigationBar(
              currentIndex: shell.currentIndex,
              onTap: (index) {
                shell.goBranch(index, initialLocation: true);
              },
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              elevation: 0,
              items: LayoutPageTab.values
                  .map(
                    (tab) => BottomNavigationBarItem(
                      icon: Image.asset(
                        shell.currentIndex == tab.index
                            ? tab.selectedIcon
                            : tab.icon,
                        width: 24,
                        height: 24,
                        color: AppColor.primary,
                      ),
                      label: tab.title,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
