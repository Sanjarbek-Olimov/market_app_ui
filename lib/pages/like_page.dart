import 'package:flutter/material.dart';
import 'package:market_app_ui/pages/product_model.dart';

class LikePage extends StatefulWidget {
  static const String id = "like_page";
  List<Product>? likedItems = [];

  LikePage({Key? key, this.likedItems}) : super(key: key);

  @override
  _LikePageState createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Favourite cars",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: WillPopScope(
        onWillPop: ()async{
          Navigator.of(context).pop(widget.likedItems);
          return false;
        },
        child: widget.likedItems!.isEmpty
            ? const Center(
                child: Text(
                  "There is not any favourite cars",
                  style: TextStyle(fontSize: 20),
                ),
              )
            : ListView.builder(
                itemCount: widget.likedItems!.length,
                itemBuilder: (context, index) {
                  return _productItem(index);
                }),
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
                image: AssetImage(widget.likedItems![index].image),
                fit: BoxFit.cover)),
        child: Container(
          padding:
              const EdgeInsets.only(left: 20, bottom: 20, top: 15, right: 10),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.likedItems![index].name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.likedItems![index].type,
                        style: const TextStyle(
                            color: Colors.white,
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
                        widget.likedItems!.removeAt(index);
                      });
                    },
                    child: const Icon(
                      Icons.delete_outline,
                    ),
                    color: Colors.white,
                  )
                ],
              ),
              Text(
                widget.likedItems![index].cost,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
