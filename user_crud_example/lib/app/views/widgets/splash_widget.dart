import 'package:flutter/material.dart';
import 'package:user_crud_example/app/core/utils/images_helper.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}