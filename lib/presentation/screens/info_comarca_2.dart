import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/date/counties.dart';

class InfoComarca2Screen extends StatefulWidget{
  const InfoComarca2Screen({super.key});

  @override
  _InfoComarca2ScreenState createState() => _InfoComarca2ScreenState();
}

class _InfoComarca2ScreenState extends State<InfoComarca2Screen>{
  
  Map comarca = provincies["provincies"][0]["comarques"][0];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          comarca["comarca"],
          style: const TextStyle(
            color: Colors.black,
            fontStyle: FontStyle.italic,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go("/regions");
          },
        ),
      ),
      body: 
          Column(
            children: [
              Image.asset(
                "assets/rain.png",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 10,top: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.thermostat,
                      size: 34,
                      color: Colors.black,
                    ),
                    Text(
                      "5.4º",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.grey
                       ),
                      ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.air,
                      size: 34,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20,right: 20),
                      child: Text(
                        "9.4km/h",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                    ),
                        Text(
                        "Ponent←",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                  ],
                ),
              ),
              Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Alinea los textos a la izquierda
                children: [
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Poblacio:",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 5), // Espacio entre los textos
                            Text(
                              "Latitud:",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 5), // Espacio entre los textos
                            Text(
                              "Longitud:",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            comarca["poblacio"],
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 5), // Espacio entre los textos
                          Text(
                            comarca["coordenades"][0].toString(),
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 5), // Espacio entre los textos
                          Text(
                            comarca["coordenades"][1].toString(),
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],

                      )
                    ],
                  )
                ],
              ),
            ),
            ],
          ),
      );
  }
}