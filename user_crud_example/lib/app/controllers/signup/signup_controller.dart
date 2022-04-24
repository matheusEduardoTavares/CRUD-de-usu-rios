import 'package:flutter/widgets.dart';
import 'package:user_crud_example/app/core/utils/routes_name.dart';
import 'package:user_crud_example/app/models/user/user.dart';
import 'package:user_crud_example/app/repositories/user_repository.dart';

class SignupController {
  SignupController({
    required UserRepository repository
  }) : _repository = repository;

  final UserRepository _repository;

  Future<void> createUser({
    required User user,
    required BuildContext context,
    required GlobalKey<FormState> formKey,
  }) async {
    if (formKey.currentState?.validate() ?? false) {
      await _repository.upsert(user);

      Navigator.of(context).pushNamedAndRemoveUntil(
        RoutesName.splashPage, 
        (route) => false
      );
    }
  }
}