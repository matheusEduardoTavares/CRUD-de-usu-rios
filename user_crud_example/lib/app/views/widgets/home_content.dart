import 'package:flutter/material.dart';
import 'package:user_crud_example/app/models/user/permissions_user_enum.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({ 
    required this.permissionsUserEnum,
    Key? key,
  }) : super(key: key);

  final PermissionsUserEnum permissionsUserEnum;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          permissionsUserEnum.displayTextValue,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}