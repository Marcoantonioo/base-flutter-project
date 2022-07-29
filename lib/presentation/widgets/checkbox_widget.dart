import 'package:flutter/material.dart';

class CheckBoxWidget extends StatelessWidget {
  final String title;
  final bool isChecked;
  final void Function(bool?)? onChanged;
  const CheckBoxWidget({
    Key? key,
    required this.title,
    required this.isChecked,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: const VisualDensity(horizontal: -4),
          value: isChecked,
          onChanged: onChanged,
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
