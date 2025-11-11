import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:routing/repository/providers/user_credentials_provider.dart';
import 'package:routing/repository/providers/user_status_provider.dart';
import 'package:routing/screens/log_reg_screen/log_form.dart';
import 'package:routing/widgets/divider.dart';
import 'package:routing/widgets/get_hero_circle.dart';
import 'package:routing/widgets/get_remember_option.dart';
import 'package:routing/widgets/get_signup_option.dart';
import 'package:routing/widgets/get_submit_button.dart';
import 'package:routing/widgets/login_option.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() =>
      _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController emailController =
      TextEditingController();
  final TextEditingController passwordController =
      TextEditingController();

  final FocusNode emailFocuse = FocusNode();
  final FocusNode passwordFocuse = FocusNode();

  bool _rememberMe = false;
  String userEmail = '';
  String userPassword = '';

  String? _focusedField;

  Map<String, dynamic>? userCredintial;

  void _toggleRememberMe(bool? newValue) {
    if (newValue != null) {
      setState(() {
        _rememberMe = newValue;
      });
    }
  }

  void onSubmit(String email, String pass) async {
    if (email.isEmpty || pass.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in both fields'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    if (!email.contains('@') || !email.contains('.')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please enter a valid email address',
          ),
          backgroundColor: Colors.orangeAccent,
        ),
      );
      return;
    }

    await ref
        .read(userProvider.notifier)
        .login(email, pass, _rememberMe);

    await ref
        .read(userStatusProvider.notifier)
        .setLoggedIn(true);

    // Proceed to next step
    await _handleLoginSuccess(email, pass);
  }

  Future<void> _handleLoginSuccess(
    String email,
    String pass,
  ) async {
    if (context.mounted) {
      context.go('/main');
    }
  }

  @override
  void initState() {
    super.initState();
    emailFocuse.addListener(_onEmailFocusChange);
    passwordFocuse.addListener(_onPasswordFocusChange);
  }

  void _onEmailTextChange(String email) {
    setState(() {
      userEmail = email;
    });
    debugPrint('======Text is: $email');
  }

  void _onPasswordTextChange(String pass) {
    setState(() {
      userPassword = pass;
    });
    debugPrint('======Text is: $pass');
  }

  void _onEmailFocusChange() {
    setState(() {
      if (emailFocuse.hasFocus) {
        _focusedField = 'email';
      } else if (_focusedField == 'email') {
        // Clear if it lost focus and was the previously focused field
        _focusedField = null;
      }
    });
    debugPrint(
      'Focused Field: $_focusedField',
    ); // For debugging
  }

  void _onPasswordFocusChange() {
    setState(() {
      if (passwordFocuse.hasFocus) {
        _focusedField = 'password';
      } else if (_focusedField == 'password') {
        // Clear if it lost focus and was the previously focused field
        _focusedField = null;
      }
    });
    debugPrint(
      'Focused Field: $_focusedField',
    ); // For debugging
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailFocuse.dispose();
    passwordFocuse.dispose();
    emailFocuse.removeListener(_onEmailFocusChange);
    passwordFocuse.removeListener(_onPasswordFocusChange);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                transform: GradientRotation(100),
                begin: AlignmentGeometry.topLeft,
                end: AlignmentGeometry.bottomRight,
                stops: [
                  BorderSide.strokeAlignInside,
                  BorderSide.strokeAlignOutside,
                ],
                colors: [
                  Color.fromRGBO(194, 128, 142, 1.0),
                  Color.fromRGBO(49, 87, 148, 1.0),
                ],
              ),
            ),
            // if not required remove the single child scroll
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: 80),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(201, 188, 205, 1.0),
                  borderRadius: BorderRadius.circular(25),
                ),
                height:
                    MediaQuery.of(context).size.height / 2,
                width:
                    MediaQuery.of(context).size.width - 15,
                child: Column(
                  children: [
                    LogForm(
                      controller: emailController,
                      focusNode: emailFocuse,
                      onTextFeildTextChange:
                          _onEmailTextChange,
                      obscureText: false,
                      icon: Icons.person,
                      hintText: 'Email ID',
                      inputType: TextInputType.emailAddress,
                    ),
                    LogForm(
                      controller: passwordController,
                      onTextFeildTextChange:
                          _onPasswordTextChange,
                      focusNode: passwordFocuse,
                      obscureText: true,
                      icon: Icons.lock,
                      hintText: 'Password',
                      inputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 40),
                    GetSubmitButton(
                      userEmail: userEmail,
                      userPassword: userPassword,
                      onSubmit: onSubmit,
                    ),
                    const SizedBox(height: 5),
                    GetDivider(),
                    const SizedBox(height: 5),
                    LoginOption(),
                  ],
                ),
              ),
            ),
          ),
          _focusedField == null
              ? GetHeroCircle()
              : SizedBox(),
          GetSignupOption(focusedField: _focusedField),
          GetRememberOption(
            isChecked: _rememberMe,
            onChanged: _toggleRememberMe,
            focusedField: _focusedField,
          ),
        ],
      ),
    );
  }
}
