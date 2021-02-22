
import 'file:///C:/Users/Amr%20Emam/AndroidStudioProjects/online_shopping_store/lib/interfaces/auth_listner.dart';
import 'package:online_shopping_store/FirebaseServices/auth_service.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginViewModel {

  static String emailControl = 'email', passwordControl = 'password';
  FormGroup _formGroup = FormGroup({
    emailControl: FormControl<String>(validators: [
      Validators.email,
      Validators.required,
    ]),
    passwordControl: FormControl<String>(validators: [
      Validators.required,
      Validators.minLength(6),
    ])
  });
  get formGroup=>_formGroup;
  bool validateUserInput() => _formGroup.valid;

  String getUserEmail() => _formGroup.value[emailControl];

  String getUserPassword() => _formGroup.value[passwordControl];

  void login(AuthListener listener) {
    if (validateUserInput()) {
      AuthService(listener).doLogin(getUserEmail(), getUserPassword());
  }
  }
}
