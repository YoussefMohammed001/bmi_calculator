import 'package:bmi_calculator/colors.dart';
import 'package:bmi_calculator/main_screen.dart';
import 'package:flutter/material.dart';

class BMIResultScreen extends StatelessWidget {
   BMIResultScreen({Key? key, required this.result, required this.isMale, required this.weight, required this.age, required this.height}) : super(key: key);
  final int result;
  final bool isMale;
  final int weight;
  final int age;
  final double height;



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        backgroundColor: mainColor,
        body: Container(
         
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.all(10),
                  child: Text("Your Result",style: TextStyle(color: Colors.white,fontSize: 33,fontWeight: FontWeight.bold),)),
              Expanded(
                child: Container(
                  width: double.infinity,

                  margin:  EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color:  secondColor,
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Gender: ${isMale ? "Male" : "Female"}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                         Text("Height: $height ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                         Text("Weight: $weight ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                         Text("Age: $age ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      Text("Normal",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 22 ),),
                      Text("$result",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 90 ),),
                      Column(
                        children: [
                          Text("You have a normal body weight.",style: TextStyle(color: Colors.grey[200],fontWeight: FontWeight.bold,fontSize: 18 ),),
                          Text("Good Job",style: TextStyle(color: Colors.grey[200],fontWeight: FontWeight.bold,fontSize: 18 ),),
                        ],
                      ),

                    ],
                  ),




                ),
              ),
          InkWell(
            onTap: () {


            },
            child: InkWell(
              onTap: () {

Navigator.pop(context);

              },
              child: Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                alignment: AlignmentDirectional.center,
                color: pinkColor,

                child: Text("Calculate again",style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 28),),

              ),
            ),
          ),

            ],
          ),
        ),



      ),
    );
  }
}
