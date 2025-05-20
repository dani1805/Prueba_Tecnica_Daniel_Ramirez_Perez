// ignore_for_file: type_literal_in_constant_pattern

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/helpers/assets.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/helpers/colors.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/helpers/error_handler.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/helpers/validators.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/ui/authentication/authentication_bloc.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/ui/home/home_bloc.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/ui/login/login_bloc.dart';
import 'package:prueba_tecnica_daniel_ramirez/widgets/standard_app_bar.dart';
import 'package:prueba_tecnica_daniel_ramirez/widgets/standard_button.dart';
import 'package:prueba_tecnica_daniel_ramirez/widgets/standard_input_form_field.dart';
import 'package:prueba_tecnica_daniel_ramirez/widgets/standard_loading.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final key = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isPasswordVisible = false;

  late Size size;
  late LoginBloc bloc;
  late AuthenticationBloc authenticationBloc;
  late HomeBloc homeBloc;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    bloc = BlocProvider.of<LoginBloc>(context, listen: true);
    authenticationBloc = BlocProvider.of<AuthenticationBloc>(
      context,
      listen: true,
    );
    homeBloc = BlocProvider.of<HomeBloc>(context, listen: true);

    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) async {
        switch (state.runtimeType) {
          case LoginError:
            state = state as LoginError;
            final code = state.code;
            final message = state.message;

            ErrorHandler.handler(context, code, message);
            break;
          case LoginSuccess:
            authenticationBloc.add(DoAuthenticated(value: 'app-token'));
            homeBloc.add(
              DoGetWeather(
                lat: 51.6195,
                lon: -0.3337,
                lang: context.locale.languageCode,
              ),
            );
            break;
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case LoginLoading:
            return StandardLoading();
          default:
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: StandardAppBar(elevation: 0, background: MColor.blue),
              body: Container(
                width: size.width,
                height: size.height,
                padding: const EdgeInsets.all(15),
                child: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: key,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            Assets.appLoginIcon,
                            width: MediaQuery.of(context).size.width * 0.5,
                          ),
                          SizedBox(height: 50),
                          StandardInputFormField(
                            validator:
                                (value) => Validators.validateEmail(
                                  value,
                                  'errors.empty-error'.tr(),
                                  'errors.email-error'.tr(),
                                ),
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            hint: 'login-page.hint-email'.tr(),
                            color: Colors.black,
                          ),
                          SizedBox(height: 20),
                          StandardInputFormField(
                            validator:
                                (value) => Validators.validatePassword(
                                  value,
                                  'errors.empty-error'.tr(),
                                  'errors.password-error'.tr(),
                                ),
                            controller: passwordController,
                            hint: 'login-page.hint-password'.tr(),
                            isObscureText: true,
                            obscureText: !isPasswordVisible,
                            onPressed: () {
                              setState(
                                () => isPasswordVisible = !isPasswordVisible,
                              );
                            },
                            color: Colors.black,
                          ),
                          SizedBox(height: 50),
                          StandardButton(
                            text: 'login-page.sign-in'.tr(),
                            color: Colors.white,
                            background: MColor.blue,
                            border: MColor.blue,
                            onTap: doLogin,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
        }
      },
    );
  }

  void doLogin() {
    FocusScope.of(context).unfocus();

    if (key.currentState!.validate()) {
      key.currentState!.save();
      bloc.add(
        DoLogin(email: emailController.text, password: passwordController.text),
      );
    }
  }
}
