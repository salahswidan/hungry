import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/home/view/home_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  double _opacity = 0;
  @override
  void initState() {
    Future.delayed(Duration(microseconds: 200), () {
      setState(() {
        _opacity = 1;
      });
    });
    Future.delayed(Duration(seconds: 1), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeView()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: AnimatedOpacity(
          duration: const Duration(seconds: 1),
          opacity: _opacity,
          curve: Curves.easeInOut,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Gap(400),
              TweenAnimationBuilder(
                tween: Tween(begin: 0.8, end: 1),
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeOutBack,
                builder: (context, scale, child) =>
                    Transform.scale(scale: scale.toDouble(), child: child),
                child: SvgPicture.asset('assets/logo/logo.svg'),
              ),
             const Spacer(),
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 40, end: 0),
                duration: const Duration(milliseconds: 900),
                curve: Curves.easeOutCubic,
                builder: (context, value, child) => Transform.translate(
                  offset: Offset(0, value),
                  child: child,
                ),
                child: Image.asset("assets/splash/splash.png"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
