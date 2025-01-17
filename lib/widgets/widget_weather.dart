import 'package:flutter/material.dart';
import 'package:weather_app/peticiones_http.dart';

class WidgetWeather extends StatefulWidget {
  const WidgetWeather({
    required this.latitud,
    required this.longitud,
    super.key
  });

  final double? latitud;
  final double? longitud;

  @override
  State<WidgetWeather> createState() => _WidgetWeatherState();
}  

class _WidgetWeatherState extends State<WidgetWeather> {
  late Future<dynamic> info;

  @override
  void initState() {
    super.initState();

    info = obtenerClima(longitud: widget.longitud ?? 0.0, latitud: widget.latitud ?? 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: info,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(snapshot.hasData){
          String temperatura =
              snapshot.data["current_weather"]["temperature"].toString();
          String velVent =
              snapshot.data["current_weather"]["windspeed"].toString();
          String direccioVent =
              snapshot.data["current_weather"]["winddirection"].toString();
          String codi =
              snapshot.data["current_weather"]["weathercode"].toString();
        
          return Column(
            children: [
              _obtenerIconoTiempo(codi),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 10),
                child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.thermostat,
                        size: 34,
                        color: Colors.black,
                      ),
                      Text(
                        "$temperaturaº",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 30,
                          color: Colors.grey
                        ),
                      ),
                    ],
                  ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: _obtenerGinyDireccionViento(
                  double.parse(direccioVent),
                  double.parse(velVent)
                ),
              ),
            ],
          );
        }
        return const CircularProgressIndicator();
      }
    );
  }

  Widget _obtenerIconoTiempo(String value) {
    /*
    
    Aquesta funció obté un giny amb una imatge que es 
    correspon al codi de l'oratge (Assolellat, núvo, etc.)

    Existeix una gran quantitat de codis per a l'oratge, que podem 
    consultar a la web d'OpenMeteo:https://open-meteo.com/en/docs/dwd-api#weathervariables,
    a l'apartat "WMO Weather interpretation codes (WW)"

     */
    Set<String> sol = <String>{"0"};
    Set<String> pocsNuvols = <String>{"1", "2", "3"};
    Set<String> nuvols = <String>{"45", "48"};
    Set<String> plujasuau = <String>{"51", "53", "55"};
    Set<String> pluja = <String>{
      "61",
      "63",
      "65",
      "66",
      "67",
      "80",
      "81",
      "82",
      "95",
      "96",
      "99"
    };
    Set<String> neu = <String>{"71", "73", "75", "77", "85", "86"};

    if (sol.contains(value)) {
      return const Image(image: AssetImage('assets/icons/png/soleado.png'));
    }
    if (pocsNuvols.contains(value)) {
      return const Image(image: AssetImage('assets/icons/png/poco_nublado.png'));
    }
    if (nuvols.contains(value)) {
      return const Image(image: AssetImage('assets/icons/png/nublado.png'));
    }
    if (plujasuau.contains(value)) {
      return const Image(image: AssetImage('assets/icons/png/lluvia_debil'));
    }
    if (pluja.contains(value)) {
      return const Image(image: AssetImage('assets/icons/png/lluvia.png'));
    }
    if (neu.contains(value)) {
      return const Image(image: AssetImage('assets/icons/png/nieve.png'));
    }

    return const Image(image: AssetImage('assets/icons/png/poco_nublado.png'));
  }

  Widget _obtenerGinyDireccionViento(double direccioVent,double velVent) {
    // Aquesta funció ens retorna una giny que conté
    // una icona i un text, amb la direcció i el nom del vent
    // segons la seua direcció.
    // Fem ús de `late` per indicar que assignarem el valor després
    // a les variables.

    late Icon icona;
    late String nomVent;

    if (direccioVent > 22.5 && direccioVent < 65.5) {
      icona = const Icon(Icons.north_east, size: 32, color: Colors.black);
      nomVent = "Gregal";
    } else if (direccioVent > 67.5 && direccioVent < 112.5) {
      icona = const Icon(Icons.east, size: 32, color: Colors.black);
      nomVent = "Llevant";
    } else if (direccioVent > 112.5 && direccioVent < 157.5) {
      icona = const Icon(Icons.south_east, size: 32, color: Colors.black);
      nomVent = "Xaloc";
    } else if (direccioVent > 157.5 && direccioVent < 202.5) {
      icona = const Icon(Icons.south, size: 32, color: Colors.black);
      nomVent = "Migjorn";
    } else if (direccioVent > 202.5 && direccioVent < 247.5) {
      icona = const Icon(Icons.south_west, size: 32, color: Colors.black);
      nomVent = "Llebeig/Garbí";
    } else if (direccioVent > 247.5 && direccioVent < 292.5) {
      icona = const Icon(Icons.west, size: 32, color: Colors.black);
      nomVent = "Ponent";
    } else if (direccioVent > 292.5 && direccioVent < 337.5) {
      icona = const Icon(Icons.north_west, size: 32, color: Colors.black);
      nomVent = "Mestral";
    } else {
      icona = const Icon(Icons.north, size: 32, color: Colors.black);
      nomVent = "Tramuntana";
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icona,
        Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Text(
            "${velVent}km/h",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        Text(
          nomVent,
          textAlign: TextAlign.center,
          style: const TextStyle(
           fontSize: 25,
          fontWeight: FontWeight.bold
          ),
        ),
      ]
    );
  }

}