import 'package:maganlal_chikki/Exports/myExports.dart';
import 'package:http/http.dart' as http;

class MyAllProducts extends StatefulWidget {
  final String id;
  final String titles;
  const MyAllProducts({required this.id, required this.titles, super.key});

  @override
  State<MyAllProducts> createState() => _MyAllProductsState();
}

class _MyAllProductsState extends State<MyAllProducts> {
  List<Products>? ofProducts;

  void getAllProducts() async {
    try {
      var productsApi = await http.get(Uri.parse(
          "https://appy.trycatchtech.com/v3/maganlalchikki/product_list?category_id=${widget.id}"));
      if (productsApi.statusCode == 200) {
        ofProducts = Products.ofProducts(jsonDecode(productsApi.body));
        Uihelper.logger.i("All Products API Response");
        setState(() {});
      } else {
        Uihelper.logger.e("Failed to Load Product API");
      }
    } catch (e) {
      Uihelper.logger.e("Error ${e.toString()}");
    }
  }

  @override
  void initState() {
    super.initState();
    getAllProducts();
    Uihelper.logger
        .i("MyAllProducts initialized with category ID: ${widget.id}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titles),
        backgroundColor: Colors.orange,
      ),
      body: ofProducts == null
          ? Center(
              child: const CircularProgressIndicator.adaptive(),
            )
          : Column(
              children: [
                Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 5,
                          childAspectRatio: 1 / 1.40,
                          crossAxisSpacing: 5),
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      itemCount: ofProducts!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: Card(
                            elevation: 5,
                            color: Colors.white,
                            child: Column(
                              children: [
                                ClipOval(
                                  child: CachedNetworkImage(
                                      height: 150,
                                      width: double.infinity,
                                      fit: BoxFit.fill,
                                      imageUrl: ofProducts![index].images![0]),
                                ),
                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    ofProducts![index].title!,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '\₹${ofProducts![index].price}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
    );
  }
}
