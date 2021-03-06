import 'package:flutter/material.dart';
import 'package:flutter_base/app/common/Global.dart';
import 'package:flutter_base/app/module/splash/bean/prod_config_json_entity.dart';
import 'package:flutter_base/app/module/splash/view_models/pro_config_view_model.dart';
import 'package:flutter_base/app/module/splash/view_models/prod_config_view_model.dart';
import 'package:flutter_base/app/module/splash/view_models/test_config_view_model.dart';
import 'package:flutter_base/app/route/routes_constants.dart';
import 'package:flutter_base/framework/config/env_config.dart';
import 'package:flutter_base/framework/route/route_utils.dart';
import 'package:flutter_base/framework/viewModel/base_view_model.dart';

class SplashViewModel extends BaseViewModel {
  late ProdConfigJsonEntity _entity;
  late BuildContext _context;
  BaseViewModel<ProdConfigJsonEntity>? _preViewModel;

  SplashViewModel();

  Future getProdConfig(BuildContext context) async {
    _context = context;
    EnvStatus envStatus = await EnvConfig().getEnvConfigStatus();
    switch (envStatus) {
      case EnvStatus.pre:
        _preViewModel = PreConfigViewModel<ProdConfigJsonEntity>(context);
        getConfig(_preViewModel);
        break;
      case EnvStatus.release:
        _preViewModel = ProdConfigViewModel<ProdConfigJsonEntity>(context);
        getConfig(_preViewModel);
        break;
      case EnvStatus.dev:
        _preViewModel = TestConfigViewModel<ProdConfigJsonEntity>(context);
        getConfig(_preViewModel);
        break;
      default:
        break;
    }
  }

  ///更新全局变量
  void getConfig(BaseViewModel? viewModel) {
    viewModel?.getController()?.stream.listen((event) {
      _entity = event as ProdConfigJsonEntity;
      //更新全局静态变量
      Global.getAppConfig().updateConfigBean(_entity);
      goNext(_context);
    });
  }

  Future<void>? goNext(content) {
    return RouteUtils.goNavigateTo(content, RoutesConstants.loginPage,
        clearStack: true, replace: false);
  }

  @override
  void dispose() {
    _preViewModel?.dispose();
    super.dispose();
  }
}
