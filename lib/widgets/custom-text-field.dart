import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String title;
  final bool readOnly;
  final Function()? onTap;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Icon? prefixIcon;
  final TextInputType textInputType;
  final TextInputAction textInputAction;

  const CustomTextField({
    Key? key,
    this.hintText = '',
    this.title = '',
    this.readOnly = false,
    this.onTap,
    this.controller,
    this.validator,
    this.prefixIcon,
    this.onFieldSubmitted,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.done, this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        const SizedBox(
          height: 3,
        ),
        TextFormField(
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          keyboardType: textInputType,
          textInputAction: textInputAction,
          validator: validator,
          controller: controller,
          enabled: true,
          readOnly: readOnly,
          onTap: readOnly ? onTap : null,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            hintText: hintText,
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.only(left: 20),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: gray5),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: gray5),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: gray5),
            ),
          ),
        ),
      ],
    );
  }
}
