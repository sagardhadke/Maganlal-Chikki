import 'package:maganlal_chikki/Exports/myExports.dart';

class MyContactUs extends StatefulWidget {
  const MyContactUs({super.key});

  @override
  State<MyContactUs> createState() => _MyContactUsState();
}

class _MyContactUsState extends State<MyContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        backgroundColor: Colors.white,
      ),
      drawer: Uihelper.myDrawer(context),
      backgroundColor: Color(0XFFF4F4F4),
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}