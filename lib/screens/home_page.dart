// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_list.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  final url = "https://api.jsonbin.io/b/6220f88406182767436c32fd";

  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    /* final catalogJSon =
        await rootBundle.loadString("assets/files/catalog.json"); */
    final response = await http.get(Uri.parse(url));
    final catalogJSon = response.body;
    final decodedData = jsonDecode(catalogJSon);
    var productData = decodedData['products'];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  Widget build(BuildContext context) {
    //  final dummyList = List.generate(15, (index) => CatalogModel.items[0]);

    final _cart = (VxState.store as MyStore).cart;

    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Mythemes.darkBluish,
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.CartRoute);
        },
        child: Icon(CupertinoIcons.cart),
      ).badge(
          color: Vx.red500,
          size: 22,
          count: _cart.items.length,
          textStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          )),
      body: SafeArea(
        child: Container(
            padding: Vx.m32,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().py16().expand()
            ])),
        // if(CatalogModel.items!=null)),
      ),
    );
  }
}
