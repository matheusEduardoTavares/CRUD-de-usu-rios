import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:user_crud_example/app/controllers/home/home_controller.dart';
import 'package:user_crud_example/app/core/utils/images_helper.dart';
import 'package:user_crud_example/app/models/user/permissions_user_enum.dart';
import 'package:user_crud_example/app/models/user/user.dart';
import 'package:user_crud_example/app/views/widgets/home_content.dart';
import 'package:user_crud_example/app/views/widgets/loading_widget.dart';
import 'package:user_crud_example/app/views/widgets/user_info_form.dart';

class HomePage extends StatefulWidget {
  const HomePage({ 
    required HomeController controller,
    Key? key,
  }) : 
  _controller = controller,
  super(key: key);

  final HomeController _controller;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _isLoading = true;
  var _selectedBarIndex = 0;

  final _formKey = GlobalKey<FormState>();
  late TextEditingController _loginController;
  late TextEditingController _passwordController;

  User? _user;
  PermissionsUserEnum? _permissionsUserEnum;

  @override
  void initState() {
    super.initState();

    widget._controller.getUser().then((user) {
      _initializeTextFormFields(user);
      _permissionsUserEnum = user.permissionsUserEnum;

      setState(() {
        _user = user;
        _isLoading = false;
      });
    });
  }

  void _initializeTextFormFields(User user) {
    _loginController = TextEditingController(text: user.login);
    _passwordController = TextEditingController(text: user.password);
  }

  void _updateTabAndEnumValue(int newIndex) {
    setState(() {
      _selectedBarIndex = newIndex;
      _permissionsUserEnum = _user!.permissionsUserEnum;
      _initializeTextFormFields(_user!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !_isLoading ? AppBar(
        title: AutoSizeText(_user?.login ?? ''),
      ) : null,
      body: _isLoading ? const LoadingWidget() : Stack(
        children: [
          Image.asset(
            ImagesHelper.natureImage,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  color: Colors.white.withOpacity(0.9),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: [
                      HomeContent(
                        permissionsUserEnum: _user?.permissionsUserEnum ?? PermissionsUserEnum.one,
                      ),
                      Column(
                        children: [
                          UserInfoForm(
                            formKey: _formKey,
                            loginController: _loginController,
                            passwordController: _passwordController,
                            permissionsUserEnum: _permissionsUserEnum,
                            updateDropdownValue: (value) {
                              _permissionsUserEnum = value;
                            }, 
                          ),
                          ElevatedButton(
                            onPressed: () => 
                              widget._controller.updateUser(
                                updatedUser: User(
                                  login: _loginController.text, 
                                  password: _passwordController.text,
                                  permissionsUserEnum: _permissionsUserEnum,
                                ),
                                context: context, 
                                formKey: _formKey, 
                                updateUI: (updatedUser) {
                                  setState(() {
                                    _user = updatedUser;
                                  });
                                }
                              ), 
                            child: const Text('Atualizar dados')
                          ),
                          ElevatedButton(
                            onPressed: () => 
                              widget._controller.deleteUser(context: context), 
                            child: const Text('Deletar conta')
                          ),
                        ],
                      ),
                    ][_selectedBarIndex],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedBarIndex,
        onTap: _updateTabAndEnumValue,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.nature_outlined),
            label: 'Informações',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Dados',
          ),
        ],
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