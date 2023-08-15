import 'package:e_trade/db/dbHelper.dart';
import 'package:e_trade/models/product.dart';
import 'package:e_trade/screens/productList.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    List<Product> products = [];
    DbHelper dbHelper = DbHelper();
    dbHelper.initializeDb().then((result) => dbHelper.getProducts()
    .then((result) => products=result.cast<Product>()));

    Product product = Product("Mouse", "a4 tech wireless mouse", 40);
    dbHelper.insert(product);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ProductList(),
    );
  }

}
