import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_cupertino_widget/adaptive_page.dart';
import 'package:learn_cupertino_widget/android_page.dart';
import 'package:learn_cupertino_widget/ios_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //final platform = Theme.of(context).platform;

    //For Test
    const platform = TargetPlatform.android;
    bool isIos = (platform != TargetPlatform.iOS);
    return isIos
        ? iOSBase(platform: platform)
        : androidBase(platform: platform);
  }

  CupertinoApp iOSBase({required TargetPlatform platform}) {
    return CupertinoApp(
      theme: const CupertinoThemeData(primaryColor: Colors.red),
      title: 'Learn Cupertino',
      home: AdaptivePage(
        platform: platform,
      ),
    );
  }

  MaterialApp androidBase({required TargetPlatform platform}) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      title: 'Learn Cupertino',
      home: AdaptivePage(
        platform: platform,
      ),
    );
  }
}
