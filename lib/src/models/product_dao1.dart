import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart' as found;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'product.dart';

Iterable? i;
String? myResponseBody;

class ProductDAO extends StatefulWidget {
  @override
  _ProductDAOState createState() => _ProductDAOState();
}

class _ProductDAOState extends State<ProductDAO> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: fetchProducts(),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? Products(list: snapshot.data!)
            : Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  static Future<List<Product>> fetchProducts() async {
    var response; // =
    //await http.get("http://192.168.43.30:80/zando_art_web/get_products.php");
    myResponseBody = response.body;
    // Use the compute function to run parseProducts in a separate isolate
    return response; //found.compute(parseProducts, response.body);
  }

  // A function that converts a response body into a List<Photo>
  static List<Product> parseProducts(String responseBody) {
    final parsed = json.decode(myResponseBody!).cast<Map<String, dynamic>>();

    return parsed.map<Product>((json) => Product.fromJson(json)).toList();
  }

  static List<Product> loadProducts(Categories category) {
    var allProducts = parseProducts(myResponseBody!);

    if (category == Categories.Accueil) {
      return allProducts;
    } else {
      return allProducts.where((Product p) => p.category == category).toList();
    }
  }
}

/*


class ProductDA extends StatefulWidget {

  static Future<List<Product>> fetchProducts() async {
    final response =
    await http.get("http://192.168.43.30:80/zando_art_web/get_products.php");
    myResponseBody = response.body;
    // Use the compute function to run parseProducts in a separate isolate
    return found.compute(parseProducts, response.body);
  }

  // A function that converts a response body into a List<Photo>
  static List<Product> parseProducts(String responseBody) {
    final parsed = json.decode(myResponseBody).cast<Map<String, dynamic>>();

    return parsed.map<Product>((json) => Product.fromJson(json)).toList();
  }

  static List<Product> loadProducts(Category category) {
    var allProducts = parseProducts(myResponseBody);

    if (category == Category.Accueil) {
      return allProducts;
    } else {
      return allProducts.where((Product p) => p.category == category).toList();
    }
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }
}

 */

class Products extends StatelessWidget {
  final List<Product>? list;

  Products({Key? key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list!.length,
      itemBuilder: (context, index) {
        return Text("");
      },
    );
  }

  /*
  final List<Product> list;
  static Products prod;
  const Products({this.list});

  static Products _getInstance() {
    if(prod == null) {
      prod = Products();
    }
    return prod;
  }


  factory Products.fromJson(List<dynamic> parsedJson) {
    List<Product> prods = List<Product>();

    prods = parsedJson.map((i) => Product.fromJson(i)).toList();


    for(int i = 0; i < list.length; i++){
      prod = [
        Product(
            id: list[i]['id_product'],
            name: list[i]['name_prod'],
            description: list[i]['description_prod'],
            price: list[i]['price'],
            category: list[i]['category'],
            artistEmail: list[i]['artiste_email'],
            isFeatured: list[i]['is_featured']
        ),
      ];
    }


    return Products(
      list: prods,
    );
     */
}
