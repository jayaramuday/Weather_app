import 'package:flutter/material.dart';
import 'package:clima/screens/loading_screen.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: TextButton(
            onPressed: () {
              checkPermission(Permission.location, context);
            },
            child: const Text("Check Permission")));
  }

  Future<void> checkPermission(
      Permission permission, BuildContext context) async {
    final status = await permission.request();
    if (status.isGranted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Permission is Granted")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Permission is not Granted")));
    }
  }
}
