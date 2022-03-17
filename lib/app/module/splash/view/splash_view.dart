import 'package:flutter/material.dart';
import 'package:flutter_base/app/module/splash/view_models/splash_view_model.dart';
import 'package:flutter_base/framework/core/base/base_stateful_view.dart';
import 'package:flutter_base/framework/utils/assets_utils.dart';

class SplashView extends BaseStatefulView<SplashViewModel> {
  SplashView({Key? key}) : super(key: key);
  late SplashViewModel _viewModel;
  @override
  Widget buildView(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Image.asset(
          AssetsUtils.loadAssetsImg("splash", postfix: ".webp"),
          width: 200.0,
          height: 200.0,
        ),
      ),
    );
  }

  @override
  SplashViewModel createViewModel() {
    _viewModel = SplashViewModel();
    return _viewModel;
  }

  @override
  void initState(BuildContext context) {
    _viewModel.getProdConfig(context);
  }

  @override
  bool canLoading() {
    return true;
  }

  @override
  void dispose() {
    _viewModel.dispose;
  }
}
