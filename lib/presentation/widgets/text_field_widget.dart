import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

@immutable
class TextFieldWidget extends StatefulWidget {
  final String? label, hint;
  final Function(String) onChanged;
  final TextInputType inputType;
  final String? initialValue;
  final bool enable;
  final List<TextInputFormatter>? formatters;
  final bool hasError;
  final String textError;
  final int? maxLines;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;

  const TextFieldWidget({
    required this.onChanged,
    this.hint,
    this.label,
    this.initialValue,
    this.inputType = TextInputType.text,
    this.enable = true,
    this.formatters,
    this.hasError = false,
    this.textError = 'Campo inválido.',
    this.maxLines = 1,
    this.suffixIcon,
    this.validator,
    Key? key,
    this.textInputAction,
  }) : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textEditingController.text = widget.initialValue ?? '';
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: widget.textInputAction,
      enabled: widget.enable,
      style: Theme.of(context).textTheme.subtitle2?.copyWith(
            color: Colors.black87,
          ),
      maxLines: widget.maxLines,
      controller: textEditingController,
      onChanged: widget.onChanged,
      keyboardType: widget.inputType,
      inputFormatters: widget.formatters,
      validator: widget.validator,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: const BorderSide(color: Colors.white, width: 2.0),
        ),
        errorStyle:
            Theme.of(context).textTheme.subtitle2?.copyWith(color: Colors.red),
        suffixIcon: widget.suffixIcon,
        errorText: widget.hasError ? widget.textError : null,
        hintText: widget.hint,
        labelText: widget.label,
      ),
    );
  }
}
