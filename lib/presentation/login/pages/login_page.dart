// login_page.dart
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:onrapp_test/core/themes/app_theme.dart';
import 'package:onrapp_test/core/widgets/buttons/primary_button.dart';
import 'package:onrapp_test/core/widgets/inputs/src/text_field/app_input_parameters.dart';
import 'package:onrapp_test/core/widgets/inputs/src/text_field/app_text_form_field.dart';
import 'package:onrapp_test/core/widgets/inputs/utils/input_validator_utils.dart';
import 'package:onrapp_test/presentation/login/bloc/login_bloc.dart';
import 'package:onrapp_test/presentation/login/bloc/login_event.dart';
import 'package:onrapp_test/presentation/login/bloc/login_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return BlocProvider(
      create: (_) => LoginBloc(),
      child: Scaffold(
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.loginSuccess) {
              context.go('/products');
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              final bloc = context.read<LoginBloc>();
              return Scaffold(
                backgroundColor: AppTheme.colors.white,
                body: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppTheme.colors.white.withOpacity(0.9),
                        AppTheme.colors.appTertiary.withOpacity(0.6),
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              heightSpace100,
                              Hero(
                                tag: 'icon',
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppTheme.colors.white,
                                    ),
                                    gradient: LinearGradient(
                                      colors: [
                                        AppTheme.colors.appPrimary
                                            .withOpacity(0.9),
                                        AppTheme.colors.appSecondary
                                            .withOpacity(0.7),
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0,
                                    vertical: 10.0,
                                  ),
                                  child: SizedBox(
                                    height: 90,
                                    width: 90,
                                    child: Center(
                                      child: FaIcon(
                                        FontAwesomeIcons.bagShopping,
                                        color: AppTheme.colors.white,
                                        size: 70,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              heightSpace16,
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 100),
                                child: Text(
                                  'Inicia sesión para continuar',
                                  textAlign: TextAlign.center,
                                  style: AppTheme.style.semiBold.copyWith(
                                    color: AppTheme.colors.appQuaternary,
                                    fontSize: AppTheme.fontSize.f24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Form(
                            key: state.loginFormKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                AppTextFormFieldWidget(
                                  AppInputParameters(
                                    hintText: 'Correo',
                                    textInputAction: TextInputAction.next,
                                    inputType: AppInputType.email,
                                    controller: emailController,
                                    labelText: 'Correo electrónico',
                                    isRequired: true,
                                    requiredErrorMessage: 'Campo requerido',
                                    customValidator:
                                        InputValidatorUtils.validate,
                                    context: context,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                AppTextFormFieldWidget(
                                  AppInputParameters(
                                    hintText: 'Contraseña',
                                    obscureText: true,
                                    textInputAction: TextInputAction.done,
                                    inputType: AppInputType.password,
                                    controller: passwordController,
                                    labelText: 'Contraseña',
                                    isRequired: true,
                                    requiredErrorMessage: 'Campo requerido',
                                    context: context,
                                  ),
                                ),
                                const SizedBox(height: 32),
                                state.isLoading
                                    ? CircularProgressIndicator(
                                        color: AppTheme.colors.appPrimary,
                                      )
                                    : SizedBox(
                                        width: double.infinity,
                                        child: PrimaryButton(
                                          onPressed: () {
                                            if (state.loginFormKey.currentState
                                                    ?.validate() ??
                                                false) {
                                              bloc.add(
                                                LoginSubmitted(
                                                  email: emailController.text,
                                                  password:
                                                      passwordController.text,
                                                ),
                                              );
                                            }
                                          },
                                          text: 'Iniciar sesión',
                                          borderRadius: 16,
                                        )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
