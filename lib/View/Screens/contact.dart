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
        title: const Text("Contact Us"),
        backgroundColor: Colors.white,
      ),
      drawer: Uihelper.myDrawer(context),
      backgroundColor: const Color(0XFFF4F4F4),
      body: const Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Maganlal Chikki Products Pvt Ltd",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
                "Shed No. 49A & B, Opp. Monsento LICEL, Nangargaon, Lonavala 410401 Dist. Pune"),
            Text("Online store:- www.maganlalchikki.in"),
            Text("Ph. No. :- +912114274060 I Mobile No. :- +917666530969"),
            Text("Contact Time :- 9 AM To 6 PM"),
            Text("Factory Closed – Thursday"),
            Text("sales@maganlalchikki.in"),
          ],
        ),
      ),
    );
  }
}
