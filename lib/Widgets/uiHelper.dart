import 'package:maganlal_chikki/Exports/myExports.dart';

class Uihelper {
  static Widget myDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiUN2ts0AQPmXrBUzO0RNmA6DZWh1fbD5DcA&s"),
          ListTile(
            leading: Icon(Icons.home),
            title: const Text("Home"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyDashboard()));
            },
          ),
          ListTile(
            leading: Icon(Icons.category_rounded),
            title: const Text("Category"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyCategory()));
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_basket_outlined),
            title: const Text("Products"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyProducts()));
            },
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: const Text("About Us"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyAbout()));
            },
          ),
          ListTile(
            leading: Icon(Icons.support_agent_sharp),
            title: const Text("Contact Us"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyContactUs()));
            },
          ),
        ],
      ),
    );
  }

  static customCategories(String imgUri, String text) {
    return Column(
      children: [
        Container(
            height: 85,
            width: 85,
            decoration: BoxDecoration(
                color: Colors.orange[300],
                borderRadius: BorderRadius.circular(100)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // CircularImage(source: imgUri),
                ClipOval(
                  child: Container(
                    height: 80,
                    width: 80,
                    child: CachedNetworkImage(imageUrl: imgUri),
                  ),
                )
              ],
            )),
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }

  static final Logger logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
    ),
  );
  
 
}
