import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'detailed_order_details_view.dart';

class MyLibraryView extends StatefulWidget {
  const MyLibraryView({Key? key}) : super(key: key);

  @override
  State<MyLibraryView> createState() => _MyLibraryViewState();
}

class _MyLibraryViewState extends State<MyLibraryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Library"),
      ),
      body: ListView(children: [
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
          subtitle: const Text("Purchase on 2-Oct-2022"),
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
          subtitle: const Text("Purchase on 2-Oct-2022"),
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
          subtitle: const Text("Purchase on 2-Oct-2022"),
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
          subtitle: const Text("Purchase on 2-Oct-2022"),
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
          subtitle: const Text("Purchase on 2-Oct-2022"),
          trailing: const Icon(Icons.chevron_right),
        ),
        const Divider(
          thickness: 1,
        ),
        const Center(
          child: Text(
            "You have reached the end of Your Library",
            style: TextStyle(fontSize: 13),
          ),
        )
      ]),
    );
  }
}
