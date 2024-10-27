import 'package:maganlal_chikki/Exports/myExports.dart';
import 'package:http/http.dart' as http;

class MyProducts extends StatefulWidget {
  const MyProducts({super.key});

  @override
  State<MyProducts> createState() => _MyProductsState();
}

class _MyProductsState extends State<MyProducts> {
  List<Products>? ofProducts;
  List<Category>? ofCategories;
  var logger = Logger();

  void getProducts() async {
    try {
      var productsApi = await http.get(Uri.parse(
          "https://appy.trycatchtech.com/v3/maganlalchikki/product_list?category_id=1"));
      ofProducts = Products.ofProducts(jsonDecode(productsApi.body));
      print("Product API Response");
      setState(() {});
    } catch (e) {
      print("Error ${e.toString()}");
    }
  }

  void getCategories() async {
    try {
      var categoriesApi = await http.get(Uri.parse(
          "https://appy.trycatchtech.com/v3/maganlalchikki/category_list"));
      ofCategories = Category.ofCategory(jsonDecode(categoriesApi.body));
      print("Categories API Response ${ofCategories}");
      setState(() {});
    } catch (e) {
      print("Error ${e.toString()}");
    }
  }

  @override
  void initState() {
    getProducts();
    getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        backgroundColor: Colors.white,
      ),
      drawer: Uihelper.myDrawer(context),
      backgroundColor: Color(0XFFF4F4F4),
      body: Row(
        children: [
          Container(
            color: Color(0XFFF9FAFB),
            width: MediaQuery.sizeOf(context).height / 07,
            child: ofCategories == null
                ? Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                : ListView.builder(
                    itemCount: ofCategories!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Uihelper.customCategories(
                            ofCategories![index].catImage!,
                            ofCategories![index].catName!,
                          ),
                        ),
                      );
                    }),
          ),

          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: 1 / 1.62,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              itemCount: ofProducts!.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl: ofProducts![index].images!.isNotEmpty
                              ? ofProducts![index].images![0]
                              : '',
                          width: double.infinity,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        ofProducts![index].title!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '\₹${ofProducts![index].price}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Expanded(
          //   child: ofProducts == null
          //       ? const Center(child: CircularProgressIndicator())
          //       : GridView.builder(
          //           gridDelegate:
          //               const SliverGridDelegateWithFixedCrossAxisCount(
          //             crossAxisCount: 2,
          //             mainAxisSpacing: 15,
          //             crossAxisSpacing: 15,
          //           ),
          //           itemCount: ofProducts!.length,
          //           itemBuilder: (context, index) {
          //             return Container(
          //               padding: const EdgeInsets.all(15),
          //               decoration: BoxDecoration(
          //                 color: Colors.amber[500],
          //                 borderRadius: BorderRadius.circular(15),
          //               ),
          //               child: Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   ClipRRect(
          //                     borderRadius: BorderRadius.circular(10),
          //                     child: CachedNetworkImage(
          //                       imageUrl: ofProducts![index].images!.isNotEmpty
          //                           ? ofProducts![index].images![0]
          //                           : '',
          //                       width: double.infinity,
          //                       fit: BoxFit.contain,
          //                     ),
          //                   ),
          //                   const SizedBox(height: 10),
          //                   Text(
          //                     ofProducts![index].title!,
          //                     style: const TextStyle(
          //                       fontWeight: FontWeight.bold,
          //                       fontSize: 16,
          //                     ),
          //                   ),
          //                   const SizedBox(height: 5),
          //                   Text(
          //                     '\$${ofProducts![index].price}',
          //                     style: const TextStyle(
          //                       color: Colors.green,
          //                       fontWeight: FontWeight.bold,
          //                       fontSize: 14,
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             );
          //           },
          //         ),
          // )
        ],
      ),
    );
  }
}
