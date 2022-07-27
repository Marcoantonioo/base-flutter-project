import 'package:cebras_app/architecture/utils/app_theme.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final bool isLoading;
  const ButtonWidget({
    Key? key,
    required this.title,
    required this.onTap,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        width: double.maxFinite,
        height: 55,
        decoration: BoxDecoration(
          color: AppThemeData.lightColorScheme.secondary,
          borderRadius: const BorderRadius.all(Radius.circular(30.0)),
        ),
        child: Center(
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.white,
                ))
              : Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
        ),
      ),
    );
  }
}
