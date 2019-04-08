import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' as found;
import 'package:http/http.dart' as http;
import 'product.dart';

List<Product> myProducts = [];

class ProductDAO extends StatefulWidget {
  @override
  ProductDAOState createState() => ProductDAOState();


}

class ProductDAOState extends State<ProductDAO> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void initState() {
    fetchProducts();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  static List<Product> loadProducts(Category category) {
    final allProducts = myProducts;

    if (category == Category.Accueil) {
      return allProducts;
    } else {
      return allProducts.where((Product p) => p.category == category).toList();
    }
  }

  Future<List<Product>> fetchProducts() async {
    var response = await http.get("http://192.168.43.30:80/zando_art_web/get_products.php");
    List<Map> list = json.decode(response.body);

    for (int i = 0; i < list.length; i++) {
      Product produit = new Product(
        id: list[i]['id_product'],
        name: list[i]['name_prod'],
        description: list[i]['description_prod'],
        artistEmail: list[i]['artist_email'],
        price: list[i]['price'],
        category: list[i]['category'],
        isFeatured: list[i]['is_featured'],
        image: list[i]['main_image'],
      );

      myProducts.add(produit);
    }
    return myProducts;
  }

  /*
  static Map<List<Product>> fetchProducts() async {
    final response =
      await http.get("http://192.168.43.30:80/zando_art_web/get_products.php");
    // Use the compute function to run parseProducts in a separate isolate
    return found.
    return found.compute(parseProducts, response.body);
  }

  Future fetchProductsTwo() async {
    final response =
    await http.get("http://192.168.43.30:80/zando_art_web/get_products.php");
    // Use the compute function to run parseProducts in a separate isolate
    var result = json.decode(response.body);

    if (result.length == 0) {

    } else {
      setState(() {
        for(int i = 0; i <= result.length; i++) {
          allProducts = <Product> [
            Product(
              id: int.parse(result[i]['id_produit']),
              name: result[i]['name_prod'],
              description: result[i]['description_prod'],
              price: double.parse(result[i]['price']),
              category: result[i]['category'],
              artistEmail: result[i]['artiste_email'],
              isFeatured: result[i]['is_featured'],

            ),
          ];
        }
      });
    }
  }

  */

  // A function that converts a response body into a List<Products>
  static List<Product> parseProducts(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Product>((json) => Product.fromJson(json)).toList();
  }
}


