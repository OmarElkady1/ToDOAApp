import 'package:flutter/material.dart';

class MYFormField extends StatelessWidget {
  MYFormField({
    Key? key,
    required this.controller,
    required this.textInputType,
    this.onTap,
    this.onChange,
    this.onSubmit,
    this.validate,
    required this.label,
    this.isClickable,
    this.isPassword,
    this.value,
    this.suffixPressed,
    this.suffix,
    this.prefix,
    required this.hint,
  }) : super(key: key);
  TextEditingController controller;
  TextInputType textInputType;
  GestureTapCallback? onTap;
  ValueChanged<String>? onChange;
  ValueChanged<String>? onSubmit;
  FormFieldValidator<String>? validate;
  String label;
  String hint;
  bool? value;
  bool? isClickable = true;
  bool? isPassword = false;
  Widget? prefix;
  Widget? suffix;
  VoidCallback? suffixPressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: value!,
      cursorColor: Colors.grey,
      controller: controller,
      keyboardType: textInputType,
      obscureText: isPassword!,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        suffix: suffix,
        border: InputBorder.none,
        prefix: prefix,
        hintText: hint,
        // border: OutlineInputBorder(),

        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 0),
        ),
      ),
    );
  }
}
