import 'package:cebras_app/architecture/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final void Function()? onBackPressed;
  const AppBarWidget({
    Key? key,
    required this.title,
    this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppThemeData.lightColorScheme.primary,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        iconSize: 20,
        onPressed: onBackPressed ?? Get.back,
      ),
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headline3
            ?.copyWith(color: Colors.white),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
