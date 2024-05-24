import 'package:flutter/material.dart';
import 'package:system_delivery_admin_ui/mock/food_mock.dart';
import 'package:system_delivery_admin_ui/models/food_model.dart';
import 'package:system_delivery_admin_ui/view/dashboard/dashboard_view.dart';

class HomeController extends ChangeNotifier {
  HomeNavigation _currentPage = HomeNavigation.dashboard;
  HomeNavigation get currentPage => _currentPage;

  // Dashboard
  List<FoodModel> _foods = [];
  List<FoodModel> get foods => _foods;
  bool _isLoadingFoods = true;
  bool get isLoadingFoods => _isLoadingFoods;

  void changeNavigation({
    required HomeNavigation section,
  }) {
    _currentPage = section;
    notifyListeners();
  }

  void getFoods() {
    _foods = FoodMock().foods;
    _isLoadingFoods = false;
    notifyListeners();
  }
}

enum HomeNavigation {
  dashboard,
  orderList,
  orderDetail,
  customer,
  analytics,
  reviews,
  foods,
  foodDetail,
  customerDetail,
  calendar,
  chat,
  chat1,
  chat2,
  chat3,
  chat4,
  chat5,
  wallet;

  String get name {
    switch (this) {
      case dashboard:
        return 'Dashboard';
      case orderList:
        return 'Order List';
      case orderDetail:
        return 'Order Detail';
      case customer:
        return 'Customer';
      case analytics:
        return 'Analytics';
      case reviews:
        return 'Reviews';
      case foods:
        return 'Foods';
      case foodDetail:
        return 'Food Detail';
      case customerDetail:
        return 'Customer Detail';
      case calendar:
        return 'Calendar';
      case chat:
        return 'Chat';
      case wallet:
        return 'Wallet';

      default:
        return 'text';
    }
  }

  Widget get body {
    switch (this) {
      case dashboard:
        return const DashboardView();

      default:
        return Center(
          child: Text(name),
        );
    }
  }
}
