import 'package:app_food_delivery/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:app_food_delivery/models/category.dart';
import 'package:app_food_delivery/models/product.dart';
import 'package:app_food_delivery/models/sous_categ.dart';
import 'package:app_food_delivery/models/supplement.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
String ink="192.168.1.2:9000";
fetchProduct() async {
  String Link = "http://$ink/restoApp/get_produit.php";
  final response =
  await  http.get(Link);

  if (response.statusCode == 200) {

    product.fromJson(jsonDecode(response.body));
  } else {

    throw Exception('failed to get list of product');
  }
}
Future<Category> fetchCategory() async {
  final response =
  await http.get('http://$ink/restoApp/get_categorie.php');

  if (response.statusCode == 200) {
    fetchsupplemenatire();
    fetchsouscategoy();
    fetchProduct();
    return Category.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
Category getCategfromList(String id){
  for(int i=0;i<Category.setCategory.length;i++){
    if(Category.setCategory[i].id==id)
      return Category.setCategory[i];
  }
  print('this category is not exist');
}
fetchsouscategoy() async {
  String Link='http://$ink/restoApp/get_sous_categorie.php';
  final response =
  await  http.get(Link);
  if (response.statusCode == 200) {
    souscateg.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}
fetchsupplemenatire() async {
  String Link = "http://$ink/restoApp/get_supplementaire.php";
  final response = await  http.get(Link);
  if (response.statusCode == 200) {
    supplement.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load supplementaire');
  }
}
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<Category> _futureCategory;
  void setAll(){
    for(int i =0; i<product.prod.length;i++)
      {
        product.prod[i].addsouscateg();
        product.prod[i].addsupplementaire();
      }
    for(int i=0;i<Category.setCategory.length;i++)
      Category.setCategory[i].setList();

  }

  @override
  void initState() {
    super.initState();
    _futureCategory = fetchCategory();

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: FutureBuilder<Category>(
            future: _futureCategory,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  setAll();
                 _prinStaticList();
                  return HomePage();
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
              }

              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
  void _prinStaticList() {
    for(int i=0;i<Category.setCategory.length;i++){
      print(Category.setCategory[i].name);

    }
    print('---------');
    print(product.prod.length.toString());
    for(int i=0;i<product.prod.length;i++){
      print(product.prod[i].name);
    }
    print('---------');
    for(int i=0;i<souscateg.sous_categorie.length;i++){
      print(souscateg.sous_categorie[i].detail);
      print(souscateg.sous_categorie[i].exist);
      print(souscateg.sous_categorie[i].idProd);
    }
    print('---------');
    for(int i=0;i<supplement.supp.length;i++){
      print(supplement.supp[i].detail);
      print(supplement.supp[i].price);
      print(supplement.supp[i].idProd);
    }
    print('that is all for Static List');
  }
void _printallList(){
  for (int i = 0; i < Category.setCategory.length; i++) {
    print(Category.setCategory[i].listProd.length.toString());
    for (int j = 0; j < Category.setCategory[i].listProd.length; j++) {
      print(Category.setCategory[i].listProd[j].name);
      for(int k=0;k<Category.setCategory[i].listProd[j].sous_categ.length;k++)
        print(Category.setCategory[i].listProd[j].sous_categ[k].detail);
      for(int k=0;k<Category.setCategory[i].listProd[j].supp.length;k++)
        print(Category.setCategory[i].listProd[j].supp[k].detail);

    }
  }
  }
}


