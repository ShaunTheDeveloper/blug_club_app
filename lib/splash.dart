

import 'package:flutter/material.dart';
import 'package:untitled2/on_boarding.dart';

import 'gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) => {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const OnBoarding()))
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Assets.img.background.splash.image(fit: BoxFit.cover)),
        Center(child: SvgPicture.asset(Assets.img.icons.logoSplash,width: 100,),)
      ],
    );
  }
}