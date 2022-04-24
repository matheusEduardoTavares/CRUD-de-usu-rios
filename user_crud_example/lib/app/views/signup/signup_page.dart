import 'package:flutter/material.dart';
import 'package:user_crud_example/app/controllers/signup/signup_controller.dart';
import 'package:user_crud_example/app/models/user/permissions_user_enum.dart';
import 'package:user_crud_example/app/models/user/user.dart';
import 'package:user_crud_example/app/views/widgets/splash_widget.dart';
import 'package:user_crud_example/app/views/widgets/user_info_form.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({ 
    required SignupController signupController,
    Key? key,
  }) : 
  _signupController = signupController,
  super(key: key);

  final SignupController _signupController;

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _loginController;
  late TextEditingController _passwordController;
  PermissionsUserEnum? _userPermissionEnum;

  @override 
  void initState() {
    super.initState();

    _loginController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar conta'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: SplashWidget(),
              ),
              Column(
                children: [
                  UserInfoForm(
                    formKey: _formKey,
                    loginController: _loginController,
                    passwordController: _passwordController,
                    updateDropdownValue: (permissionEnum) {
                      _userPermissionEnum = permissionEnum;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: ElevatedButton(
                      child: const Text('Cadastrar'),
                      onPressed: () => widget._signupController.createUser(
                        user: User(
                          login: _loginController.text, 
                          password: _passwordController.text, 
                          permissionsUserEnum: _userPermissionEnum,
                        ),
                        formKey: _formKey,
                        context: context,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override 
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();

    super.dispose();
  }
}