import 'package:flutter/material.dart';
import 'package:user_crud_example/app/core/utils/routes_name.dart';
import 'package:user_crud_example/app/repositories/user_repository.dart';

class AuthController {
  AuthController({
    required UserRepository userRepository
  }) : _userRepository = userRepository;

  final UserRepository _userRepository;

  Future<void> navigateBasedStatusAccount(BuildContext context) async {
    final hasAccount = await _userRepository.hasCreated();
    String routeToGo;

    if (hasAccount) {
      routeToGo = RoutesName.homePage;
    }
    else {
      routeToGo = RoutesName.signupPage;
    }

    Navigator.of(context).popAndPushNamed(routeToGo);
  }  
}