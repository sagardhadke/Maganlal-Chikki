import 'package:maganlal_chikki/Exports/myExports.dart';
import 'package:maganlal_chikki/View/Screens/contact.dart';

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
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyHome()));
            },
          ),
          ListTile(
            leading: Icon(Icons.category_rounded),
            title: const Text("Category"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyCategory()));
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_basket_outlined),
            title: const Text("Products"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyProducts()));
            },
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: const Text("About Us"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyAbout()));
            },
          ),
          ListTile(
            leading: Icon(Icons.support_agent_sharp),
            title: const Text("Contact Us"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyContactUs()));
            },
          ),
        ],
      ),
    );
  }
}
