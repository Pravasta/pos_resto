import 'package:pos_resto/core/theme/app_color.dart';
import 'package:pos_resto/main.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.title,
    this.titleColor = AppColor.white,
    this.width = double.infinity,
    this.height = 60,
    this.padding = 15,
    this.backgroundColor,
    this.borderColor = AppColor.blue,
    required this.onTap,
    this.elevation = 0,
    this.iconUrl,
    this.borderRadius = 10,
  });

  final String title;
  final Color? titleColor;
  final double padding, width, height;
  final Color? backgroundColor;
  final Color borderColor;
  final Function() onTap;
  final double elevation;
  final String? iconUrl;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(padding),
        elevation: elevation,
        minimumSize: Size(width, height),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor, width: 2),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        backgroundColor: backgroundColor,
      ),
      onPressed: onTap,
      child:
          iconUrl != null
              ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(iconUrl!, width: 20),
                  const SizedBox(width: 10),
                  Text(
                    title,
                    style: appTextTheme(context).bodyMedium!.copyWith(
                      color: titleColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
              : Text(
                title,
                style: appTextTheme(context).bodyMedium!.copyWith(
                  color: titleColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
    );
  }
}
