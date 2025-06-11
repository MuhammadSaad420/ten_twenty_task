import 'package:court_pro/core/extensions/common_extenisons.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../enums/toast_type.dart';

class ToastUtils {
  static show(
      {required String msg,
      Toast length = Toast.LENGTH_SHORT,
      ToastType type = ToastType.message}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: length,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: type.getColor(),
        textColor: Colors.white,
        fontSize: 12.0);
  }

  static hide() {
    Fluttertoast.cancel();
  }
}
