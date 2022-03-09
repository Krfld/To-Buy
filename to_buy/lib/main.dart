import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:to_buy/views/products_view.dart';

// import './views/groups_view.dart';
// import './views/check_lists_view.dart';
// import './views/products_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Buy',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        brightness: Brightness.dark,
      ),
      // routes: {
      //   'GroupsView': (context) => GroupsView(),
      //   'CheckListsView': (context) => CheckListsView(),
      //   'ProductsView': (context) => ProductsView(),
      // },
      home: ProductsView(),
    );
  }
}
