import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              WeatherCard(
                city: 'PhnomPenh',
                min: '10.0°C',
                max: '30.0°C',
                current: '12.2°C',
                image: 'assets/ex4/cloudy.png',
                gradient: LinearGradient(
                    colors: [Colors.purple.shade300, Colors.purple.shade600]
                ), 
              ),
              const SizedBox(height: 20),
              WeatherCard(
                city: 'Paris',
                min: '10.0°C',
                max: '40.0°C',
                current: '22.2°C',
                image: 'assets/ex4/sunnyCloudy.png',
                gradient: LinearGradient(
                    colors: [Colors.cyan.shade300, Colors.cyan.shade600]
                ), 
              ),
              const SizedBox(height: 20),
              WeatherCard(
                city: 'Rome',
                min: '10.0°C',
                max: '40.0°C',
                current: '45.2°C',
                image: 'assets/ex4/sunny.png',
                gradient: LinearGradient(
                  colors: [Colors.pink.shade300, Colors.pink.shade600]
                ), 
              ),
              const SizedBox(height: 20),
              WeatherCard(
                city: 'Toulouse',
                min: '10.0°C',
                max: '40.0°C',
                current: '45.2°C',
                image: 'assets/ex4/verycloudy.png',
                gradient: LinearGradient(
                  colors: [Colors.orange.shade300, Colors.orange.shade600]
                ), 
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class WeatherCard extends StatelessWidget {
  final String city;
  final String min;
  final String max;
  final String current;
  final String image;
  final Gradient gradient;

  const WeatherCard({
    super.key,
    required this.city,
    required this.min,
    required this.max,
    required this.current,
    required this.image,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      elevation: 6,
      shadowColor: Colors.black26,
      borderRadius: BorderRadius.circular(25),
      child: Stack(
        children: [
          // Gradient background
          Container(
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: BorderRadius.circular(25),
            ),
            padding: const EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.white,
                      child: ClipOval(
                        child: Image.asset(image, width: 40, height: 40),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          city,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Min $min',
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Max $max',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  current,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: -40,
            top: -20,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
