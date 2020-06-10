// 檢查應用程序是否已連接到互聯網：

// static Future<bool> checkInternetConnectivity() async {
//     bool isConnected;
//     try {
//       final result = await InternetAddress.lookup('google.com');
//       if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//         isConnected = true;
//       }
//     } on SocketException catch (_) {
//       isConnected = false;
//     }
//     return isConnected;
//   }
// AppUtil.checkInternetConnectivity().then((isOnline) async {
//       if (isOnline) {...} else {...}
// })
