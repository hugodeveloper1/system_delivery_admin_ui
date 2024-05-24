import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:system_delivery_admin_ui/constants/constants_image.dart';
import 'package:system_delivery_admin_ui/controllers/home_controller.dart';
import 'package:system_delivery_admin_ui/presentation/app_colors.dart';

class HomeNavigationBody extends StatelessWidget {
  const HomeNavigationBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();
    final size = MediaQuery.of(context).size;
    double sizeCard = 45;
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Card(
                  child: Container(
                    height: sizeCard,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Search here',
                            style: textTheme.bodySmall!.copyWith(
                              fontSize: 13,
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.search,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Row(
                children: [
                  ConstantsImages.notification,
                  ConstantsImages.message,
                  ConstantsImages.gift,
                  ConstantsImages.settings,
                ]
                    .map((e) => CardIcon(
                          sizeCard: sizeCard,
                          count: 5,
                          icon: e,
                        ))
                    .toList(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: SizedBox(
                  height: sizeCard,
                  child: const VerticalDivider(
                    color: AppColors.lightBlueGrey,
                    width: 2,
                  ),
                ),
              ),
              Text(
                'Hello, Samantha',
                style: textTheme.bodyMedium!.copyWith(
                  fontSize: 12,
                ),
              ),
              const SizedBox(width: 7),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: SizedBox(
                  width: sizeCard,
                  height: sizeCard,
                  child: Image.asset(ConstantsImages.imageProfile),
                ),
              )
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.currentPage.name,
                      style: textTheme.bodyLarge!.copyWith(
                        fontSize: size.width * 0.027,
                      ),
                    ),
                    Text(
                      'Hi, Samantha. Welcome back  to Sedap Admin!',
                      style: textTheme.bodySmall,
                    )
                  ],
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Card(
                        color: AppColors.lightBlue15,
                        child: SizedBox(
                          width: sizeCard * 0.9,
                          height: sizeCard * 0.9,
                          child: Center(
                            child: Image.asset(
                              ConstantsImages.calendar,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      SizedBox(
                        height: sizeCard * 0.9,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Filter Periode',
                              style: textTheme.bodyMedium!.copyWith(
                                color: AppColors.darkBlueGrey,
                              ),
                            ),
                            Text(
                              '17 April 2020 - 21 May 2020',
                              style: textTheme.bodySmall!.copyWith(
                                color: AppColors.darkBlueGrey,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          controller.currentPage.body,
        ],
      ),
    );
  }
}

class CardIcon extends StatelessWidget {
  const CardIcon({
    super.key,
    required this.sizeCard,
    this.count = 0,
    required this.icon,
  });

  final double sizeCard;
  final int count;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizeCard,
      height: sizeCard,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: Card(
              color: AppColors.lightBlue15,
              child: SizedBox(
                width: sizeCard * 0.9,
                height: sizeCard * 0.9,
                child: Center(
                  child: Image.asset(
                    icon,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: CircleAvatar(
              backgroundColor: const Color(0xFFF3F2F7),
              radius: 12,
              child: CircleAvatar(
                radius: 10,
                backgroundColor: AppColors.blue,
                child: Text(
                  checkNumber,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 9,
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  String get checkNumber {
    if (count > 9) {
      return '9+';
    } else {
      return count.toString();
    }
  }
}
