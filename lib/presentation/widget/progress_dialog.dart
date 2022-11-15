import 'package:flutter/material.dart';
import '../../common/utils/app_colors.dart';


mixin ProgressDialog {
  static bool _isDialogVisible = false;

  static show(BuildContext context) {
    _isDialogVisible = true;
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return  Center(
            child: CircularProgressIndicator(
              color: AppColors.textBlack,
            ),
          );
        });
  }

  static hide(BuildContext context) {
    if (_isDialogVisible) {
      _isDialogVisible = false;
      Navigator.pop(context);
    }
  }
}
