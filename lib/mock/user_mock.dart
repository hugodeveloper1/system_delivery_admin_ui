import 'package:system_delivery_admin_ui/models/user_model.dart';

class UserMock {
  static List<UserModel> get users => [
        UserModel(
          name: 'Jons Sena',
          image: 'assets/placeholderJonsSena.png',
        ),
        UserModel(
          name: 'Sofia',
          image: 'assets/placeholdersofia.png',
        ),
        UserModel(
          name: 'Anandreansyah',
          image: 'assets/placeholderAnandreansyah.png',
        ),
      ];
}
