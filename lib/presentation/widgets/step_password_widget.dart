import 'package:cebras_app/presentation/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class StepPasswordWidget extends StatelessWidget {
  final String title;
  final String buttonTitle;
  final void Function()? onTapButton;
  final Widget child;
  final bool isLoading;
  const StepPasswordWidget({
    Key? key,
    required this.title,
    required this.buttonTitle,
    required this.onTapButton,
    required this.child,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        Text(
          title,
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(height: 30),
        child,
        const SizedBox(height: 50),
        ButtonWidget(
          title: buttonTitle,
          onTap: onTapButton,
          isLoading: isLoading,
        )
      ],
    );
  }
}
