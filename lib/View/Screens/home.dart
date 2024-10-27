import 'package:maganlal_chikki/Exports/myExports.dart';
import 'package:http/http.dart' as http;
import 'package:maganlal_chikki/View/Screens/allProducts.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List<HomeImageGallery>? ofHomeImgGall;
  List<Category>? ofCategory;
  List<Products>? ofProducts;

  void imageGall() async {
    try {
      var imgGallApi = await http.get(Uri.parse(
          "https://appy.trycatchtech.com/v3/maganlalchikki/home_image_gallery"));
      if (imgGallApi.statusCode == 200) {
        ofHomeImgGall =
            HomeImageGallery.ofHomeImageGall(jsonDecode(imgGallApi.body));
        print("Home Image Gallery API ${ofHomeImgGall}");
        setState(() {});
      }
    } catch (e) {
      print("Error ${e.toString()}");
    }
  }

  void categoriesApi() async {
    try {
      var categoryApi = await http.get(Uri.parse(
          "https://appy.trycatchtech.com/v3/maganlalchikki/category_list"));
      if (categoryApi.statusCode == 200) {
        ofCategory = Category.ofCategory(jsonDecode(categoryApi.body));
        print("Category API Response ${categoryApi}");
        setState(() {});
      }
    } catch (e) {
      print("Error ${e.toString()}");
    }
  }

  void namkeenApi() async {
    try {
      var namkeenRes = await http.get(Uri.parse(
          "https://appy.trycatchtech.com/v3/maganlalchikki/product_list?category_id=5"));
      if (namkeenRes.statusCode == 200) {
        ofProducts = Products.ofProducts(jsonDecode(namkeenRes.body));
        Uihelper.logger.d("Category API Response ${namkeenRes}");
        setState(() {});
      }
    } catch (e) {
      Uihelper.logger.e("Error ${e.toString()}");
    }
  }

  @override
  void initState() {
    imageGall();
    categoriesApi();
    namkeenApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          backgroundColor: Colors.white,
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.notifications_active_outlined),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.shopping_bag_outlined),
            )
          ],
        ),
        drawer: Uihelper.myDrawer(context),
        backgroundColor: Color(0XFFF4F4F4),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Search Anything...',
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(size: 30, Icons.search),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Categories",
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("View All >"),
                  ),
                ],
              ),
              ofCategory == null
                  ? Center(
                      child: CircularProgressIndicator.adaptive(),
                    )
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (int b = 0; b < ofCategory!.length; b++) ...{
                            GestureDetector(
                              onTap: () {
                                Uihelper.logger
                                    .d("Click ${ofCategory![b].id!}");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyAllProducts(
                                              id: ofCategory![b].id!,
                                              titles: ofCategory![b].catName!,
                                            )));
                              },
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Uihelper.customCategories(
                                    ofCategory![b].catImage!,
                                    ofCategory![b].catName!),
                              ),
                            )
                          },
                        ],
                      ),
                    ),
              SizedBox(height: 10),
              ImageSlideshow(
                children: ofHomeImgGall != null && ofHomeImgGall!.isNotEmpty
                    ? [
                        for (int i = 0; i < ofHomeImgGall!.length; i++) ...{
                          CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: ofHomeImgGall![i].image ?? ''),
                        },
                      ]
                    : [
                        Center(child: CircularProgressIndicator.adaptive()),
                      ],
                autoPlayInterval: 2500,
                isLoop: true,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Hot Selling Namkeens",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("View All >"),
                  ),
                ],
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 1 / 1.45,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                itemCount: ofProducts?.length ?? 0,
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

              
            ],
          ),
        ));
  }
}
