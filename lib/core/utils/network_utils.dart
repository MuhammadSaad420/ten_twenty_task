import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:court_pro/main.dart';

import '../enums/toast_type.dart';
import 'toast_utils.dart';

class NetworkUtils {
  static Future<bool> isInternetAvailable() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    bool isInternetAvailable =
        connectivityResult.contains(ConnectivityResult.mobile) ||
            connectivityResult.contains(ConnectivityResult.wifi);
    if (!isInternetAvailable) {
      ToastUtils.show(
          msg: loc.msg_no_network_available, type: ToastType.message);
    }
    return isInternetAvailable;
  }
}
