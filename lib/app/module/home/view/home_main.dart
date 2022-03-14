import 'package:flutter/material.dart';
import 'package:flutter_base/app/module/home/view_models/home_view_model.dart';
import 'package:flutter_base/framework/core/ui_state/load_empty_view.dart';
import 'package:flutter_base/framework/utils/toastUtils/toast_utils.dart';

import '../../../../framework/lib_base.dart';

class HomeMain extends StatelessWidget {
  const HomeMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return HomeViewModel();
        }),
      ],
      child: _MainView(),
      builder: (context, child) {
        return WillPopScope(
          onWillPop: context.read<HomeViewModel>().onWillPop(function: () {
            ToastUtils()
              ..initToast(context)
              ..showCenter("请再次点击返回按钮即可退出");
          }),
          child: child!,
        );
      },
    );
  }
}

class _MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<_MainView>
    with SingleTickerProviderStateMixin {
  ///当前显示的页面索引
  int _currentIndex = 0;
  late PageController _pageController;

  final List _tabsText = ['首页', '福利', '我的'];
  final List _tabsIcon = [
    'ic_home_main',
    'ic_home_welfare',
    'ic_home_mine',
  ];

  final List<Widget> _pages = [
    ///首页
    const LoadEmptyView(null),

    ///福利
    const LoadEmptyView(null),

    ///我的
    const LoadEmptyView(null),
  ];
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();

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
      if (status == AnimationStatus.completed) {}
    });

    _currentIndex = 0;
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _pages.length,
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return _pages[index];
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        showUnselectedLabels: true,
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: [
          _getBottomNavigationBar(_tabsText[0], _tabsIcon[0]),
          _getBottomNavigationBar(_tabsText[1], _tabsIcon[1]),
          _getBottomNavigationBar(_tabsText[2], _tabsIcon[2]),
        ],
        onTap: (index) {
          if (_currentIndex != index) {
            _currentIndex = index;
            _pageController.jumpToPage(index);
            setState(() {});
          }
        },
      ),
    );
  }

  _getBottomNavigationBar(String label, String iconPath) {
    return BottomNavigationBarItem(
      label: label,
      activeIcon: _getBottomIcon('${iconPath}_selected'),
      icon: _getBottomIcon('${iconPath}_unselected'),
    );
  }

  _getBottomIcon(String icon) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Image.asset(
        AssetsUtils.loadAssetsImg('logo'),
        width: 26,
        height: 26,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
