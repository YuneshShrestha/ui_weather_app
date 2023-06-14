import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/screens/widgets/location.dart';
import 'package:weather_app/screens/widgets/weather_detail_today.dart';
import 'package:weather_icons/weather_icons.dart';

import 'next_five_days.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // data for hourly weather
  List<Map<String, dynamic>> weatherDataHourly = [
    {
      'time': '00:00',
      'icon': WeatherIcons.day_sunny_overcast,
      'temp': '28',
    },
    {
      'time': '01:00',
      'icon': WeatherIcons.day_sunny_overcast,
      'temp': '28',
    },
    {
      'time': '02:00',
      'icon': WeatherIcons.day_sunny_overcast,
      'temp': '28',
    },
    {
      'time': '03:00',
      'icon': WeatherIcons.day_sunny_overcast,
      'temp': '28',
    },
    {
      'time': '04:00',
      'icon': WeatherIcons.day_sunny_overcast,
      'temp': '28',
    },
    {
      'time': '05:00',
      'icon': WeatherIcons.day_sunny_overcast,
      'temp': '28',
    },
    {
      'time': '06:00',
      'icon': WeatherIcons.day_sunny_overcast,
      'temp': '28',
    },
    {
      'time': '07:00',
      'icon': WeatherIcons.day_sunny_overcast,
      'temp': '28',
    },
    {
      'time': '08:00',
      'icon': WeatherIcons.day_sunny_overcast,
      'temp': '28',
    },
    {
      'time': '09:00',
      'icon': WeatherIcons.day_sunny_overcast,
      'temp': '28',
    },
    {
      'time': '10:00',
      'icon': WeatherIcons.day_sunny_overcast,
      'temp': '28',
    },
    {
      'time': '11:00',
      'icon': WeatherIcons.day_sunny_overcast,
      'temp': '28',
    },
    {
      'time': '12:00',
      'icon': WeatherIcons.day_sunny,
      'temp': '30',
    },
    {
      'time': '13:00',
      'icon': WeatherIcons.day_sunny_overcast,
      'temp': '28',
    },
    {
      'time': '14:00',
      'icon': WeatherIcons.day_sunny_overcast,
      'temp': '28',
    },
    {
      'time': '15:00',
      'icon': WeatherIcons.day_sunny_overcast,
      'temp': '28',
    },
    {
      'time': '16:00',
      'icon': WeatherIcons.day_sunny_overcast,
      'temp': '28',
    },
    {
      'time': '17:00',
      'icon': WeatherIcons.day_sunny_overcast,
      'temp': '28',
    },
    {
      'time': '18:00',
      'icon': WeatherIcons.day_sunny_overcast,
      'temp': '28',
    },
    {
      'time': '19:00',
      'icon': WeatherIcons.day_sunny_overcast,
      'temp': '28',
    },
    {
      'time': '20:00',
      'icon': WeatherIcons.day_sunny_overcast,
      'temp': '28',
    },
    {
      'time': '21:00',
      'icon': WeatherIcons.day_sunny_overcast,
      'temp': '28',
    },
    {
      'time': '22:00',
      'icon': WeatherIcons.day_sunny_overcast,
      'temp': '28',
    },
    {
      'time': '23:00',
      'icon': WeatherIcons.day_sunny_overcast,
      'temp': '28',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        // stack for background gradient
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: (int.parse(DateTime.now().hour.toString()) >= 19 ||
                          int.parse(DateTime.now().hour.toString()) < 6)
                      ? [
                          const Color(0xFF071930).withOpacity(1),
                          const Color(0xFF000B16).withOpacity(1),
                        ]
                      : [
                          const Color(0xFF8F55D9).withOpacity(1),
                          // const Color(0xFFD6C970).withOpacity(0.8),
                          const Color(0xFFDC8B4B).withOpacity(1),
                        ],
                ),
              ),
            ),
            SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 12.0),
                  child: Column(
                    children: [
                      // Location to choose location
                      const Location(),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Today',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Tue, Dec 25',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w200,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // Weather detail widget to show weather details of today
                      const WeatherDetail(),
                      const SizedBox(
                        height: 20,
                      ),
                      // Hourly weather widget to show hourly weather
                      WholeDayWeatherWidget(
                          weatherDataHourly: weatherDataHourly),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WholeDayWeatherWidget extends StatelessWidget {
  const WholeDayWeatherWidget({
    super.key,
    required this.weatherDataHourly,
  });

  final List<Map<String, dynamic>> weatherDataHourly;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Today',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NextFiveDays(),
                  ),
                );
              },
              child: Row(
                children: [
                  Text(
                    'Next 5 days',
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.white,
                  )
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 120,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, i) {
                return HourlyWeatherWidget(
                  time: weatherDataHourly[i]['time'],
                  icon: weatherDataHourly[i]['icon'],
                  temp: weatherDataHourly[i]['temp'],
                );
              },
              separatorBuilder: (ctx, i) => const VerticalDivider(
                    color: Colors.transparent,
                    width: 10,
                  ),
              itemCount: weatherDataHourly.length),
        ),
      ],
    );
  }
}

class HourlyWeatherWidget extends StatelessWidget {
  const HourlyWeatherWidget({
    super.key,
    required this.time,
    required this.icon,
    required this.temp,
  });
  final String time;
  final IconData icon;
  final String temp;

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: 90,
      height: 120,
      borderRadius: 10,
      blur: 20,
      alignment: Alignment.bottomCenter,
      border: DateTime.now().hour.toString() == time.split(':')[0] ? 0 : 1,
      linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: DateTime.now().hour.toString() == time.split(':')[0]
              ? [
                  const Color(0xFFffffff).withOpacity(0.2),
                  const Color(0xFFFFFFFF).withOpacity(0.4),
                ]
              : [
                  const Color(0xFFffffff).withOpacity(0),
                  const Color(0xFFFFFFFF).withOpacity(0),
                ],
          stops: const [
            0.1,
            1,
          ]),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color(0xFFffffff).withOpacity(0.5),
          const Color((0xFFFFFFFF)).withOpacity(0.5),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            time,
            style: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: DateTime.now().hour.toString() == time.split(':')[0]
                  ? Colors.white
                  : Colors.white.withOpacity(0.8),
            ),
          ),
          Icon(
            icon,
            size: 30,
            color: DateTime.now().hour.toString() == time.split(':')[0]
                ? Colors.white
                : Colors.white.withOpacity(0.8),
          ),
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: Center(
                    child: Text(
                  temp,
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: DateTime.now().hour.toString() == time.split(':')[0]
                        ? Colors.white
                        : Colors.white.withOpacity(0.8),
                  ),
                )),
              ),
              Positioned(
                top: 0,
                left: 60,
                child: Text(
                  '°C',
                  style: GoogleFonts.roboto(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: DateTime.now().hour.toString() == time.split(':')[0]
                        ? Colors.white
                        : Colors.white.withOpacity(0.8),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
