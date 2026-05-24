import 'dart:io';

void main() {
  Food pasta = Food('Pasta Alfredo', 1800, 'medium');
  Food burger = Food('Cheese Burger', 1500, 'large');
  Food salad = Food('Greek Salad', 1200, 'small');
  Drink coldSprite = Drink('Sprite', 600, 'small', true);
  Drink hotCoffee = Drink('Coffee', 800, 'medium', false);
  Drink coldSmoothie = Drink('Mango Smoothie', 1000, 'large', true);
  List<MenuItem> menu = [
    pasta,
    burger,
    salad,
    coldSprite,
    hotCoffee,
    coldSmoothie
  ];
}

//superclass MenuItem
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

  @override
  void displayItem() {
    print('Name: $name');
    print('Price: \R$price');
    print('Category: $category');
    print('Portion Size: $_portionSize');
  }
}

//overriding the displayItem method to include portion size

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
//overriding the displayItem method to include size and temperature
  @override
  void displayItem() {
    String? temperature;
    if (temperature == _isCold) {
      temperature = 'Cold';
    } else {
      temperature = 'Hot';
    }
    print('Name: $name');
    print('Price: \R$price');
    print('Category: $category');
    print('Size: $_size');
    print('Temperature: $temperature');
  }
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

  // Add item
  void addItem(MenuItem item) {
    _items.add(item);
    _total = _total + item.price;
    print('${item.name} added to order.');
  }

  // Remove Item Method
  void removeItem(String name) {
    bool found = false;
    for (int i = 0; i < _items.length; i++) {
      if (_items[i].name.toLowerCase() == name.toLowerCase()) {
        _total -= _items[i].price;
        print('${_items[i].name} removed from order.');
        _items.removeAt(i);
        found = true;
        break;
      }
    }
    if (!found) {
      print('Error: Item "$name" not found in order.');
    }
  }

  // Print Bill Method
  void printBill() {
    print('\n--- Bill for $customerName ---');
    for (var item in _items) {
      item.displayItem();
    }
    print('Total: $_total');
    print('-----------------------------\n');
    _items.clear();
    _total = 0;
  }
}
