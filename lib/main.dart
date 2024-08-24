import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';



void main() {
  runApp(FlutterApp());

  
  
}

class FlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "FlutterApp",
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const DashBoardScreen(),
    );
  }
}

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
  
}

class _DashBoardScreenState extends State<DashBoardScreen>{


  //  var count = 0;

   var wtController = TextEditingController();
   var ftController = TextEditingController();
   var inController = TextEditingController();
  
   var result = '';
   
   var bgColor = Colors.indigo.shade200;


    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dash Board"),
        backgroundColor: Color.fromARGB(255, 136, 31, 136),
      ),

    
     body: Container(

    
     color: bgColor,


       child: Center(
         child: Container(
          width: 300,
           child: Column(
       
              mainAxisAlignment: MainAxisAlignment.center,
           
                  children: [
           
                      Text('BMI Calculator', style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w500,
                      ),),
           
           
                        SizedBox(
                          height: 21,
                        ),
           
           
                      TextField(
           
                        controller: wtController,
                        decoration: InputDecoration(
                          label: Text("Enter your Weight in kg"),
                          prefixIcon: Icon(Icons.line_weight_rounded)
                        ),
           
                        keyboardType: TextInputType.numberWithOptions(),
                         
                      ),
           
                  
                   SizedBox(
                          height: 11,
                        ),
                       
                       
                       
                        TextField(
           
                        controller: ftController,
                        decoration: InputDecoration(
                          label: Text("Enter your Height in (feet)"),
                          prefixIcon: Icon(Icons.insert_chart_outlined_sharp)
                        ),
           
                        keyboardType: TextInputType.numberWithOptions(),
                         
                      ),
           
           
                        SizedBox(
                          height: 11,
                        ),
                        
                        
                        TextField(
           
                        controller: inController,
                        decoration: InputDecoration(
                          label: Text("Enter your Height in (inches)"),
                          prefixIcon: Icon(Icons.height_outlined)
                        ),
           
                        keyboardType: TextInputType.numberWithOptions(),
                         
                      ),
       
                        SizedBox(
                      height: 15,
                    ),
       
                      ElevatedButton(onPressed: (){
       
                        var wt = wtController.text.trim();
                        var ft = ftController.text.trim();
                        var inches = inController.text.trim();
       
                        if (wt!="" && ft!="" && inches!="") {
                           
                        try {
       
        
                        var iWt = int.parse(wt);
                        var iFt = int.parse(ft);
                        var iInch = int.parse(inches);
       
       
                        var tInch = (iFt * 12) + iInch;
       
                        var tCm = tInch * 2.54;
       
                        var tM = tCm / 100;
       
                        var bmi = iWt / (tM * tM);
       
                        var msg = "";  
                      
                       if(bmi>25)
                       {

                           
                           msg = " You are OverWeight";
                           bgColor = Colors.red.shade400;
                       }

                       else if(bmi<18)
                       {
                          msg = " You are UnderWeight";
                          bgColor = Colors.yellow.shade400;
                       }

                       else{

                        msg = " You are Healthy";
                        bgColor = Colors.green.shade200;

                       }
                       
                       
                        setState(() {
                          
                        result = "$msg \n Your BMI is: ${bmi.toStringAsFixed(2)}";
                        
                        });
       
                        }    
                       
                               catch (e) {
                          setState(() {
                            result = "Please enter valid numbers";
                          });
                        }
         
       
                        }
       
                          else{
       
                              setState(() {
                                
                                result = "Please fill all the required blank";
                              });
                          }
       
       
                      }, child: Text('Calculate'),
                      
                      
                      style: ElevatedButton.styleFrom(
                      foregroundColor: Color.fromARGB(255, 240, 246, 251), // Background color
                      backgroundColor: Color.fromARGB(255, 136, 31, 136), // Text color
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0), // Rounded corners
                        ),
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Button padding
                      ),
                      
                      ),
       
                         SizedBox(
                      height: 17,
                    ),
       
                      
                      Text(result, style: TextStyle(fontSize: 20),)
                  ],
                   
           ),
         ),
       ),
     ) 
     
    

    );
    
  }
}

