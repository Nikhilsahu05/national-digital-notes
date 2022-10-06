import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Message from NDN"),
            subtitle: Text("23-09-22"),
            trailing: Text("07:10 PM"),
          ),
          const ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Delivered Book"),
            subtitle: Text("23-09-22"),
            trailing: Text("07:10 PM"),
          ),
          ListTile(
            tileColor: Colors.red.shade100,
            leading: const Icon(Icons.notifications),
            title: const Text("Update Account Password"),
            subtitle: const Text("23-09-22"),
            trailing: const Text("07:10 PM"),
          ),
          const ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Message from NDN"),
            subtitle: Text("23-09-22"),
            trailing: Text("07:10 PM"),
          ),
        ],
      ),
    );
  }
}
