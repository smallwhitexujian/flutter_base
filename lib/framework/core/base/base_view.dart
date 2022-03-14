import 'package:flutter/cupertino.dart';
import 'package:flutter_base/framework/lib_base.dart';

import '../ui_state/load_empty_view.dart';
import '../ui_state/load_error_view.dart';
import '../ui_state/load_state_parent_view.dart';
import '../ui_state/loading_view.dart';

abstract class BaseView<T extends BaseViewModel> extends StatelessWidget
    implements IView {
  late T _viewModel;

  ///加载中页面
  late Widget? _loadingChild;

  ///数据为空的页面
  late Widget? _emptyChild;

  ///请求失败显示的页面
  late Widget? _errorChild;

  /// 注册其它的provider 默认没有其它provider
  List<ChangeNotifierProvider>? registProviders();

  /// 创建ViewModel
  T createViewModel();

  /// 注册其它的provider 默认没有其它provider
  List<ChangeNotifierProvider> _registProviders() {
    List<ChangeNotifierProvider> providers = [];
    var baseProvider = ChangeNotifierProvider(
      create: (context) => _viewModel,
    );
    providers.add(baseProvider);
    if (!CommonUtils.isEmpt<ChangeNotifierProvider>(registProviders())) {
      providers.addAll(registProviders()!);
    }
    return providers;
  }

  BaseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _viewModel = createViewModel();
    Widget contentView = buildView(context);
    return MultiProvider(
        providers: _registProviders(),
        child: Stack(
          children: createPageView(contentView),
        ));
  }

  /// 构造页面内容
  List<Widget> createPageView(Widget contentView) {
    List<Widget> widgets = [];
    widgets.add(contentView);
    bool canLoading = canLoadingState();
    if (canLoading) {
      // 加载中页面
      Widget loadingView = createStateView(_getLoadingWidget());
      if (loadingView != null) {
        widgets.add(loadingView);
      }
      // 错误页面
      Widget errorView = createStateView(_getErrorWidget(_viewModel));
      if (errorView != null) {
        widgets.add(errorView);
      }
    }
    return widgets;
  }

  Widget createStateView(Widget stateView) {
    // 加载布局
    Widget sate = Consumer(
        builder: (context, T viewModel, _) => Visibility(
              child: stateView,
              visible: viewModel.isOnComplete(),
            ));
    return sate;
  }

  ///加载错误页面
  Widget _getErrorWidget(T viewModel) {
    return LoadStateParentView(
      (_errorChild ??
          BaseLibPlugin.resConfig?.configLoadErrorView() ??
          const LoadErrorView(null)),
      _onRefresh(viewModel),
    );
  }

  ///加载空页面
  Widget _getEmptyWidget(T viewModel) {
    return LoadStateParentView(
      (_emptyChild ??
          BaseLibPlugin.resConfig?.configLoadEmptyWidget() ??
          const LoadEmptyView(null)),
      _onRefresh(viewModel),
    );
  }

  ///加载中...页面 加载中所以不用处理其他事件
  Widget _getLoadingWidget() {
    return LoadStateParentView(
      (_loadingChild ??
          BaseLibPlugin.resConfig?.configLoadingWidget() ??
          const LoadingView(null)),
      null,
    );
  }

  ///通知viewModle刷新
  VoidCallback _onRefresh(T viewModel) {
    return () {
      viewModel.notifyListeners();
    };
  }
}

abstract class IView {
  bool canLoadingState();

  Widget buildView(BuildContext context);
}
