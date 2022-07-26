import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final Function(String) onChanged;
  final String? initialValue;
  final bool hasError;
  final String textError;
  final String? hint, label;
  final String? Function(String?)? validator;
  const PasswordTextField({
    required this.onChanged,
    Key? key,
    this.initialValue,
    this.hasError = false,
    this.textError = 'Campo obrigatório',
    this.hint,
    this.label,
    this.validator,
  }) : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  final TextEditingController textEditingController = TextEditingController();
  late bool isShowing;

  @override
  void initState() {
    textEditingController.text = widget.initialValue ?? '';
    isShowing = true;
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  void onToggleObscure() {
    setState(() {
      isShowing = !isShowing;
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      obscureText: isShowing,
      style: Theme.of(context).textTheme.subtitle2?.copyWith(
            color: Colors.black87,
          ),
      validator: widget.validator,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: const BorderSide(color: Colors.white, width: 2.0),
        ),
        errorStyle:
            Theme.of(context).textTheme.subtitle2?.copyWith(color: Colors.red),
        errorText: widget.hasError ? widget.textError : null,
        hintText: widget.hint,
        suffixIcon: IconButton(
          icon: Icon(
            isShowing ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: onToggleObscure,
        ),
        labelText: widget.label,
      ),
    );
  }
}
