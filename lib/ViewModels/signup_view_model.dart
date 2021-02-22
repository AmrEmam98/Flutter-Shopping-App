import 'file:///C:/Users/Amr%20Emam/AndroidStudioProjects/online_shopping_store/lib/interfaces/auth_listner.dart';
import 'package:online_shopping_store/FirebaseServices/auth_service.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SignUpViewModel {
  static String email = 'Email', password = "Password", userName = "UserName";
  FormGroup _formGroup = FormGroup({
    email: FormControl<String>(validators: [
      Validators.email,
      Validators.required,
    ]),
    password: FormControl<String>(validators: [
      Validators.required,
      Validators.minLength(6),
    ]),
    userName: FormControl<String>(validators: [
      Validators.required,
    ]),
  });

  get formGroup => _formGroup;

  bool validateUserInput() => _formGroup.valid;

  String getEmail() => _formGroup.value[email];

  String getUserName() => _formGroup.value[userName];

  String getPassword() => _formGroup.value[password];

  void signUp(AuthListener listener) {
    if (validateUserInput())
      AuthService(listener).doSignUp(getEmail(), getPassword(), getUserName());
  }

}
