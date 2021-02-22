import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'file:///C:/Users/Amr%20Emam/AndroidStudioProjects/online_shopping_store/lib/interfaces/auth_listner.dart';
import 'package:online_shopping_store/FirebaseServices/auth_service.dart';
import 'package:online_shopping_store/ViewModels/login_view_model.dart';
import 'package:online_shopping_store/Widgets/custom_text_field.dart';
import 'package:online_shopping_store/Widgets/rounded_button.dart';
import 'package:online_shopping_store/screens/loading_screen.dart';
import 'package:online_shopping_store/screens/signup_screen.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../constants.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements AuthListener {
  LoginViewModel loginViewModel = LoginViewModel();

  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: ModalProgressHUD(
        color: Colors.transparent,
        progressIndicator:SpinKitFadingCircle(
          color: Theme.of(context).primaryColor,
          size: 60.0,
        ),

        inAsyncCall: _loading,
        child: SingleChildScrollView(
          child: Container(
            height: screenSize.height,
            child: ReactiveForm(
              formGroup: loginViewModel.formGroup,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Welcome', style: Theme.of(context).textTheme.headline6),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text('Login to your account',
                      style: Theme.of(context).textTheme.headline5),
                  SizedBox(
                    height: 20.0,
                  ),
                  CustomTextField(
                    hintText: 'Email',
                    controlName: LoginViewModel.emailControl,

                  ),
                  CustomTextField(
                    hintText: 'Password',
                    controlName: LoginViewModel.passwordControl,
                    obscureText:true,
                  ),
                  RoundedButton(
                    screenSize: screenSize,
                    text: 'Login',
                    onPressed: () {
                      loginViewModel.login(this);
                      showProgressHud();
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Don\'t have an account ? ',
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(color: Colors.black),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => SignUpScreen()));
                        },
                        child: Text('Sign up',
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                .copyWith(
                                    color: Theme.of(context).primaryColor)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  showProgressHud() {
    setState(() {
      _loading = true;
    });
  }

  hideProgressHud() {
    setState(() {
      _loading = false;
    });
  }

  void navigateToLoadingScreen(BuildContext context) {
     Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => LoadingScreen()));
  }
  void showToast(String msg){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  @override
  void onSuccess() {
    showToast('Successfully Logged in');
    navigateToLoadingScreen(context);
  }

  @override
  void onFail() {
    showToast('Invalid email or password');
    hideProgressHud();
  }
}
