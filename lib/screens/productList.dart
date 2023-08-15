import 'package:e_trade/db/dbHelper.dart';
import 'package:e_trade/models/product.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget{
  const ProductList({super.key});
  @override
  State<StatefulWidget> createState()=> ProductListState();
}

class ProductListState extends State{
  DbHelper dbHelper = DbHelper();
  late List<Product> products;
  int count = 0;
  Widget build(BuildContext context) {
    products = List<Product>.from([]);
    getData();
    

    return Scaffold(
      body: productListItems(),
    );
  }
  
  productListItems() {
    return ListView.builder(
      itemBuilder:  (BuildContext context, int position) {
        return Card(
          color:  Colors.blueAccent,
          elevation: 2.0,
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.amberAccent,
              child: Text("E"),
            ),
            title: Text(products[position].name),
            subtitle: Text(products[position].description),
            onTap:() {},
          ),
        );
      });
  }

// Bu method ile veri çekilir.
  void getData(){
    var dbFuture = dbHelper.initializeDb();
    dbFuture.then( (result){
      var productsFuture = dbHelper.getProducts();
      productsFuture.then((data) {
        List<Product> productsData = List<Product>.from([]);
        count = data.length;

        for (var i = 0; i < count; i++) {
          productsData.add(Product.fromMap(data[i]));
        }

        setState(() {
          products = productsData;
          count = count;
        });
      });
    });
  }

}