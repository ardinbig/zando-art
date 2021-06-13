import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:zando_art/src/models/app_state.dart';
import 'package:zando_art/src/models/product.dart';
import 'package:zando_art/src/constants/color.dart';

const _leftColumnWidth = 60.0;

class ShoppingCartTab extends StatefulWidget {
  @override
  _ShoppingCartTabState createState() => _ShoppingCartTabState();
}

class _ShoppingCartTabState extends State<ShoppingCartTab> {
  List<Widget> _createShoppingCartRows(AppState model) {
    return model.productsInCart.keys
        .map(
          (id) => ShoppingCartRow(
            product: model.getProductById(id),
            quantity: model.productsInCart[id],
            onPressed: () {
              model.removeItemFromCart(id);
            },
          ),
        )
        .toList();
  }

  Widget build(BuildContext context) {
    final localTheme = Theme.of(context);

    return Scaffold(
      backgroundColor: ZandoBGColor,
      body: SafeArea(
        child: Container(
          child: Consumer<AppState>(
            builder: (context, model, child) {
              return Stack(
                children: [
                  ListView(
                    children: [
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Row(
                              children: <Widget>[
                                Text('Pannier'),
                                Text('  ${model.totalCartQuantity} Pièces'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: _createShoppingCartRows(model),
                      ),
                      ShoppingCartSummary(model: model),
                      const SizedBox(height: 100.0),
                    ],
                  ),
                  Positioned(
                    bottom: 16.0,
                    left: 16.0,
                    right: 16.0,
                    child: Column(
                      children: <Widget>[
                        RaisedButton(
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(7.0)),
                          ),
                          color: ZandoMainColor,
                          splashColor: ZandoBGColor,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.0),
                            child: Text(
                              'Vider le pannier',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          onPressed: () {
                            model.clearCart();
                          },
                        ),
                        RaisedButton(
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(7.0)),
                          ),
                          color: ZandoSecondaryColor,
                          splashColor: ZandoBGColor,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.0),
                            child: Text(
                              'Acheter',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          onPressed: () {
                            // Fluttertoast.showToast(msg: '${model.totalCost}');
                            //// TODO: Ajouter la fonction de la vente ici
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  /*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _zando_home(),
    );
  }
  */

  // Retourne les données de la base des données via une page php
  Future<List> getData() async {
    var response; // = await http.get("http://192.168.43.30:80/zando_art_web/get_data.php");
    // final response = await http.get("http://localhost/getData.php");
    return json.decode(response.body);
  }

  FutureBuilder<List> _zando_home() => FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ItemList(list: snapshot.data)
              : Center(
                  child: CircularProgressIndicator(
                  backgroundColor: Colors.brown,
                ));
        },
      );
}

class ItemList extends StatelessWidget {
  final List? list;
  const ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list!.length,
      itemBuilder: (context, i) {
        return Container(
          padding: EdgeInsets.all(6.0),
          child: Card(
            child: ListTile(
              title: Text(list![i]['firstname']),
              leading: Icon(Icons.widgets),
              subtitle: Text("Email : ${list![i]["email"]}"),
            ),
          ),
        );
      },
    );
  }
}

class ShoppingCartSummary extends StatelessWidget {
  ShoppingCartSummary({this.model});

  final AppState? model;

  @override
  Widget build(BuildContext context) {
    final largeAmountStyle = Theme.of(context).textTheme.display1;
    final formatter = NumberFormat.simpleCurrency(
        decimalDigits: 2, locale: Localizations.localeOf(context).toString());

    return Row(
      children: [
        SizedBox(width: _leftColumnWidth),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: Text('TOTAL'),
                    ),
                    Text(
                      formatter.format(model!.totalCost),
                      style: largeAmountStyle,
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    const Expanded(
                      child: Text('Sous total:'),
                    ),
                    Text(
                      formatter.format(model!.subtotalCost),
                    ),
                  ],
                ),
                const SizedBox(height: 4.0),
                Row(
                  children: [
                    const Expanded(
                      child: Text('Autres Frais:'),
                    ),
                    Text(formatter.format(model!.shippingCost)),
                  ],
                ),
                const SizedBox(height: 4.0),
                Row(
                  children: [
                    const Expanded(
                      child: Text('TVA:'),
                    ),
                    Text(
                      formatter.format(model!.tax),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ShoppingCartRow extends StatelessWidget {
  ShoppingCartRow(
      {@required this.product, @required this.quantity, this.onPressed});

  final Product? product;
  final int? quantity;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.simpleCurrency(
        decimalDigits: 0, locale: Localizations.localeOf(context).toString());
    final localTheme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        key: ValueKey(product!.id),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: _leftColumnWidth,
            child: IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              onPressed: onPressed,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        product!.assetName,
                        package: product!.assetPackage,
                        fit: BoxFit.cover,
                        width: 75.0,
                        height: 75.0,
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text('Quantité: $quantity'),
                                ),
                                Text('x ${formatter.format(product!.price)}'),
                              ],
                            ),
                            Text(product!.name!),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  const Divider(
                    color: ZandoMainColor,
                    height: 10.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
