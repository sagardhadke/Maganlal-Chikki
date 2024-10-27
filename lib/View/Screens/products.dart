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
  int? selectedCategoryId;

  void getProducts(int categoryId) async {
    try {
      var productsApi = await http.get(Uri.parse(
          "https://appy.trycatchtech.com/v3/maganlalchikki/product_list?category_id=$categoryId"));

      if (productsApi.statusCode == 200) {
        ofProducts = Products.ofProducts(jsonDecode(productsApi.body));
        Uihelper.logger.d("Product API Response: $ofProducts");
        setState(() {});
      } else {
        Uihelper.logger.e("Failed to Load Product API");
      }
    } catch (e) {
      Uihelper.logger.e("Error to Fetching Products${e.toString()}");
    }
  }

  void getCategories() async {
    try {
      var categoriesApi = await http.get(Uri.parse(
          "https://appy.trycatchtech.com/v3/maganlalchikki/category_list"));
      if (categoriesApi.statusCode == 200) {
        ofCategories = Category.ofCategory(jsonDecode(categoriesApi.body));
        Uihelper.logger.d("Categories API Response ${ofCategories}");
        setState(() {
          if (ofCategories != null && ofCategories!.isNotEmpty) {
            selectedCategoryId = int.parse(ofCategories![0].id!);
            getProducts(selectedCategoryId!);
          }
        });
      } else {
        Uihelper.logger.e("Failed to Load Categories API");
      }
    } catch (e) {
      Uihelper.logger.e("Error to Fetching Categories: ${e.toString()}");
    }
  }

  @override
  void initState() {
    super.initState();
    getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        backgroundColor: Colors.white,
      ),
      drawer: Uihelper.myDrawer(context),
      backgroundColor: const Color(0XFFF4F4F4),
      body: Row(
        children: [
          Container(
            color: const Color(0XFFF9FAFB),
            width: MediaQuery.sizeOf(context).height / 07,
            child: ofCategories == null
                ? const Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                : ListView.builder(
                    itemCount: ofCategories!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategoryId =
                                int.parse(ofCategories![index].id!);
                            getProducts(selectedCategoryId!);
                          });
                        },
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
          ofProducts == null
              ? Center(
                  child: CircularProgressIndicator.adaptive(),
                )
              : Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio: 1 / 1.72
                      ,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    itemCount: ofProducts?.length ?? 0,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyProductsDetails(
                                      titles: ofProducts![index].title!,
                                      image: ofProducts![index].images![0],
                                      price: ofProducts![index].price!,
                                      small_description:
                                          ofProducts![index].smallDescription!,
                                      full_description: ofProducts![index]
                                          .fullDescription!)));
                        },
                        child: Container(
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
                                  imageUrl:
                                      ofProducts![index].images!.isNotEmpty
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
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
