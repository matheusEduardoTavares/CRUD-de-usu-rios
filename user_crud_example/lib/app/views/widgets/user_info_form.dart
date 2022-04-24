import 'package:flutter/material.dart';
import 'package:user_crud_example/app/models/user/permissions_user_enum.dart';
import 'package:user_crud_example/app/views/widgets/default_form_field.dart';

typedef UpdateDropdownValue = void Function(PermissionsUserEnum);

class UserInfoForm extends StatelessWidget {
  const UserInfoForm({ 
    required this.formKey,
    required this.loginController,
    required this.passwordController,
    this.updateDropdownValue,
    this.permissionsUserEnum,
    Key? key 
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController loginController;
  final TextEditingController passwordController;
  final UpdateDropdownValue? updateDropdownValue;
  final PermissionsUserEnum? permissionsUserEnum;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0), 
            child: DefaultFormField(
              labelText: 'Login',
              textEditingController: loginController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: DefaultFormField(
              labelText: 'Senha',
              textEditingController: passwordController,
            ),
          ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: DropdownButtonFormField<PermissionsUserEnum>(
                value: permissionsUserEnum,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Permissões',
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => value != null ? null : 'Escolha uma opção',
                onChanged: (value) => updateDropdownValue?.call(value!),
                items: PermissionsUserEnumExt.displayEntries.map(
                  (e) => DropdownMenuItem(
                    child: Text(e.value),
                    value: e.key,
                  )
                ).toList(),
              ),
            ),
        ],
      ),
    );
  }
}