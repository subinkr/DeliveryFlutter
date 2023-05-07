import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled1/common/component/view/root_tab.dart';
import 'package:untitled1/common/const/colors.dart';
import 'package:untitled1/common/const/data.dart';
import 'package:untitled1/common/layout/default_layout.dart';
import 'package:untitled1/common/secure_storage/secore_storage.dart';
import 'package:untitled1/user/view/login_screen.dart';

class SplashScreen extends ConsumerWidget {
  static String get routeName => 'splash';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      backgroundColor: PRIMARY_COLOR,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asset/img/logo/logo.png',
              width: MediaQuery.of(context).size.width / 2,
            ),
            SizedBox(
              height: 16,
            ),
            CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
