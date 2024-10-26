import 'package:flutter/material.dart';

class MyProducts extends StatefulWidget {
  const MyProducts({super.key});

  @override
  State<MyProducts> createState() => _MyProductsState();
}

class _MyProductsState extends State<MyProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Color(0XFFF4F4F4),
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}