import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/detail_class.dart';

class CounterProvider extends ChangeNotifier {
  CounterProvider();
  static final CounterProvider counterProvider = CounterProvider();
  int val = 0;

  List<Detail> myProduct = [
    Detail(
      img: "images/i1.png",
      name: "CREEPERS plant",
      price: 500,
      like: false,
      cart: false,
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      count: 1,
    ),
    Detail(
      img: "images/i2.png",
      name: "WILD plant",
      price: 300,
      like: false,
      cart: false,
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      count: 1,
    ),
    Detail(
      img: "images/i3.png",
      name: "THISTLE plant",
      price: 200,
      like: false,
      cart: false,
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      count: 1,
    ),
    Detail(
      img: "images/i4.png",
      name: "CLIMBERS plant",
      price: 150,
      like: false,
      cart: false,
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      count: 1,
    ),
    Detail(
      img: "images/i5.png",
      name: "SHRUBS plant",
      price: 350,
      like: false,
      cart: false,
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      count: 1,
    ),
    Detail(
      img: "images/i6.png",
      name: "HERBS plant",
      price: 450,
      like: false,
      cart: false,
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      count: 1,
    ),
  ];
  List<Detail> likeProduct = [];
  List<Detail> cartProduct = [];

  void like({required int e}) {
    myProduct[e].like = !myProduct[e].like!;
    (myProduct[e].like == true)
        ? likeProduct.add(myProduct[e])
        : likeProduct.remove(myProduct[e]);
    notifyListeners();
  }

  void cart({required int e}) {
    myProduct[e].cart = !myProduct[e].cart!;
    (myProduct[e].cart == true)
        ? cartProduct.add(myProduct[e])
        : cartProduct.remove(myProduct[e]);
    notifyListeners();
  }

  void likeRemove({required int e}) {
    likeProduct[e].like = !likeProduct[e].like!;
    (likeProduct[e].like == false) ? likeProduct.remove(likeProduct[e]) : null;
    notifyListeners();
  }

  void cartRemove({required int e}) {
    cartProduct[e].cart = !cartProduct[e].cart!;
    (cartProduct[e].cart == false) ? cartProduct.remove(cartProduct[e]) : null;
    notifyListeners();
  }

  void increment({required int e}) {
    cartProduct[e].count += 1;
    notifyListeners();
  }

  void decrement({required int e}) {
    if (cartProduct[e].count > 1) {
      cartProduct[e].count -= 1;
      notifyListeners();
    }
  }

  void priceCounter() {
    val = 0;
    for (int i = 0; i <= cartProduct.length; i++) {
      if (cartProduct[i].count <= 1) {
        val += cartProduct[i].price;
      } else {
        val += (cartProduct[i].price * cartProduct[i].count);
      }
    }
    notifyListeners();
  }
}

class ThemeProvider extends ChangeNotifier {
  bool isDark = false;

  ThemeProvider() {
    value();
  }
  void value() async {
    final prefs = await SharedPreferences.getInstance();

    isDark = prefs.getBool('isDark') ?? false;
  }

  changeTheme() async {
    final prefs = await SharedPreferences.getInstance();
    isDark = !isDark;
    await prefs.setBool('isDark', isDark);
    notifyListeners();
  }
}
