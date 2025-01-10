import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/config/router/routes.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{

  @override
  Widget build(BuildContext context){
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/sky.jpg'),
            fit: BoxFit.cover
          )
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Image.asset(
                    'assets/icon/weatherIcon.png',
                    width: 100,
                    height: 100,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 30.0),
                  child: Text(
                    "Les Comarques de \nla Comunitat",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child:  TextFormField(
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'User',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom( 
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10
                          ),
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minimumSize: Size(110, 20),
                          maximumSize: Size(110, 50)
                        ),
                        onPressed: () {
                          context.push("/provinces");
                        },
                        child: const Text("Login"),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom( 
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10
                          ),
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minimumSize: Size(110, 20),
                          maximumSize: Size(110, 50)
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Register"),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextFormField(
                                      decoration: InputDecoration(
                                        labelText: 'Email',
                                      ),
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        labelText: 'Password',
                                      ),
                                      obscureText: true,
                                    ),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      context.pop();
                                    },
                                    child: Text("Cancel"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      context.pop();
                                    },
                                    child: Text("Register"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: const Text("Register"),
                      ),
                    ]
                  )
                )
                ] 
              ),
            ),
          ),
        ),
    );
  }
}