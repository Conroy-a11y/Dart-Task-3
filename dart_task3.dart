import 'dart:io';

// Main Function
void main() {
  // Preset Food Menu
  Food burger = Food('Beef Burger', 85, 'large');
  Food pasta = Food('Chicken Pasta', 95, 'medium');
  Food pizza = Food('Cheese Pizza', 120, 'large');

  // Preset Drink Menu
  Drink cola = Drink('Cola', 25, 'small', true);
  Drink coffee = Drink('Coffee', 30, 'medium', false);
  Drink milkshake = Drink('Vanilla Milkshake', 45, 'large', true);

  // Create one order object
  Order currentOrder = Order('Customer');

  bool running = true;

  // Main menu loop
  while (running) {
    print('\n====== RESTAURANT MENU SYSTEM ======');
    print('1. View Menu');
    print('2. Add Item to Order');
    print('3. Remove Item from Order');
    print('4. Print Bill');
    print('5. Exit');
    print('====================================');

    print('Enter your choice: ');
    String? choice = stdin.readLineSync();

    // ==========================
    // Option 1: View Menu
    // ==========================
    if (choice == '1') {
      print('\n====== AVAILABLE MENU ITEMS ======');

      print('\n1.');
      burger.displayItem();

      print('2.');
      pasta.displayItem();

      print('3.');
      pizza.displayItem();

      print('4.');
      cola.displayItem();

      print('5.');
      coffee.displayItem();

      print('6.');
      milkshake.displayItem();
    }

    // ==========================
    // Option 2: Add Item
    // ==========================
    else if (choice == '2') {
      print('\nChoose an item to add:');

      print('1. Beef Burger');
      print('2. Chicken Pasta');
      print('3. Cheese Pizza');
      print('4. Cola');
      print('5. Coffee');
      print('6. Vanilla Milkshake');

      print('Enter item number: ');
      String? itemChoice = stdin.readLineSync();

      if (itemChoice == '1') {
        currentOrder.addItem(burger);
      } else if (itemChoice == '2') {
        currentOrder.addItem(pasta);
      } else if (itemChoice == '3') {
        currentOrder.addItem(pizza);
      } else if (itemChoice == '4') {
        currentOrder.addItem(cola);
      } else if (itemChoice == '5') {
        currentOrder.addItem(coffee);
      } else if (itemChoice == '6') {
        currentOrder.addItem(milkshake);
      } else {
        print('Invalid menu choice.');
      }
    }

    // ==========================
    // Option 3: Remove Item
    // ==========================
    else if (choice == '3') {
      print('Enter the item name to remove: ');
      String? itemName = stdin.readLineSync();

      if (itemName != null && itemName.isNotEmpty) {
        currentOrder.removeItem(itemName);
      } else {
        print('Invalid item name.');
      }
    }

    // ==========================
    // Option 4: Print Bill
    // ==========================
    else if (choice == '4') {
      currentOrder.printBill();
    }

    // ==========================
    // Option 5: Exit
    // ==========================
    else if (choice == '5') {
      running = false;
      print('Thank you for using the Restaurant Ordering System!');
    }

    // ==========================
    // Invalid Input
    // ==========================
    else {
      print('Invalid choice. Please try again.');
    }
  }
}

// Super Class: MenuItem

class MenuItem {
  // Private fields
  String _name;
  double _price;
  String _category;

  // Constructor
  MenuItem(this._name, this._price, this._category);

  // Getters
  String get name => _name;
  double get price => _price;
  String get category => _category;

  // Method to display menu item details
  void displayItem() {
    print('Name: $_name');
    print('Category: $_category');
    print('Price: R$_price');
  }
}

// Subclass: Food

class Food extends MenuItem {
  // Private field
  String _portionSize;

  // Constructor
  Food(String name, double price, String portionSize)
      : _portionSize = portionSize,
        super(name, price, 'Food');

  // Getter
  String get portionSize => _portionSize;

  // Override displayItem method
  @override
  void displayItem() {
    print('Name: $name');
    print('Category: $category');
    print('Portion Size: $_portionSize');
    print('Price: R$price');
    print('-------------------------');
  }
}

// Subclass: Drink

class Drink extends MenuItem {
  // Private fields
  String _size;
  bool _isCold;

  // Constructor
  Drink(String name, double price, String size, bool isCold)
      : _size = size,
        _isCold = isCold,
        super(name, price, 'Drink');

  // Getters
  String get size => _size;
  bool get isCold => _isCold;

  // Override displayItem method
  @override
  void displayItem() {
    print('Name: $name');
    print('Category: $category');
    print('Size: $_size');

    if (_isCold) {
      print('Temperature: Cold');
    } else {
      print('Temperature: Hot');
    }

    print('Price: \R$price');
    print('-------------------------');
  }
}

// Class: Order
class Order {
  // Private fields
  String _customerName;
  List<MenuItem> _items = [];
  double _total = 0;

  // Constructor
  Order(this._customerName);

  // Getters
  String get customerName => _customerName;
  List<MenuItem> get items => _items;
  double get total => _total;

  // Method to add item to order
  void addItem(MenuItem item) {
    _items.add(item);
    _total += item.price;

    print('${item.name} added successfully!');
  }

  // Method to remove item from order
  void removeItem(String name) {
    bool found = false;

    for (int i = 0; i < _items.length; i++) {
      if (_items[i].name.toLowerCase() == name.toLowerCase()) {
        _total -= _items[i].price;

        print('${_items[i].name} removed successfully!');

        _items.removeAt(i);

        found = true;
        break;
      }
    }

    if (!found) {
      print('Error: Item not found in the order.');
    }
  }

  // Method to print final bill
  void printBill() {
    print('\n========== FINAL BILL ==========');
    print('Customer Name: $_customerName');
    print('--------------------------------');

    if (_items.isEmpty) {
      print('No items in the order.');
    } else {
      for (MenuItem item in _items) {
        item.displayItem();
      }

      print('TOTAL AMOUNT DUE: \R$_total');
    }

    print('================================\n');

    // Reset order for next customer
    _items.clear();
    _total = 0;

    print('Order has been reset for the next customer.');
  }
}
