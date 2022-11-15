import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomFormField extends StatefulWidget {
  const CustomFormField({
    Key? key,
    required TextEditingController controller,
    required TextInputType keyboardType,
    required TextInputAction inputAction,
    required String hint,
    required Function(String value) validator,
    this.isObscure = false,
    this.isCapitalized = false,
    this.maxLines = 1,
    this.isLabelEnabled = true,
  })  : _controller = controller,
        _keyboardType = keyboardType,
        _inputAction = inputAction,
        _hint = hint,
        _validator = validator,
        super(key: key);

  final TextEditingController _controller;
  final TextInputType _keyboardType;
  final TextInputAction _inputAction;
  final String _hint;
  final bool isObscure;
  final bool isCapitalized;
  final int maxLines;
  final bool isLabelEnabled;
  final Function(String) _validator;

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  var isVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: AppColors.textBlack),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget._controller,
      maxLines: widget.maxLines,
      keyboardType: widget._keyboardType,
      obscureText: widget.isObscure ? isVisible : false,
      textCapitalization: widget.isCapitalized
          ? TextCapitalization.words
          : TextCapitalization.none,
      textInputAction: widget._inputAction,
      cursorColor: AppColors.textBlack,
      validator: (value) => widget._validator(value!),
      decoration: InputDecoration(
          suffixIcon: widget.isObscure
              ? IconButton(
                  splashColor: Colors.transparent,
                  icon: Icon(
                      isVisible ? Icons.visibility : Icons.visibility_off,
                      color: isVisible
                          ? AppColors.textBlack.withOpacity(0.50)
                          : AppColors.textBlack),
                  onPressed: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                )
              : null,
          filled: true,
          fillColor: AppColors.borderColor,
          hintStyle: TextStyle(fontSize: 16.0, color: AppColors.loginDesc),
          labelStyle: const TextStyle(color: Colors.black),
          hintText: widget._hint,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
          errorStyle: const TextStyle(
            color: Colors.redAccent,
            fontWeight: FontWeight.bold,
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: AppColors.borderColor)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide:  BorderSide(color: AppColors.borderColor)),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: Colors.redAccent,
              width: 2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: Colors.redAccent,
              width: 2,
            ),
          )),
    );
  }
}