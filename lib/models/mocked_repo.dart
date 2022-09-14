import 'package:bloc_auth_demo/models/mocked_user.dart';
import 'package:bloc_auth_demo/models/product.dart';

class MockedRepo {
  final List<Product> products = [
    Product(name: 'product1', price: "10€", isAvailable: true),
    Product(name: 'product2', price: "20€", isAvailable: false),
    Product(name: 'product3', price: "30€", isAvailable: true),
  ];
  final List<User> users = [
    User(login: 'user1', password: 'pass1'),
    User(login: 'user2', password: 'pass2'),
    User(login: 'user3', password: 'pass3'),
  ];

  bool authorization(String login, String password) {
    for (final user in users) {
      if (user.login == login && user.password == password) {
        return true;
      }
    }
    return false;
  }

  List<Product> readProducts() {
    return products;
  }
}
