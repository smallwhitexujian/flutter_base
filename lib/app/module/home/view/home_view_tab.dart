import 'package:flutter/material.dart';
import 'package:flutter_base/app/module/home/view_models/home_view_model.dart';
import 'package:flutter_base/framework/lib_base.dart';
import 'package:flutter_base/framework/utils/screen_utils.dart';

import '../../../../framework/lib_base.dart';

class HomeViewTab extends StatefulWidget {
  const HomeViewTab({Key? key}) : super(key: key);

  @override
  _HomeViewTabState createState() => _HomeViewTabState();
}

class _HomeViewTabState extends State<HomeViewTab> {
  static const _tabBarTextStyle = TextStyle(fontSize: 15);

  final _tabs = [
    const Tab(child: Text('精选')),
    const Tab(child: Text('新游')),
    const Tab(child: Text('排行')),
  ];

  final _tabViews = [HomeViewTab(), HomeViewTab(), HomeViewTab()];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: HomeViewModel())],
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent),
          child: DefaultTabController(
            length: _tabs.length,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 40,
                  margin: EdgeInsets.only(
                      top: ScreenUtils.statusBarHeight, left: 10),
                  child: TabBar(
                    isScrollable: true,
                    indicatorColor: Colors.pinkAccent,
                    indicatorPadding:
                        const EdgeInsets.symmetric(horizontal: 10),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 3,
                    unselectedLabelColor: Colors.grey,
                    unselectedLabelStyle: const TextStyle(
                      fontSize: 15,
                    ),
                    labelColor: Colors.pinkAccent,
                    labelStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    labelPadding: const EdgeInsets.symmetric(horizontal: 10),
                    tabs: _tabs,
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: _tabViews,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
