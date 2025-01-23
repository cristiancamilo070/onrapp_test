// splash_page.dart
// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onrapp_test/core/controllers/main_bloc.dart';
import 'package:onrapp_test/core/controllers/main_state.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onrapp_test/core/routes/app_routes.dart';
import 'package:onrapp_test/core/themes/app_theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        final isReady = state.isReadyDependencies;

        if (isReady) {
          _timer ??= Timer(const Duration(seconds: 2), () {
            context.go(
              RoutesPaths.loginPage,
            );
          });
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ZoomIn(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Hero(
                        tag: 'icon',
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppTheme.colors.appPrimary.withOpacity(0.9),
                                AppTheme.colors.appSecondary.withOpacity(0.7),
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
                    ),
                    Text(
                      'Store',
                      style: AppTheme.style.bold.copyWith(
                        color: AppTheme.colors.appPrimary,
                        fontSize: AppTheme.fontSize.f22,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              state.appVersion,
              style: AppTheme.style.regular.copyWith(
                color: AppTheme.colors.appSecondary,
                fontSize: AppTheme.fontSize.f12,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Text(
                'By: Cristian Cruz',
                style: AppTheme.style.regular.copyWith(
                  color: AppTheme.colors.appTertiary,
                  fontSize: AppTheme.fontSize.f10,
                ),
              ),
            )
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
