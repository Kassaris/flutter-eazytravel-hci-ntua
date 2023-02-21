import 'package:flutter/material.dart';
import 'package:animated_login/animated_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginScreen(
      child: MaterialApp(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  /// Simulates the multilanguage, you will implement your own logic.
  /// According to the current language, you can display a text message
  /// with the help of [LoginTexts] class.
  final String langCode = 'en';

  @override
  Widget build(BuildContext context) {
    return AnimatedLogin(
      onLogin: onLogin,
      onSignup: onSignup,
      onForgotPassword: onForgotPassword,
      formWidthRatio: 60,
      // backgroundImage: 'images/background_image.jpg',
      signUpMode: SignUpModes.both,
      socialLogins: _socialLogins,
      loginTheme: _loginTheme,
      loginTexts: _loginTexts,
    );
  }

  /// You can adjust the colors, text styles, button styles, borders
  /// according to your design preferences.
  /// You can also set some additional display options such as [showLabelTexts].
  LoginTheme get _loginTheme => LoginTheme(
        // showLabelTexts: false,
        backgroundColor: Colors.blue, // const Color(0xFF6666FF),
        formFieldBackgroundColor: Colors.white,
        changeActionTextStyle: const TextStyle(color: Colors.white),
      );

  LoginTexts get _loginTexts => LoginTexts(
        nameHint: _username,
        login: _login,
        signUp: _signup,
      );

  /// You can adjust the texts in the screen according to the current language
  /// With the help of [LoginTexts], you can create a multilanguage scren.
  String get _username => langCode == 'tr' ? 'Kullanıcı Adı' : 'Username';
  String get _login => langCode == 'tr' ? 'Giriş Yap' : 'Login';
  String get _signup => langCode == 'tr' ? 'Kayıt Ol' : 'Sign Up';

  /// Social login options, you should provide callback function and icon path.
  /// Icon paths should be the full path in the assets
  /// Don't forget to also add the icon folder to the "pubspec.yaml" file.
  List<SocialLogin> get _socialLogins => <SocialLogin>[
        SocialLogin(
            callback: () async => socialLogin('Google'),
            iconPath: 'images/google.png'),
        SocialLogin(
            callback: () async => socialLogin('Facebook'),
            iconPath: 'images/facebook.png'),
        SocialLogin(
            callback: () async => socialLogin('Linkedin'),
            iconPath: 'images/linkedin.png'),
      ];

  /// Login action that will be performed on click to action button in login mode.
  Future<String?> onLogin(LoginData loginData) async {
    await Future.delayed(const Duration(seconds: 2));
    print("""
    Successfully logged in.\n
    Email: ${loginData.email}\n
    Password: ${loginData.password}""");
    return null;
  }

  /// Sign up action that will be performed on click to action button in sign up mode.
  Future<String?> onSignup(SignUpData signupData) async {
    await Future.delayed(const Duration(seconds: 2));
    print("""
    Successfully signed up.\n
    Username: ${signupData.name}\n
    Email: ${signupData.email}\n
    Password: ${signupData.password}\n
    Confirm Password: ${signupData.confirmPassword}""");
    return null;
  }

  /// Action that will be performed on click to "Forgot Password?" text/CTA.
  /// Probably you will navigate user to a page to create a new password after the verification.
  Future<String?> onForgotPassword(String email) async {
    await Future.delayed(const Duration(seconds: 2));
    print('Successfully navigated. Email is $email');
    return null;
  }

  /// Social login callback example.
  Future<String?> socialLogin(String type) async {
    await Future.delayed(const Duration(seconds: 2));
    print('Successfully logged in with $type.');
    return null;
  }
}
