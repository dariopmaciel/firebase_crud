import 'package:firebase_crud/core/ui/helpers/size_extensions.dart';
import 'package:firebase_crud/page/home/home_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            child: SizedBox(
              width: context.screenWidth * 0.97,
              child: Image.asset("assets/images/MultiComp-Banner.png"),
            ),
          ),
        ],
      ),
    );
  }
}
