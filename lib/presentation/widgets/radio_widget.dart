import 'package:cebras_app/architecture/utils/app_theme.dart';
import 'package:flutter/material.dart';

class RadioWidget extends StatelessWidget {
  final String title;
  final bool isChecked;
  final void Function() onTap;
  const RadioWidget({
    Key? key,
    required this.title,
    required this.isChecked,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              color: isChecked
                  ? AppThemeData.lightColorScheme.secondary
                  : AppThemeData.lightColorScheme.background,
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(30.0),
              ),
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: Colors.black, fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }
}
