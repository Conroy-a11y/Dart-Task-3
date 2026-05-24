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

//method to display item details
  void displayItem() {
    print('Name: $_name');
    print('Price: \R$_price');
    print('Category: $_category');
  }
}

//subclass Food
class Food extends MenuItem {
  String _portionSize;
  Food(String name, double price, String portionSize)
      : _portionSize = portionSize,
        super(name, price, 'Food');
}

//overriding the displayItem method to include portion size
@override
void displayItem() {
  print('Name: $name');
  print('Price: \R$price');
  print('Category: $category');
  print('Portion Size: $_portionSize');
}
//subclass Drink

class Drink extends MenuItem {
  String _size;
  bool _isCold;
  Drink(
    String name,
    double price,
    String size,
  )   : _size = size,
        _isCold = isCold,
        super(name, price, 'Drink');
}
//overriding the displayItem method to include size and temperature
@override
void displayItem(){

  String? temperature;
  if(temperature == _isCold){
    temperature = 'Cold';
}else{
  temperature = 'Hot';
}
  print('Name: $name');
  print('Price: \R$price');
  print('Category: $category');
  print('Size: $_size');
  print('Temperature: $temperature');
}

// Class: Order
class Order {
  String _customerName;
  List<MenuItem> _items = [];
  double _total = 0;

  Order(this._customerName);

  // Getters
  String get customerName => _customerName;
  List<MenuItem> get items => _items;
  double get total => _total;