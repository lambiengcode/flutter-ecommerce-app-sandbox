import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:now/src/app.dart';
import 'package:now/src/pages/home/categories_page/categories_page.dart';
import 'package:now/src/pages/home/widgets/freeship_list_page.dart';
import 'package:now/src/pages/home/widgets/voucher_list_page.dart';
import 'package:now/src/pages/members/pages/products_page.dart';
import 'package:now/src/pages/members/pages/vouchers_page.dart';
import 'package:now/src/pages/profile/pages/my_points_page.dart';
import 'package:now/src/pages/profile/pages/my_voucher_page.dart';
import 'package:now/src/pages/store/pages/list_product_page.dart';
import 'package:now/src/pages/store/pages/product_page.dart';
import 'package:now/src/pages/store/store_page.dart';

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
      GetPage(
        name: '/store/:id',
        page: () => StorePage(
          id: Get.parameters['id'],
        ),
        transition: Transition.zoom,
        transitionDuration: Duration(milliseconds: 400),
      ),
      GetPage(
        name: '/products',
        page: () => ProductsPage(),
        transition: Transition.zoom,
        transitionDuration: Duration(milliseconds: 400),
      ),
      GetPage(
        name: '/vouchers',
        page: () => VouchersPage(),
        transition: Transition.zoom,
        transitionDuration: Duration(milliseconds: 400),
      ),
      GetPage(
        name: '/product',
        page: () => ProductPage(),
        transition: Transition.size,
        transitionDuration: Duration(milliseconds: 400),
      ),
      GetPage(
        name: '/productlist/:title',
        page: () => ListProductPage(
          title: Get.parameters['title'],
        ),
        transition: Transition.size,
        transitionDuration: Duration(milliseconds: 400),
      ),
      GetPage(
        name: '/myvoucher',
        page: () => MyVoucherPage(),
        transition: Transition.size,
        transitionDuration: Duration(milliseconds: 400),
      ),
      GetPage(
        name: '/mypoints',
        page: () => MyPointsPage(),
        transition: Transition.size,
        transitionDuration: Duration(milliseconds: 400),
      ),
    ],
  ));
}
