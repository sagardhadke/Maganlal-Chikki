import 'package:maganlal_chikki/Exports/myExports.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(milliseconds: 1300),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyDashboard())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CachedNetworkImage(
                imageUrl:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiUN2ts0AQPmXrBUzO0RNmA6DZWh1fbD5DcA&s"),
          ),
        ],
      ),
    );
  }
}
