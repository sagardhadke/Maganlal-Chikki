import 'package:maganlal_chikki/Exports/myExports.dart';
import 'package:http/http.dart' as http;
import 'package:maganlal_chikki/View/Screens/allProducts.dart';

class MyCategory extends StatefulWidget {
  const MyCategory({super.key});

  @override
  State<MyCategory> createState() => _MyCategoryState();
}

class _MyCategoryState extends State<MyCategory> {
  List<Category>? ofCategory;

  var logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2, // Number of method calls to be displayed
      errorMethodCount: 8, // Number of method calls if stacktrace is provided
      lineLength: 120, // Width of the output
      colors: true, // Colorful log messages
      printEmojis: true, // Print an emoji for each log message
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
    ),
  );

  void getCategories() async {
    try {
      var categoriesApi = await http.get(Uri.parse(
          "https://appy.trycatchtech.com/v3/maganlalchikki/category_list"));
      if (categoriesApi.statusCode == 200) {
        ofCategory = Category.ofCategory(jsonDecode(categoriesApi.body));
        logger.d("Category API Response $ofCategory");
        setState(() {});
      } else {
        logger.e("Failed to Load Category API");
      }
    } catch (e) {
      logger.e("Error Failed ${e.toString()}");
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
        title: Text("Category"),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Color(0XFFF4F4F4),
      drawer: Uihelper.myDrawer(context),
      body: ofCategory == null
          ? Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : Column(
              children: [
                Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                        childAspectRatio: 1 / 1.10,
                      ),
                      itemCount: ofCategory!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyAllProducts(
                                          id: ofCategory![index].id!,
                                          titles: ofCategory![index].catName!,
                                        )));
                          },
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
                                      imageUrl: ofCategory![index].catImage!),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  ofCategory![index].catName!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                )
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
