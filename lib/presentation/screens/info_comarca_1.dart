import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/config/router/routes.dart';
import 'package:weather_app/date/counties.dart';

class InfoComarca1Screen extends StatefulWidget{
  const InfoComarca1Screen({super.key});

  @override
  _InfoComarca1ScreenState createState() => _InfoComarca1ScreenState();
}

class _InfoComarca1ScreenState extends State<InfoComarca1Screen>{

  int _currentIndex = 0;

  final Map comarca = provincies["provincies"][0]["comarques"][0];
  final String nombre = provincies["provincies"][0]["comarques"][0]["comarca"];


  final List<Widget> _pages = [
    Center(
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                comarca["img"],
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10,bottom: 10,top: 20),
                child:  Text(
                  nombre,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.grey
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10,bottom: 10),
                child: Text(
                  "Capital: " + comarca["capital"],
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10,right: 10),
              child: Text(
                comarca["desc"],
                style: TextStyle(
                  fontSize: 15
                ),
              )
              ),
            ],
          ),
    ),
    const Center(child: Text('L´oratge'))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Info')),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // El índice de la pestaña seleccionada
        onTap: (int index) {
          setState(() {
            _currentIndex = index; // Cambia la pestaña seleccionada
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Info',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'L Oratge',
          ),
        ],
      ),
    );
  }
}