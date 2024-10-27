import 'package:maganlal_chikki/Exports/myExports.dart';
import 'package:http/http.dart' as http;

class MyAbout extends StatefulWidget {
  const MyAbout({super.key});

  @override
  State<MyAbout> createState() => _MyAboutState();
}

class _MyAboutState extends State<MyAbout> {
  List<AboutModel>? ofAbout;

  void getAboutInfo() async {
    try {
      var aboutApi = await http.get(
          Uri.parse("https://appy.trycatchtech.com/v3/maganlalchikki/about"));
      if (aboutApi.statusCode == 200) {
        ofAbout = AboutModel.ofAbout(jsonDecode(aboutApi.body));
        print("About us API Response ${ofAbout}");
        setState(() {});
      }
    } catch (e) {
      print("Error ${e.toString()}");
    }
  }

  @override
  void initState() {
    getAboutInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Color(0XFFF4F4F4),
      drawer: Uihelper.myDrawer(context),
      body: ofAbout == null
          ? Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  for (int i = 0; i < 1; i++) ...{
                    CachedNetworkImage(imageUrl: ofAbout![i].image!),
                    SizedBox(height: 10),
                    Text(ofAbout![i].title!,
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(ofAbout![i].description!),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Our Team",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(ofAbout![i].ourTeam!),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "History",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(ofAbout![i].history!),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Client Satisfaction",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(ofAbout![i].clientSatisfaction!),
                    ),
                  }
                ],
              ),
            ),
    );
  }
}
