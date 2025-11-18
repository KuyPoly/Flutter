import 'package:flutter/material.dart';

void main() => runApp(
  const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'SEASONS',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisSize: MainAxisSize.min,    // 🔥 Add this
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CountrySeason(countryName: 'FRANCE', currentSeason: Season.winter),
                  SizedBox(width: 10),
                  CountrySeason(countryName: 'CAMBODIA', currentSeason: Season.spring),
                ],
              ),
            ],
          ),
        ),
      ),

    );
  }
}

enum Season { 
  winter(image: 'assets/season/winter.png'), 
  spring(image: 'assets/season/spring.png'),  
  summer(image: 'assets/season/summer.png'),
  fall(image: 'assets/season/autumn.png');     
  
  final String image;
  const Season({required this.image});
}

class CountrySeason extends StatefulWidget {
  const CountrySeason({
    super.key,
    required this.countryName,
    required this.currentSeason,
  });

  final String countryName;
  final Season currentSeason;

  @override
  State<CountrySeason> createState() => _CountrySeasonState();
}

class _CountrySeasonState extends State<CountrySeason> {
  late Season _season;

  @override
  void initState() {
    super.initState();
    _season = widget.currentSeason;  // assign here
  }
  void changeSeason() {
    setState(() {
      switch(_season) {  
        case Season.winter:
          _season = Season.spring;
          break;
        case Season.spring:
          _season = Season.summer;
          break;
        case Season.summer:
          _season = Season.fall;
          break;
        case Season.fall:
          _season = Season.winter;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: changeSeason,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, style: BorderStyle.solid)
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(_season.image, height: 250),  
            SizedBox(height: 10),
            Text(
              widget.countryName,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}