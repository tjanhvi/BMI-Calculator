// ignore_for_file: prefer_const_constructors

import 'package:bmi_app/splashscreen.dart';
import 'package:flutter/material.dart';  

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void clearAll(){
    weightController.clear();
    feetController.clear();
    inchController.clear();
    setState((){
      result = " ";
    });
  }

  var weightController = TextEditingController();
  var feetController = TextEditingController();
  var inchController = TextEditingController();

  var result = "";
  var bgColor = Colors.teal.shade100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculate your BMI",  
        ),        
      ),
      body: Container(
        child: Container(
          color: bgColor,
          padding: EdgeInsets.only(top:30.0),
          child: Center(
            child: Container(          
              width: 300,
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables              
                children: [                
                  Text(
                    "Your Result",
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
      
                  SizedBox(height: 11.0),

                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset("assets/avatar.png"),
                  ),
            
                  SizedBox(height: 25.0),
      
                  TextField(
                    controller: weightController,
                    decoration: InputDecoration(
                      label: Text("Enter your weight(in kgs)"),
                      prefixIcon: Icon(Icons.line_weight)
                    ),
                    keyboardType: TextInputType.number,
                  ),
      
                  SizedBox(height: 11.0),
      
                  TextField(
                    controller: feetController,
                    decoration: InputDecoration(
                      label: Text("Enter your height(in feet)"),
                      prefixIcon: Icon(Icons.height)
                    ),
                    keyboardType: TextInputType.number,
                  ),
      
                  SizedBox(height: 11.0),
      
                  TextField(
                    controller: inchController,
                    decoration: InputDecoration(
                      label: Text("Enter your height(in inch)"),
                      prefixIcon: Icon(Icons.height)
                    ),
                    keyboardType: TextInputType.number,
                  ),
      
                  SizedBox(height: 16.0),
      
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: (){
      
                          var weight = weightController.text.toString();
                          var feet = feetController.text.toString();
                          var inch = inchController.text.toString();
                          
                          if(weight != "" && feet != "" && inch != ""){
                            var iWt = int.parse(weight);
                            var iFt = int.parse(feet);
                            var iInch = int.parse(inch);
      
                            var tInch = (iFt * 12) + iInch;
                            var tCm = tInch * 2.54;
                            var tM = tCm / 100;
      
                            var bmi = iWt/(tM*tM); 
      
                            var msg = ""; 
      
                            if(bmi > 25){
                              msg = "You are OverWeight!";
                              bgColor = Colors.red.shade100;
                            }
                            else if(bmi > 18.5){
                              msg = "You are UnderWeight!";
                              bgColor = Colors.orange.shade100;
                            } 
                            else {
                              msg = "You are Healthy!";
                              bgColor = Colors.green.shade100;
                            }              
      
                            setState((){
                              result = "$msg \n Yout BMI is: ${bmi.toStringAsFixed(2)}";
                            });
      
                          } else {
                            setState((){
                              result = "Please fill all the required blanks!";
                            });
                          }
      
                        }, 
                        child: Text("Calculate BMI")
                      ),
      
                      ElevatedButton(
                        onPressed: clearAll,
                        child: Text("Reset"),
                      ),  
                    ],
                  ),
      
                  SizedBox(height: 12.0),
      
                  Text(result,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }  
}
