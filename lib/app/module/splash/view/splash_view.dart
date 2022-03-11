import 'package:flutter/material.dart';
import 'package:flutter_base/app/module/splash/view_models/auto_login_view_model.dart';
import 'package:flutter_base/app/module/splash/view_models/splash_view_model.dart';
import 'package:flutter_base/framework/lib_base.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late BuildContext _context;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);

    _controller.forward();

    _animation.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _context.read<AutoLoginViewModel>().goNext(_context);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: SplashViewModel(context)),
        ChangeNotifierProvider.value(value: AutoLoginViewModel(context)),
      ],
      builder: (context, child) {
        _context = context;
        return FadeTransition(
          opacity: _animation,
          child: Center(
            child: Image.asset(
              AssetsUtils.loadAssetsImg('logo'),
              width: 200,
              height: 200,
            ),
          ),
        );
      },
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
