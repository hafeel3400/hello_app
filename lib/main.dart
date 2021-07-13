import 'package:flutter/material.dart';
import 'package:hello_app/models/products.dart';
import 'package:hello_app/utils/utility.dart';
import 'package:hello_app/productbox.dart';
import 'package:hello_app/view/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World Demo Application',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.deepOrange,
      ),
      home: HomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  final List<Products> items = [
    Products(
        name: 'Pixel',
        description: 'Pixel is the most featureful phone ever',
        price: 800,
        image: 'pixel.jpg'),
    Products(
        name: 'Pixel',
        description: 'Laptop is most productive development tool',
        price: 500,
        image: 'laptop.jpg'),
    Products(
        name: 'Pixel',
        description: 'Pixel is the most featureful phone ever',
        price: 1800,
        image: 'iphone.jpg'),
    Products(
        name: 'Pixel',
        description: 'Pixel is the most featureful phone ever',
        price: 300,
        image: 'pixel.jpg'),
    Products(
        name: 'Pixel',
        description: 'Laptop is most productive development tool',
        price: 500,
        image: 'laptop.jpg'),
    Products(
        name: 'Pixel',
        description: 'Pixel is the most featureful phone ever',
        price: 1800,
        image: 'iphone.jpg'),
    Products(
        name: 'Pixel',
        description: 'Pixel is the most featureful phone ever',
        price: 300,
        image: 'pixel.jpg')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Product Listing")),
        body: Container(child:ListView.builder(
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              // child: ProductBox(item: items[index]),
              onTap: () {
                alertDialog(context, "Title", "Position $index");
              },
            );
          },
        )));
  }
}



