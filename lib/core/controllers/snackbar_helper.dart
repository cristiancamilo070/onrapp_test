// notifications_helper.dart
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onrapp_test/core/themes/app_theme.dart';

class NotificationsHelper {
  // Loading
  static void showLoading([String message = 'Loading...']) {
    EasyLoading.show(
      status: message,
      maskType: EasyLoadingMaskType.black,
    );
  }

  static void closeLoading() {
    EasyLoading.dismiss();
  }

  // Snacks
  static void showSuccessMessage(
    BuildContext context, {
    required String title,
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const FaIcon(FontAwesomeIcons.check, color: Colors.white),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                '$title\n$message',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        backgroundColor: AppTheme.colors.appSuccess,
      ),
    );
  }

  static void showInfoMessage(
    BuildContext context, {
    required String title,
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            FaIcon(FontAwesomeIcons.circleExclamation,
                color: AppTheme.colors.appBlackGrey),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                '$title\n$message',
                style: TextStyle(color: AppTheme.colors.appBlackGrey),
              ),
            ),
          ],
        ),
        backgroundColor: AppTheme.colors.appPrimary,
      ),
    );
  }

  static void showErrorMessage(
    BuildContext context, {
    required String title,
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const FaIcon(FontAwesomeIcons.circleExclamation,
                color: Colors.white),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                '$title\n$message',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.redAccent.shade100,
      ),
    );
  }
}
