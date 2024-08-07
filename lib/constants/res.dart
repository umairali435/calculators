import 'package:flutter/material.dart';
import 'package:mathtool/constants/colors.dart';

const buttonsBackgroundColor = Color(0xFF090E1C);
const backgroundColor = Color(0xFF141A2F);
const yellowColor = Color(0xFFF7CF32);
const whiteColor = Colors.white;

AppBar appbar(
  BuildContext context,
  String title,
  IconData icon,
  Function() tap,
) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.w400,
        color: AppColors.whiteColor,
      ),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.whiteColor,
    ),
    actions: [
      IconButton(
        onPressed: tap,
        icon: Icon(
          icon,
          color: AppColors.whiteColor,
        ),
      ),
    ],
    backgroundColor: AppColors.primaryColor,
  );
}

void showToast(BuildContext context, String message) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(message),
      duration: const Duration(milliseconds: 400),
    ),
  );
}
