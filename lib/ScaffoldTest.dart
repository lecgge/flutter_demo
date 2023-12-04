import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScaffoldTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScaffoldTest();
}

class _ScaffoldTest extends State<ScaffoldTest>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tabs = [
      "首页",
      "第一页",
      "第二页",
      "第三页",
    ];
    return Scaffold(
      //顶部导航栏
      appBar: AppBar(
        //标题
        title: const Text("App Names"),
        //导航栏左侧按钮
        leading: Builder(
          builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(
                  Icons.dashboard,
                  color: Colors.white,
                ));
          },
        ),
        actions: [
          //导航栏右侧按钮
          IconButton(onPressed: () {}, icon: const Icon(Icons.share))
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: false,
          tabs: [for (final tab in tabs) Tab(text: tab)],
        ),
      ),
      drawer: MyDrawer(),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.home)),
            SizedBox(),
            IconButton(onPressed: () {}, icon: Icon(Icons.business))
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
      floatingActionButton: ClipOval(
        child: Container(
          color: Colors.blue,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: TabBarView(
        controller: _tabController,
        children: [for (final i in tabs) Center(child: Text(i))],
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
          removeBottom: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 38.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ClipOval(
                        child: Image.network(
                          "https://img0.baidu.com/it/u=3624754827,881032523&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=1028",
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Text(
                      "Wendux",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: ListView(
                children: const [
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text("Add account"),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("Manage accounts"),
                  )
                ],
              ))
            ],
          )),
    );
  }
}
