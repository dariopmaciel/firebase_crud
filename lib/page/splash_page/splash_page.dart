
import 'package:firebase_crud/core/ui/helpers/size_extensions.dart';
import 'package:firebase_crud/core/ui/styles/text_styles.dart';
import 'package:firebase_crud/core/ui/widgets/btn/generic_btn.dart';
import 'package:firebase_crud/page/validator_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            heightFactor: 2,
            child: SizedBox(
              width: context.screenWidth * 0.97,
              child: Image.asset(
                "assets/images/MultiComp-Banner.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                const SizedBox(height: 200),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: const Color.fromRGBO(214, 214, 214, 1),
                  ),
                  //color: Color.fromRGBO(214, 214, 214, 1),
                  width: context.screenWidth * 0.94,
                  height: context.screenHeight * 0.64,
                  child: Center(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 40, left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("SOLUÇÕES PARA SUA EMPRESA",
                              style: TextStyles.i.textExtraBold
                                  .copyWith(fontSize: 18)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset("assets/images/baner-01.png",
                                  width: 180, height: 70),
                              Image.asset("assets/images/baner-03.png",
                                  width: 180, height: 70),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset("assets/images/baner-02.png",
                                  width: 180, height: 70),
                              Image.asset("assets/images/baner-04.png",
                                  width: 180, height: 70),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset("assets/images/baner-06.png",
                                  width: 180, height: 70),
                              Image.asset("assets/images/baner-05.png",
                                  width: 180, height: 70),
                            ],
                          ),
                          GenericBtn(
                            width: context.percentWidth(.7),
                            height: 35,
                            label: "ACESSAR",
                            onPressed: () {
                              Validator();
                            },
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}