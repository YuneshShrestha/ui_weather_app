import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:weather_app/screens/widgets/location.dart';
import 'package:weather_app/screens/widgets/weather_detail.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title:
      // ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    const Color(0xFFcc2b5e).withOpacity(1),
                    const Color(0xFF753a88).withOpacity(1),
                  ],
                ),
              ),
            ),
            // Image.network(
            //   "https://github.com/RitickSaha/glassmophism/blob/master/example/assets/bg.png?raw=true",
            //   fit: BoxFit.cover,
            //   height: double.infinity,
            //   width: double.infinity,
            //   scale: 1,
            // ),
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    Location(),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Today',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Tue ,Dec 25',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    WeatherDetail(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
