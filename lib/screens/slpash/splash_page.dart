import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:namozvaqtlari/core/resources/asset_resources.dart';
import 'package:namozvaqtlari/routes/all_routes.dart';
// import 'package:namozvaqtlari/routes/all_routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushNamedAndRemoveUntil(
            context, AllRoutesNames.home, (settings) => false);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Lottie.asset(
            LottieAssets.lottieSplash,
          ),
        ),
        // ElevatedButton(
        //     onPressed: () {
        //       Navigator.pushNamed(context, AllRoutesNames.home);
        //     },
        //     child: const Text("Meni Bos")),
      ],
    ));
  }
}
