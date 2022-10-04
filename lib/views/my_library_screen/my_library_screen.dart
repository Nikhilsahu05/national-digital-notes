import 'package:flutter/material.dart';

class MyLibraryView extends StatefulWidget {
  const MyLibraryView({Key? key}) : super(key: key);

  @override
  State<MyLibraryView> createState() => _MyLibraryViewState();
}

class _MyLibraryViewState extends State<MyLibraryView>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  ScrollController? _scrollController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController!.dispose();
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Library"),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Text(
              "Your Orders",
              style: TextStyle(fontSize: 17),
            ),
            Text(
              "Buy Again",
              style: TextStyle(fontSize: 17),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(
            child: ListView(children: [
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  "Past three months",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.grey.shade600),
                ),
              ),
              Divider(
                thickness: 1,
              ),
              ListTile(
                onTap: () {},
                leading: Image.asset(
                  'assets/books_covers/3.jpg',
                ),
                title: Text("Best Seller # Book"),
                subtitle: Text("Delivered on 2-Oct-2022"),
                trailing: Icon(Icons.chevron_right),
              ),
              Divider(
                thickness: 1,
              ),
              ListTile(
                onTap: () {},
                leading: Image.asset(
                  'assets/books_covers/8.jpg',
                ),
                title: Text("Best Seller # Book"),
                subtitle: Text("Delivered on 2-Oct-2022"),
                trailing: Icon(Icons.chevron_right),
              ),
              Divider(
                thickness: 1,
              ),
              ListTile(
                leading: Image.asset(
                  'assets/books_covers/1.jpg',
                ),
                title: Text("Best # Book"),
                subtitle: const Text("Delivered on 3-Oct-2022"),
                trailing: Icon(Icons.chevron_right),
              ),
              Divider(
                thickness: 1,
              ),
              ListTile(
                leading: Image.asset(
                  'assets/books_covers/4.jpg',
                ),
                title: Text("Kristin Hannah"),
                subtitle: Text("Ordered on 1-Oct-2022"),
                trailing: Icon(Icons.chevron_right),
              ),
              Divider(
                thickness: 1,
              ),
              ListTile(
                leading: Image.asset(
                  'assets/books_covers/5.jpg',
                ),
                title: Text("Leave the world behind"),
                subtitle: Text("Ordered on 5-Oct-2022"),
                trailing: Icon(Icons.chevron_right),
              ),
              Divider(
                thickness: 1,
              ),
              Center(
                child: Text(
                  "You have reached the end of Your Orders",
                  style: TextStyle(fontSize: 13),
                ),
              )
            ]),
          ),
          Container()
        ],
      ),
    );
  }
}
