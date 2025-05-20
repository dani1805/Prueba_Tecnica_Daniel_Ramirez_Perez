import 'package:flutter/material.dart';

class StandardInputFormField extends StatelessWidget {
  const StandardInputFormField({
    super.key,
    this.validator,
    this.controller,
    this.type = TextInputType.text,
    this.onChanged,
    this.hint,
    this.isObscureText = false,
    this.obscureText = false,
    this.color,
    this.enabled,
    this.onPressed,
    this.label,
  });

  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType type;
  final Function(String?)? onChanged;
  final String? hint;
  final String? label;
  final bool isObscureText;
  final bool obscureText;
  final Color? color;
  final bool? enabled;
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
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 2.0, color: Colors.grey),
        ),
        hintText: hint,
        labelText: label,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 2.0, color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 2.0, color: Colors.grey),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 2.0, color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 2.0, color: Colors.red),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 2.0, color: Colors.grey),
        ),
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
