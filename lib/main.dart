import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:now/src/app.dart';

void main() {
  // For play billing library 2.0 on Android, it is mandatory to call
  // [enablePendingPurchases](https://developer.android.com/reference/com/android/billingclient/api/BillingClient.Builder.html#enablependingpurchases)
  // as part of initializing the app.

  runApp(GetMaterialApp(
    title: 'Now',
    debugShowCheckedModeBanner: false,
    initialRoute: '/root',
    defaultTransition: Transition.native,
    locale: Locale('vi', 'VN'),
    getPages: [
      GetPage(name: '/root', page: () => App()),
    ],
  ));
}
