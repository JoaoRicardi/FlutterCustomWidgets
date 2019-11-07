import 'package:flutter/material.dart';
import 'package:tabcontroller_bug_test/src/tabs/primeira_tab.dart';
import 'package:tabcontroller_bug_test/src/tabs/segunda_tab.dart';


class HomePage extends StatefulWidget {
  const HomePage({ Key key }) : super(key: key);
  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<HomePage> with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Amarela'),
    Tab(text: 'Verde'),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBar'),
        bottom: TabBar(
          isScrollable: false,
          onTap: (value) => print("tabclicked $value"),
          controller: _tabController,
          tabs: myTabs,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          PrimeiraTab(),
          SegundaTab()
        ]
      ),
    );
  }
}