import 'package:system_delivery_admin_ui/mock/user_mock.dart';
import 'package:system_delivery_admin_ui/models/food_model.dart';

class FoodMock {
  String get _description =>
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ';

  List<FoodModel> get foods {
    List<FoodModel> list = [];

    for (var i = 0; i < UserMock.users.length; i++) {
      var user = UserMock.users[i];
      list.add(
        FoodModel(
          user: user,
          date: '2 days ago',
          description: _description,
          image: 'assets/food${(i + 1)}.png',
        ),
      );
    }

    return list;
  }
}
