import 'package:maganlal_chikki/Exports/myExports.dart';
import 'package:http/http.dart' as http;

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List<HomeImageGallery>? ofHomeImgGall;
  List<Category>? ofCategory;

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

  @override
  void initState() {
    imageGall();
    categoriesApi();
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
      body: Column(
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
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
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
                        Padding(
                        padding: EdgeInsets.all(10),
                        child: Uihelper.customCategories(
                            ofCategory![b].catImage!, ofCategory![b].catName!),
                                                )
                        
                      },
                    ],
                  ),
              ),
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
          )
        ],
      ),
    );
  }
}
