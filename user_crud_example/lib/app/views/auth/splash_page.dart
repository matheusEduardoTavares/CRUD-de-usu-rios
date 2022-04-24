import 'package:flutter/material.dart';
import 'package:user_crud_example/app/controllers/auth/auth_controller.dart';
import 'package:user_crud_example/app/core/theme/definition_colors.dart';
import 'package:user_crud_example/app/core/utils/images_helper.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({ 
    Key? key,
    required AuthController authController,
  }) : 
  _authController = authController,
  super(key: key);

  final AuthController _authController;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Future.delayed(const Duration(seconds: 2), () {
      widget._authController.navigateBasedStatusAccount(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DefinitionColors.primaryDarkColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 200,
            width: 200,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  ImagesHelper.splashImage,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}