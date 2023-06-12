import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:weather_app/screens/widgets/detail_icon.dart';
import 'package:weather_icons/weather_icons.dart';

class NextFiveDays extends StatelessWidget {
  const NextFiveDays({super.key});

  @override
  Widget build(BuildContext context) {
    const sizedBox = SizedBox(
      height: 20,
    );
    final next4Days = [
      {
        'day': 'Thu',
        'icon': WeatherIcons.day_sunny,
        'temp': '30',
        'weather': 'Sunny',
        'date': 'Dec 30'
      },
      {
        'day': 'Fri',
        'icon': WeatherIcons.day_cloudy,
        'temp': '28',
        'weather': 'Cloudy',
        'date': 'Dec 31'
      },
      {
        'day': 'Sat',
        'icon': WeatherIcons.day_sunny_overcast,
        'temp': '26',
        'weather': 'Sunny',
        'date': 'Jan 1'
      },
      {
        'day': 'Sun',
        'icon': WeatherIcons.day_rain,
        'temp': '25',
        'weather': 'Rainy',
        'date': 'Jan 2'
      },
    ];
    return Scaffold(
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
                    const Color(0xFF8F55D9).withOpacity(1),
                    // const Color(0xFFD6C970).withOpacity(0.8),
                    const Color(0xFFDC8B4B).withOpacity(1),
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
                // physics: const NeverScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 12.0),
                  child: Column(
                    children: [
                      const CustomAppBar(),
                      sizedBox,
                      const TomorrowWeatherDetail(),
                      sizedBox,
                      SizedBox(
                        height: 492,
                        child: ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            separatorBuilder: (ctx, i) => const Divider(
                                  color: Colors.white,
                                  thickness: 0.5,
                                ),
                            itemBuilder: (ctx, i) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        text: "${next4Days[i]['day']}, "
                                            .toString(),
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: ' ${next4Days[i]['date']}',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          next4Days[i]['icon'] as IconData,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          next4Days[i]['weather'].toString(),
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Stack(
                                      children: [
                                        SizedBox(
                                          width: 40,
                                          child: Text(
                                            next4Days[i]['temp'].toString(),
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        const Positioned(
                                          top: 0,
                                          left: 22,
                                          child: Text(
                                            '°C',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                            itemCount: next4Days.length),
                      )
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

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          const Expanded(
            child: Text(
              'Next 5 Days',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TomorrowWeatherDetail extends StatelessWidget {
  const TomorrowWeatherDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: MediaQuery.of(context).size.width,
      height: 220,
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
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      'Tomorrow',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Wed Dec 29',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Stack(
                  children: const [
                    SizedBox(
                        width: 140,
                        child: Text('25', style: TextStyle(fontSize: 40))),
                    Positioned(
                      top: 0,
                      left: 60,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    DetailIcon(
                      icon: WeatherIcons.strong_wind,
                      text: '19km/h',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    DetailIcon(
                      icon: WeatherIcons.humidity,
                      text: '90%',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    DetailIcon(
                      icon: WeatherIcons.cloud,
                      text: '85%',
                    ),
                  ],
                ),
              ],
            ),
            // const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Icon(
                  WeatherIcons.day_rain,
                  size: 60,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Rainy',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
