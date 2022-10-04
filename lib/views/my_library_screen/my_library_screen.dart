import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'detailed_order_details_view.dart';

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
          tabs: const [
            SizedBox(
              height: 35,
              child: Text(
                "Your Orders",
                style: TextStyle(fontSize: 17),
              ),
            ),
            SizedBox(
              height: 35,
              child: Text(
                "Buy Again",
                style: TextStyle(fontSize: 17),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListView(children: [
            const SizedBox(
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
            const Divider(
              thickness: 1,
            ),
            ListTile(
              onTap: () {
                Get.to(DetailedBooksOrder(
                  bookName: 'Best Seller # Book',
                  imageURL: 'assets/books_covers/3.jpg',
                  orderedDate: 'Delivered on 2-Oct-2022',
                ));
              },
              leading: Image.asset(
                'assets/books_covers/3.jpg',
              ),
              title: const Text("Best Seller # Book"),
              subtitle: const Text("Delivered on 2-Oct-2022"),
              trailing: const Icon(Icons.chevron_right),
            ),
            const Divider(
              thickness: 1,
            ),
            ListTile(
              onTap: () {},
              leading: Image.asset(
                'assets/books_covers/8.jpg',
              ),
              title: const Text("Best Seller # Book"),
              subtitle: const Text("Delivered on 2-Oct-2022"),
              trailing: const Icon(Icons.chevron_right),
            ),
            const Divider(
              thickness: 1,
            ),
            ListTile(
              leading: Image.asset(
                'assets/books_covers/1.jpg',
              ),
              title: const Text("Best # Book"),
              subtitle: const Text("Pending"),
              trailing: const Icon(Icons.chevron_right),
            ),
            const Divider(
              thickness: 1,
            ),
            ListTile(
              leading: Image.asset(
                'assets/books_covers/4.jpg',
              ),
              title: const Text("Kristin Hannah"),
              subtitle: const Text("Ordered on 1-Oct-2022"),
              trailing: const Icon(Icons.chevron_right),
            ),
            const Divider(
              thickness: 1,
            ),
            ListTile(
              leading: Image.asset(
                'assets/books_covers/5.jpg',
              ),
              title: const Text("Leave the world behind"),
              subtitle: const Text("Ordered on 4-Oct-2022"),
              trailing: const Icon(Icons.chevron_right),
            ),
            const Divider(
              thickness: 1,
            ),
            const Center(
              child: Text(
                "You have reached the end of Your Orders",
                style: TextStyle(fontSize: 13),
              ),
            )
          ]),
          Container()
        ],
      ),
    );
  }
}
