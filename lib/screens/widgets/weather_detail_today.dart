import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:weather_icons/weather_icons.dart';

import 'detail_icon.dart';

class WeatherDetail extends StatelessWidget {
  const WeatherDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: MediaQuery.of(context).size.width,
      height: 450,
      borderRadius: 20,
      blur: 20,
      alignment: Alignment.bottomCenter,
      border: 0,
      linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFffffff).withOpacity(0.2),
            const Color(0xFFFFFFFF).withOpacity(0.4),
          ],
          stops: const [
            0.1,
            1,
          ]),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color(0xFFffffff).withOpacity(0.2),
          const Color((0xFFFFFFFF)).withOpacity(0.2),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            const Icon(
              WeatherIcons.day_rain,
              size: 80,
              color: Colors.white,
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Rainy',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Stack(
              children: const [
                SizedBox(
                    width: 140,
                    child: Center(
                      child: Text('25', style: TextStyle(fontSize: 40)),
                    )),
                Positioned(
                  top: 0,
                  left: 100,
                  child: Text(
                    '°C',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Feels like 25°C',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                DetailIcon(
                  icon: WeatherIcons.strong_wind,
                  text: '19km/h',
                ),
                DetailIcon(
                  icon: WeatherIcons.humidity,
                  text: '90%',
                ),
                DetailIcon(
                  icon: WeatherIcons.cloud,
                  text: '85%',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
