import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/config/router/routes.dart';
import 'package:weather_app/date/counties.dart';

class ComarquesScreen extends StatefulWidget{
  const ComarquesScreen({super.key});

  @override
  _ComarquesScreenState createState() => _ComarquesScreenState();


}

class _ComarquesScreenState extends State<ComarquesScreen>{
  @override 
  Widget build(BuildContext context){
    List<dynamic> comarques = provincies["provincies"][0]["comarques"];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Comarques De Valencia",
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontStyle: FontStyle.italic,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            context.go("/provinces");
          },
        ),
        backgroundColor: Colors.white.withOpacity(0.6),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: comarques.length,
        itemBuilder: (context,index){
            return Padding(padding: EdgeInsets.only(bottom: 10),
              child: GestureDetector(
                onTap: () => {
                  context.push("/info_1")
                },
                child: Card(
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Image.network(
                        comarques[index]["img"].toString(),
                        width: double.infinity,
                        height: 150,
                        fit: BoxFit.cover,  
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10, left: 10),
                        child: Text(
                          comarques[index]["comarca"].toString(),
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                color: Colors.black,
                                offset: Offset(4, 4)
                              )
                            ],
                            fontStyle: FontStyle.italic,
                          ),
                        )
                      )
                    ]
                  )
                )
              )
            );
          }
        )
    );
  }
}