import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:system_delivery_admin_ui/controllers/home_controller.dart';
import 'package:system_delivery_admin_ui/models/food_model.dart';
import 'package:system_delivery_admin_ui/presentation/app_colors.dart';

class FoodsList extends StatefulWidget {
  const FoodsList({super.key});

  @override
  State<FoodsList> createState() => _FoodsListState();
}

class _FoodsListState extends State<FoodsList> {
  late HomeController homeController;
  PageController pageController = PageController(viewportFraction: 0.5);
  double currentPage = 0;

  @override
  void initState() {
    super.initState();
    homeController = context.read<HomeController>();
    homeController.getFoods();
    pageController.addListener(_listener);
  }

  void _listener() {
    currentPage = pageController.page ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return controller.isLoadingFoods
        ? const CircularProgressIndicator()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Customer Review',
                          style: textTheme.bodyLarge!.copyWith(
                            fontSize: size.width * 0.027,
                          ),
                        ),
                        Text(
                          'Eum fuga consequuntur utadsjn et.',
                          style: textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          pageController.previousPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.decelerate,
                          );
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        onPressed: () {
                          pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.decelerate,
                          );
                        },
                        icon: const Icon(
                          Icons.arrow_forward_outlined,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 180,
                child: PageView.builder(
                  itemCount: controller.foods.length,
                  controller: pageController,
                  clipBehavior: Clip.none,
                  itemBuilder: (context, index) {
                    final food = controller.foods[index];
                    return _Food(food: food);
                  },
                ),
              ),
            ],
          );
  }
}

class _Food extends StatelessWidget {
  const _Food({
    required this.food,
  });

  final FoodModel food;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    double widhtImage = 150;

    return Stack(
      children: [
        Card(
          margin: EdgeInsets.only(left: 10, right: widhtImage * 0.5),
          child: Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 10,
                bottom: 10,
                top: 10,
                right: widhtImage * 0.5,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 22,
                        backgroundImage: AssetImage(food.user.image),
                      ),
                      const SizedBox(width: 7),
                      SizedBox(
                        height: 44,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(food.user.name),
                            Text(
                              food.date,
                              style: textTheme.bodySmall,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        food.description,
                        style: textTheme.bodySmall!.copyWith(
                          color: AppColors.darkPurpleGrey,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Row(
                        children: List.generate(5, (index) {
                          return const Icon(
                            Icons.star,
                            size: 16,
                            color: AppColors.brightYellow,
                          );
                        }),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '5.0',
                        style: textTheme.bodySmall,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          top: 0,
          child: SizedBox(
            child: Center(
              child: Image.asset(
                food.image,
                height: widhtImage,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
