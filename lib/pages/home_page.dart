import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/providerclass.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Provider.of<ThemeProvider>(context, listen: false).changeTheme();
          },
          icon: Icon(
            Icons.sunny_snowing,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed("like_page");
              },
              icon: const Icon(
                Icons.favorite,
                color: Colors.redAccent,
              )),
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("cart_page");
                  },
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: Theme.of(context).iconTheme.color,
                  )),
              Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: CircleAvatar(
                  radius: 6,
                  backgroundColor: Colors.red,
                  child: Consumer<CounterProvider>(
                    builder: (context, counterProvider, _) => Text(
                      (counterProvider.cartProduct.isNotEmpty)
                          ? counterProvider.cartProduct.length.toString()
                          : "0",
                      style: const TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "What plant are you \n looking for?",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context).iconTheme.color),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).secondaryHeaderColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextField(
                    autofocus: false,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Name,difficulty,room,etc...",
                      hintStyle: TextStyle(color: Theme.of(context).hintColor),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Categories",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).iconTheme.color),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/1.png"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(60),
                            bottomLeft: Radius.circular(60)),
                      ),
                      alignment: Alignment.center,
                      child: const SizedBox(
                        width: 120,
                        child: Text(
                          "Easy indoor plants",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 150,
                      width: 150,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/2.png"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            bottomRight: Radius.circular(60)),
                      ),
                      alignment: Alignment.center,
                      child: const SizedBox(
                        width: 120,
                        child: Text(
                          "Animal friendly plants",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/3.png"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            bottomRight: Radius.circular(60)),
                      ),
                      alignment: Alignment.center,
                      child: const SizedBox(
                        width: 120,
                        child: Text(
                          "Popular plants",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 150,
                      width: 150,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/4.png"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(60),
                            bottomLeft: Radius.circular(60)),
                      ),
                      alignment: Alignment.center,
                      child: const SizedBox(
                        width: 120,
                        child: Text(
                          "Low light plants",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Highly Recommended",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).iconTheme.color),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: CounterProvider.counterProvider.myProduct
                    .map(
                      (e) => Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: Theme.of(context).iconTheme.color!),
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 120,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(e.img!),
                                fit: BoxFit.cover,
                              )),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  e.name!,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Theme.of(context).cardColor),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: 170,
                                  child: Text(
                                    e.description!,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "RS:- ${e.price}",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    const SizedBox(
                                      width: 25,
                                    ),
                                    Consumer<CounterProvider>(
                                      builder: (context, counterProvider, _) =>
                                          IconButton(
                                        onPressed: () {
                                          Provider.of<CounterProvider>(context,
                                                  listen: false)
                                              .like(
                                                  e: CounterProvider
                                                      .counterProvider.myProduct
                                                      .indexOf(e));
                                        },
                                        icon: (counterProvider
                                                .myProduct[CounterProvider
                                                    .counterProvider.myProduct
                                                    .indexOf(e)]
                                                .like!)
                                            ? const Icon(Icons.favorite)
                                            : const Icon(Icons.favorite_border),
                                        color: Colors.red,
                                      ),
                                    ),
                                    Consumer<CounterProvider>(
                                      builder: (context, counterProvider, _) =>
                                          IconButton(
                                        onPressed: () {
                                          Provider.of<CounterProvider>(context,
                                                  listen: false)
                                              .cart(
                                                  e: CounterProvider
                                                      .counterProvider.myProduct
                                                      .indexOf(e));
                                          Provider.of<CounterProvider>(context,
                                                  listen: false)
                                              .priceCounter();
                                          ((counterProvider
                                                  .myProduct[CounterProvider
                                                      .counterProvider.myProduct
                                                      .indexOf(e)]
                                                  .cart!)
                                              ? Provider.of<CounterProvider>(context, listen: false)
                                                  .increment(
                                                      e: CounterProvider
                                                          .counterProvider
                                                          .myProduct
                                                          .indexOf(e))
                                              : Provider.of<CounterProvider>(
                                                      context,
                                                      listen: false)
                                                  .decrement(
                                                      e: CounterProvider
                                                          .counterProvider
                                                          .myProduct
                                                          .indexOf(e)));
                                        },
                                        icon: (counterProvider
                                                .myProduct[CounterProvider
                                                    .counterProvider.myProduct
                                                    .indexOf(e)]
                                                .cart!)
                                            ? const Icon(
                                                Icons.remove_shopping_cart)
                                            : const Icon(
                                                Icons.shopping_cart_outlined),
                                        color: Theme.of(context).cardColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
