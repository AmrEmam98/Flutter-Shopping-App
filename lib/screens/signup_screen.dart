import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'file:///C:/Users/Amr%20Emam/AndroidStudioProjects/online_shopping_store/lib/interfaces/auth_listner.dart';
import 'package:online_shopping_store/ViewModels/signup_view_model.dart';
import 'package:online_shopping_store/Widgets/custom_text_field.dart';
import 'package:online_shopping_store/Widgets/rounded_button.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'home_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> implements AuthListener {
  SignUpViewModel signUpViewModel = SignUpViewModel();
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: _loading,
        child: SingleChildScrollView(
          child: Container(
            height: screenSize.height,
            child: ReactiveForm(
              formGroup: signUpViewModel.formGroup,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Welcome',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Register account',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CustomTextField(
                    hintText: 'User Name',
                    controlName: SignUpViewModel.userName,
                  ),
                  CustomTextField(
                    hintText: 'Email',
                    controlName: SignUpViewModel.email,
                  ),
                  CustomTextField(
                    hintText: 'Password',
                    controlName: SignUpViewModel.password,
                    obscureText: true,
                  ),
                  RoundedButton(
                    onPressed: () {
                      signUpViewModel.signUp(this);
                      showProgressHud();
                    },
                    text: 'Register',
                    screenSize: screenSize,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Already exist account? ',
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(color: Colors.black),
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Sign in',
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                .copyWith(
                                    color: Theme.of(context).primaryColor),
                          )),
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

  void navigateToHomeScreen(BuildContext context) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  void showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  void onFail() {
    hideProgressHud();
    showToast('Error happened while sign up');
  }

  @override
  void onSuccess() {
    showToast('Successfully Signed up !');
    navigateToHomeScreen(context);
  }
}
