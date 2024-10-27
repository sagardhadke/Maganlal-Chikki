import 'package:flutter/material.dart';
import 'package:maganlal_chikki/Exports/myExports.dart';

class MyProductsDetails extends StatefulWidget {
  final String titles;
  final String image;
  final String price;
  final String small_description;
  final String full_description;
  const MyProductsDetails(
      {required this.titles,
      required this.image,
      required this.price,
      required this.small_description,
      required this.full_description,
      super.key});

  @override
  State<MyProductsDetails> createState() => _MyProductsDetailsState();
}

class _MyProductsDetailsState extends State<MyProductsDetails> {
  @override
  void initState() {
    super.initState();
    print(widget.titles);
    print(widget.image);
    print(widget.price);
    print(widget.small_description);
    print(widget.full_description);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.titles,
          overflow: TextOverflow.ellipsis,
        ),
        backgroundColor: Colors.white,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.favorite_border_sharp),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.share_outlined),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      backgroundColor: Color(0XFFF8F8F9),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
                width: double.infinity,
                fit: BoxFit.contain,
                imageUrl: widget.image),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.titles,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(widget.small_description),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Text(
                "\₹${widget.price}",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                color: Colors.white,
                height: 240,
                width: double.infinity,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(top: 10, left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Deliver to",
                              style: TextStyle(fontSize: 15),
                            ),
                            Text(
                              "Mumbai (Bandra East)- 400051",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ],
                        )),
                    ListTile(
                      leading: Icon(Icons.delivery_dining_sharp),
                      title: Text(
                        "Get it by Sun, Oct 27",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.money_rounded),
                      title: Text("COD Available",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    ),
                    ListTile(
                      leading: Icon(Icons.replay_circle_filled_outlined),
                      title: Text("30 Days Exchange / Return Available",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                widget.full_description,
                style: TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15, left: 5),
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width / 2.1,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0XFFFFFFFFF),
                            side:
                                BorderSide(width: 2, color: Color(0XFFE25C4A))),
                        onPressed: () {},
                        child: Text("Add to Cart",
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    color: Color(0XFFE25C4A),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold)))),
                  ),
                  SizedBox(width: 10),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width / 2.1,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0XFFE25C4A)),
                        onPressed: () {},
                        child: Text(
                          "Buy Now",
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold)),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
