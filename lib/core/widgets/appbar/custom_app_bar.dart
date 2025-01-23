import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:onrapp_test/core/themes/app_theme.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool showBackButton;
  final Function? onBackButtonPressed;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = false,
    this.onBackButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        top: 50.h,
        bottom: 20.h,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppTheme.colors.appPrimary,
            AppTheme.colors.appPrimary,
            AppTheme.colors.appTertiary,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: Row(
        children: [
          if (showBackButton)
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppTheme.colors.white,
                size: 28.r,
              ),
              onPressed: () {
                if (onBackButtonPressed != null) {
                  onBackButtonPressed!();
                } else {
                  context.pop();
                }
              },
            ),
          if (showBackButton) SizedBox(width: 16.w),
          Expanded(
            child: Center(
              child: Text(
                title,
                style: AppTheme.style.semiBold.copyWith(
                  fontSize: AppTheme.fontSize.f28,
                  color: AppTheme.colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
