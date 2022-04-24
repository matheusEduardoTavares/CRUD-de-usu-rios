import 'package:flutter/material.dart';
import 'package:user_crud_example/app/controllers/auth/auth_controller.dart';
import 'package:user_crud_example/app/controllers/home/home_controller.dart';
import 'package:user_crud_example/app/controllers/signup/signup_controller.dart';
import 'package:user_crud_example/app/core/local_storage/shared_preferences_local_storage_impl.dart';
import 'package:user_crud_example/app/core/utils/routes_name.dart';
import 'package:user_crud_example/app/repositories/user_repository.dart';
import 'package:user_crud_example/app/views/auth/splash_page.dart';
import 'package:user_crud_example/app/views/home/home_page.dart';
import 'package:user_crud_example/app/views/signup/signup_page.dart';

class DefinitionPages {
  DefinitionPages._();
  
  static final pages = {
    RoutesName.splashPage: (BuildContext _) => SplashPage(
      authController: AuthController(
        userRepository: UserRepository(
          localStorage: SharedPreferencesLocalStorageImpl()
        ),
      ),
    ),
    RoutesName.homePage: (BuildContext _) => HomePage(
      controller: HomeController(
        repository: UserRepository(
          localStorage: SharedPreferencesLocalStorageImpl(),
        )
      ),
    ),
    RoutesName.signupPage: (BuildContext _) => SignupPage(
      signupController: SignupController(
        repository: UserRepository(
          localStorage: SharedPreferencesLocalStorageImpl(),
        ),
      ),
    ),
  };  
}