import 'package:system_delivery_admin_ui/models/user_model.dart';

class FoodModel {
  final UserModel user;
  final String date;
  final String description;
  final String image;

  FoodModel({
    required this.user,
    required this.date,
    required this.description,
    required this.image,
  });
}
