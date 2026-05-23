//superclass MenuItem
import 'dart:html_common';

class MenuItem {
  String _name;
  double _price;
  String _category;
//constructor
  MenuItem(this._name, this._price, this._category);
  //getters functions
  String get name {
    return _name;
  }

  double get price {
    return _price;
  }

  String get category {
    return _category;
  }

//setters functions
  void set name(String name) {
    _name = name;
  }

  void set price(double price) {
    _price = price;
  }

  void set category(String category) {
    _category = category;
  }

  void display() {
    print('Name: $_name');
    print('Price: \$$_price');
    print('Category: $_category');
  }
}
