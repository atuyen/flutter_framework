import 'package:flutter/material.dart';
import 'package:my_framework/demo/base/base_bloc.dart';
import 'package:my_framework/demo/blocs/authentication_bloc.dart';
import 'package:my_framework/demo/config/app_color_config.dart';
import 'package:my_framework/demo/shared/widget/loading_task.dart';
import 'package:my_framework/demo/shared/widget/nomal_button_widget.dart';
import 'package:my_framework/demo/views/authen/sign_up/sign_up_page.dart';
import 'package:my_framework/study/study_ui/login_signup_app/signup.dart';
import 'package:provider/provider.dart';

import '../../../base/base_widget.dart';
import '../../../config/dependency_configr.dart';
import '../../../events/signin/sign_in_event.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return PageContainer(
      blocs: [
        getIt<AuthenticationBloc>()
      ],
      child: LoginContainer(),
    );
  }
}






class LoginContainer extends StatefulWidget {
  @override
  _LoginContainerState createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
  final TextEditingController _txtUserNameController = TextEditingController();
  final TextEditingController _txtPassController = TextEditingController();
  bool passwordVisible;

  @override
  void initState() {
    super.initState();


    WidgetsBinding.instance.addPostFrameCallback((_) {

    });
  }


  _setDefaultInfoLogin(){
    _txtUserNameController.text = "tra.nguyen@sea-solutions.com";
    _txtPassController.text ="123456";
  }

  @override
  Widget build(BuildContext context) {
    AuthenticationBloc signInBloc = Provider.of<BaseBloc>(context);
    _setDefaultInfoLogin();
    return  LoadingTask(
      bloc: signInBloc,
      child: Container(
          color: AppColor.blueMain,
          padding: EdgeInsets.all(25),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child:
                    Image(image: AssetImage('assets/icons/logo-bizbooks.png')),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  _buildUsernameField(),
                  SizedBox(
                    height: 20,
                  ),
                  _buildPassField(),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          child: Text(
                            'Quên mật khẩu?',
                            style: TextStyle(
                              color: AppColor.white,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          onTap: () {

                          },
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>SignUpPage()));
                          },
                          child: Text(
                            'Đăng ký tài khoản',
                            style: TextStyle(
                              color: AppColor.white,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  buildSignInButton(signInBloc),

                ],
              ),
            ),
          ),
        ),
    );

  }

  Widget _buildUsernameField() {
    return  TextField(
        controller: _txtUserNameController,
        onChanged: (text) {

        },
        cursorColor: AppColor.white,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          fontSize: 14,
          color: AppColor.white,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          icon: Image.asset(
            'assets/icons/icon_email.png',
            width: 25,
            height: 25,
          ),
          hintText: 'Email',
          hintStyle: TextStyle(
            color: AppColor.white,
          ),
        ),
      );

  }

  Widget _buildPassField() {
    return  Stack(
          children: <Widget>[
            TextField(
              controller: _txtPassController,
              onChanged: (text) {

              },
              obscureText: !(passwordVisible ?? false),
              cursorColor: Colors.white,
              keyboardType: TextInputType.text,
              style: TextStyle(
                  fontSize: 14,
                  color: AppColor.white,
                  fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                icon: Image.asset(
                  'assets/icons/icon_padlock.png',
                  width: 25,
                  height: 25,
                ),
                hintText: 'Mật khẩu',
                hintStyle: TextStyle(
                  color: Colors.white,
                ),

              ),
            ),
            Positioned(
              right: 0,
              top: 20,
              child: Container(
                height: 15,
                child: Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      child: Image.asset(
                        'assets/icons/icon_password_view.png',
                        height: 15,
                      ),
                      onTapDown: (TapDownDetails x) {
                        setState(() {
                          passwordVisible = true;
                        });
                      },
                      onTapUp: (x) {
                        setState(() {
                          passwordVisible = false;
                        });
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        );
  }

  Widget buildSignInButton(AuthenticationBloc signInBloc) {
    return NormalButton(
        title: 'ĐĂNG NHẬP p',
        onPressed: () async {
          signInBloc.processEventSink.add(SignInEvent(
              phone: _txtUserNameController.text,
              pass: _txtPassController.text));
        },
        backgroundColor: AppColor.white,
        color: AppColor.blueMain);
  }


  @override
  void dispose() {
    print("dispose");
    super.dispose();
  }


}