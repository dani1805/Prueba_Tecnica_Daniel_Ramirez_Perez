import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StandardInputFormField extends StatelessWidget {
  const StandardInputFormField({
    Key? key,
    this.validator,
    this.controller,
    this.type = TextInputType.text,
    this.onChanged,
    this.hint,
    this.isObscureText = false,
    this.obscureText = false,
    this.errorBorder,
    this.color,
    this.enabled,
    this.onPressed,
    this.label,
    this.enabledBorder,
  }) : super(key: key);

  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType type;
  final Function(String?)? onChanged;
  final String? hint;
  final String? label;
  final bool isObscureText;
  final bool obscureText;
  final InputBorder? errorBorder;
  final Color? color;
  final bool? enabled;
  final OutlineInputBorder? enabledBorder;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: color, fontSize: 14),
      validator: validator,
      controller: controller,
      keyboardType: type,
      onChanged: onChanged,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        enabledBorder: enabledBorder,
        hintStyle: TextStyle(color: color, fontSize: 12),
        errorMaxLines: 3,
        suffixIcon:
            isObscureText
                ? IconButton(
                  onPressed: onPressed,
                  icon: Icon(
                    !obscureText ? Icons.visibility : Icons.visibility_off,
                    color: color,
                  ),
                )
                : null,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // ignore: deprecated_member_use
      toolbarOptions: const ToolbarOptions(
        copy: true,
        paste: true,
        cut: true,
        selectAll: true,
      ),
      enableInteractiveSelection: true,
      cursorColor: color,
      enabled: enabled,
    );
  }
}
