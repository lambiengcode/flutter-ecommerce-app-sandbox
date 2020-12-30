import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:now/src/app.dart';
import 'package:now/src/pages/home/categories_page/categories_page.dart';
import 'package:now/src/pages/home/widgets/freeship_list_page.dart';
import 'package:now/src/pages/home/widgets/voucher_list_page.dart';

import 'src/pages/members/members_page.dart';

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
      GetPage(
        name: '/voucher',
        page: () => VoucherListPage(),
        transition: Transition.cupertinoDialog,
        transitionDuration: Duration(milliseconds: 400),
      ),
      GetPage(
        name: '/freeship',
        page: () => FreeshipListPage(),
        transition: Transition.cupertinoDialog,
        transitionDuration: Duration(milliseconds: 400),
      ),
      GetPage(
        name: '/owner',
        page: () => MembersPage(),
        transition: Transition.cupertinoDialog,
        transitionDuration: Duration(milliseconds: 400),
      ),
      GetPage(
        name: '/categories/:title',
        page: () => CategoriesPage(
          title: Get.parameters['title'],
        ),
        transition: Transition.cupertinoDialog,
        transitionDuration: Duration(milliseconds: 400),
      ),
    ],
  ));
}
