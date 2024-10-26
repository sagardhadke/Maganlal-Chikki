import 'package:maganlal_chikki/Exports/myExports.dart';
class MyProducts extends StatefulWidget {
  const MyProducts({super.key});

  @override
  State<MyProducts> createState() => _MyProductsState();
}

class _MyProductsState extends State<MyProducts> {
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
          // GridView.builder(
                //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //         crossAxisCount: 2),
                //     itemBuilder: (context, index) {
                //       return Container(
                //           child: Column(
                //             children: [
                //               CachedNetworkImage(imageUrl: ofAbout![index].image!)
                //             ],
                //           ),
                //       );
                //     })
        ],
      ),
    );
  }
}