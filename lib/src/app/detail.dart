import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:zando_art/src/models/app_state.dart';
import '../supplementals/colors.dart';

List<int> _internalList;
_ListModel _list = _ListModel();

class Detail extends StatefulWidget {
  final List list;
  final int index;
  Detail({this.index, this.list});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Détail -  ${widget.list[widget.index]["name_prod"]}"),
        backgroundColor: ZandoMainColor,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Card(
          color: ZandoBGColor,
          child: Column(
            children: <Widget>[
              SizedBox(height: 8,),
              Image.network(
                'http://192.168.43.30:80/zando_art_web/uploads/${widget.list[widget.index]["main_image"]}',
                height: 300,
                fit: BoxFit.fitHeight,
              ),

              Text(
                "${widget.list[widget.index]["name_prod"]}",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 14,),

              Text(
                "${widget.list[widget.index]["description_prod"]}",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.normal, fontStyle: FontStyle.italic),
              ),

              SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    "Categorie : ${widget.list[widget.index]["category"]}",
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal),
                  ),
                  Text(
                    "Prix : ${widget.list[widget.index]["price"]} \$",
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: ZandoMainColor),
                  ),
                ],
              ),

              Padding(padding: EdgeInsets.only(top: 30.0),),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        child: Text("Ajouter au pannier"),
                        color: ZandoSecondaryColor,
                        onPressed: () {
                          _updateLists();
                        },
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updateLists() {
    // Update _internalList based on the model
    _internalList = ScopedModel.of<AppState>(context).productsInCart.keys.toList();
    Set<int> internalSet = Set<int>.from(_internalList);
    Set<int> listSet = Set<int>.from(_list.list);

    Set<int> difference = internalSet.difference(listSet);
    if (difference.isEmpty) {
      return;
    }

    difference.forEach((product) {
      if (_internalList.length < _list.length) {
        _list.remove(product);
      } else if (_internalList.length > _list.length) {
        _list.add(product);
      }
    });

    while (_internalList.length != _list.length) {
      int index = 0;
      // Check bounds and that the list elements are the same
      while (_internalList.isNotEmpty &&
          _list.length > 0 &&
          index < _internalList.length &&
          index < _list.length &&
          _internalList[index] == _list[index]) {
        index++;
      }
    }
  }
}

class _ListModel {
  _ListModel(
      {@required this.listKey,
        @required this.removedItemBuilder,
        Iterable<int> initialItems})
      : assert(listKey != null),
        assert(removedItemBuilder != null),
        _items = List<int>.from(initialItems ?? <int>[]);

  final GlobalKey<AnimatedListState> listKey;
  final dynamic removedItemBuilder;
  final List<int> _items;

  AnimatedListState get _animatedList => listKey.currentState;

  void add(int product) {
    _insert(_items.length, product);
  }

  void _insert(int index, int item) {
    _items.insert(index, item);
    _animatedList.insertItem(index, duration: Duration(milliseconds: 225));
  }

  void remove(int product) {
    final int index = _items.indexOf(product);
    if (index >= 0) {
      _removeAt(index);
    }
  }

  void _removeAt(int index) {
    final int removedItem = _items.removeAt(index);
    if (removedItem != null) {
      _animatedList.removeItem(index, (BuildContext context, Animation<double> animation) {
        return removedItemBuilder(removedItem, context, animation);
      });
    }
  }

  int get length => _items.length;

  int operator [](int index) => _items[index];

  int indexOf(int item) => _items.indexOf(item);

  List<int> get list => _items;
}
