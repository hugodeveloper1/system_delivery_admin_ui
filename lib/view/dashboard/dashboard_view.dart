import 'package:flutter/material.dart';
import 'package:system_delivery_admin_ui/constants/constants_image.dart';
import 'package:system_delivery_admin_ui/presentation/app_colors.dart';
import 'package:system_delivery_admin_ui/view/dashboard/foods_list.dart';
import 'package:system_delivery_admin_ui/widgets/circular_percentage.dart';

/* enum DashboardTotalQuantities {
  orders,
  delivered,
  canceled,
  revenue;

  String get name {
    switch (this) {
      case orders:
        return 'Total orders';

      case delivered:
        return 'Total delivered';

      case canceled:
        return 'Total canceled';

      case revenue:
        return 'Total revenue';
    }
  }

  String get icon {
    switch (this) {
      case orders:
        return ConstantsImages.listArrow;

      case delivered:
        return ConstantsImages.box;

      case canceled:
        return ConstantsImages.listClose;

      case revenue:
        return ConstantsImages.bag;
    }
  }
} */

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
          width: size.width,
          height: 85,
          child: const Row(
            /* children: DashboardTotalQuantities.values.map((e) {
              return Expanded(
                child: CardTotalQuantities(
                  name: e.name,
                  image: e.icon,
                  count: '100',
                ),
              );
            }).toList(), */
            children: [
              CardTotalQuantities(
                name: 'Total orders',
                image: ConstantsImages.listArrow,
                count: '100',
              ),
              SizedBox(width: 15),
              CardTotalQuantities(
                name: 'Total delivered',
                image: ConstantsImages.box,
                count: '100',
              ),
              SizedBox(width: 15),
              CardTotalQuantities(
                name: 'Total canceled',
                image: ConstantsImages.listClose,
                count: '100',
              ),
              SizedBox(width: 15),
              CardTotalQuantities(
                name: 'Total revenue',
                image: ConstantsImages.bag,
                count: '100',
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Pie Chart',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                            ),
                          ),
                          const Icon(
                            Icons.more_vert_outlined,
                            size: 20,
                            color: AppColors.mediumGrey,
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        bottom: 25,
                        top: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircularPercentage(
                            porcentage: 81,
                            sizeHeight: 80,
                            color: AppColors.red,
                          ),
                          CircularPercentage(
                            porcentage: 22,
                            sizeHeight: 80,
                            color: AppColors.green,
                          ),
                          CircularPercentage(
                            porcentage: 65,
                            sizeHeight: 80,
                            color: AppColors.blue,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Card(
                child: Container(),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        const FoodsList(),
      ],
    );
  }
}

class CardTotalQuantities extends StatelessWidget {
  const CardTotalQuantities({
    super.key,
    required this.name,
    required this.image,
    required this.count,
  });

  final String count;
  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: ClipOval(
                clipBehavior: Clip.antiAlias,
                child: Container(
                  width: 60,
                  height: 60,
                  color: AppColors.lightGreen15,
                  child: Center(
                    child: Image.asset(
                      image,
                      width: 40,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    count,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 22,
                        ),
                  ),
                  Text(
                    name,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 12,
                        ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
