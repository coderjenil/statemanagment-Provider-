import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/providerclass.dart';

class LikePage extends StatefulWidget {
  const LikePage({Key? key}) : super(key: key);

  @override
  State<LikePage> createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Consumer<CounterProvider>(
            builder: (context, counterProvider, _) {
              return Column(
                children: counterProvider.likeProduct
                    .map((e) => Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: Theme.of(context).iconTheme.color!),
                            color: Colors.white,
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
                                        width: 50,
                                      ),
                                      Consumer<CounterProvider>(
                                        builder:
                                            (context, counterProvider, _) =>
                                                IconButton(
                                          onPressed: () {
                                            Provider.of<CounterProvider>(
                                                    context,
                                                    listen: false)
                                                .likeRemove(
                                                    e: counterProvider
                                                        .likeProduct
                                                        .indexOf(e));
                                          },
                                          icon: (counterProvider
                                                  .likeProduct[counterProvider
                                                      .likeProduct
                                                      .indexOf(e)]
                                                  .like!)
                                              ? const Icon(Icons.favorite)
                                              : const Icon(
                                                  Icons.favorite_border),
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ))
                    .toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}
