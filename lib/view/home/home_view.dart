import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:system_delivery_admin_ui/controllers/home_controller.dart';
import 'package:system_delivery_admin_ui/presentation/app_colors.dart';
import 'package:system_delivery_admin_ui/view/home/home_body.dart';
import 'package:system_delivery_admin_ui/widgets/layout/page_layout.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return PageLayout(
      windowWidth: size.width * 0.9,
      windowHeight: size.height * 0.9,
      navigation: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sedap',
                  style: textTheme.bodyLarge,
                ),
                Text(
                  'Modern Admin Dashboard',
                  style: textTheme.bodySmall,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: HomeNavigation.values.length,
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 7,
              ),
              itemBuilder: (context, index) {
                final e = HomeNavigation.values[index];
                final selected = controller.currentPage == e;
                return ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  title: Text(
                    e.name,
                    style: textTheme.bodyMedium!.copyWith(
                      color: selected
                          ? Theme.of(context).primaryColor
                          : AppColors.darkPurpleGrey,
                    ),
                  ),
                  tileColor: selected ? AppColors.lightGreen15 : null,
                  onTap: () {
                    context.read<HomeController>().changeNavigation(section: e);
                  },
                );
              },
            ),
          ),
        ],
      ),
      body: const HomeNavigationBody(),
    );
  }
}
