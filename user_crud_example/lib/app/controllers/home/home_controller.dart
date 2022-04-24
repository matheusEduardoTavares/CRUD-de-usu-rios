import 'package:flutter/material.dart';
import 'package:user_crud_example/app/core/utils/routes_name.dart';
import 'package:user_crud_example/app/models/user/user.dart';
import 'package:user_crud_example/app/repositories/user_repository.dart';
import 'package:user_crud_example/app/views/widgets/dialogs/confirm_dialog.dart';
import 'package:user_crud_example/app/views/widgets/dialogs/simple_warning_dialog.dart';

class HomeController {
  HomeController({
    required UserRepository repository
  }) : 
  _repository = repository;

  final UserRepository _repository;

  Future<User> getUser() async {
    final userInstance = await _repository.get();
    return userInstance!;
  }

  Future<void> updateUser({
    required User updatedUser,
    required BuildContext context,
    required GlobalKey<FormState> formKey,
    required void Function(User updatedUser) updateUI
  }) async {
    if (formKey.currentState?.validate() ?? false) {
      await _repository.upsert(updatedUser);

      showDialog(
        context: context, 
        builder: (_) => const SimpleWarningDialog(
          title: 'Sucesso',
          content: 'Usuário atualizado com sucesso!',
        )
      );

      updateUI(await getUser());
    }
  }

  Future<void> deleteUser({
    required BuildContext context,
  }) async {
    final confirmAction = await showDialog<bool?>(
      context: context, 
      builder: (_) => const ConfirmDialog(
        content: 'Realmente deseja deletar o usuário?',
      )
    );

    if (confirmAction != null && confirmAction) {
      await _repository.delete();

      Navigator.of(context).pushNamedAndRemoveUntil(
        RoutesName.splashPage, 
        (route) => false
      );
    }
  }
}