import 'package:flutter/material.dart';
import 'package:market_app_ui/pages/product_model.dart';

class HomePage2 extends StatefulWidget {
  static const String id = "home_page_2";

  const HomePage2({Key? key}) : super(key: key);

  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  int _selectedIndex = 0;
  List<String> categories = ["All", "Red", "Blue", "Green", "Grey", "Yellow"];

  List<Product> products = [
    Product(
        name: "PDP Car",
        type: "Electric",
        cost: "100\$",
        image: "assets/images/im_car0.jpg",
        category: "Red"),
    Product(
        name: "PDP Car",
        type: "Electric",
        cost: "100\$",
        image: "assets/images/im_car1.jpg",
        category: "Blue"),
    Product(
        name: "PDP Car",
        type: "Electric",
        cost: "100\$",
        image: "assets/images/im_car2.jpg",
        category: "Yellow"),
    Product(
        name: "PDP Car",
        type: "Electric",
        cost: "100\$",
        image: "assets/images/im_car3.jpg",
        category: "Grey"),
    Product(
        name: "PDP Car",
        type: "Electric",
        cost: "100\$",
        image: "assets/images/im_car4.jpg",
        category: "Green"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Cars",
          style: TextStyle(color: Color.fromRGBO(245, 67, 53, 1), fontSize: 25),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none,
                color: Color.fromRGBO(245, 67, 53, 1),
              )),
          const SizedBox(
            width: 15,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
              color: Color.fromRGBO(245, 67, 53, 1),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // #categories
            SizedBox(
              height: 40,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return _categories(index);
                  }),
            ),

            // #products
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return _productItem(index);
                })
          ],
        ),
      ),
    );
  }

  Card _productItem(int index) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        height: 240,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: AssetImage(products[index].image), fit: BoxFit.cover)),
        child: Container(
          padding: const EdgeInsets.only(left: 15, bottom: 15, top: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                colors: [
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(0.3),
                  Colors.black.withOpacity(0.1),
                ],
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        products[index].name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        products[index].cost,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(width: 15),
                  Text(
                    products[index].type,
                    style: const TextStyle(
                        color: Color.fromRGBO(245, 67, 53, 1),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              MaterialButton(
                minWidth: 35,
                height: 35,
                padding: EdgeInsets.zero,
                shape: const CircleBorder(),
                onPressed: () {
                  setState(() {
                    products[index].isLike = !products[index].isLike;
                  });
                },
                child: !products[index].isLike
                    ? const Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      )
                    : const Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ),
                color: const Color.fromRGBO(245, 67, 53, 1),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container _categories(int index) {
    return Container(
      padding: index != categories.length - 1
          ? const EdgeInsets.only(left: 10)
          : const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: MaterialButton(
        elevation: 0,
        color: (_selectedIndex != index)
            ? Colors.white
            : const Color.fromRGBO(245, 67, 53, 1),
        shape: const StadiumBorder(),
        onPressed: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        child: Text(
          categories[index],
          style: TextStyle(
              fontSize: 16,
              color: _selectedIndex == index ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
