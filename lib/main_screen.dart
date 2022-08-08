import 'dart:math';
import 'package:bmi_calculator/colors.dart';
import 'package:bmi_calculator/result.dart';
import 'package:flutter/material.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

@override
 void initState(){
  super.initState();
}
double height = 170;
bool male = true;
int weight = 60;
int age = 20;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
          backgroundColor: mainColor,
          title: const Text("BMI CALCULATOR"), centerTitle: true),

      body: Column(
        children:  [
          buildMaleFemaleItems(),
          buildHeight(),
          buildAgeWeightItems(),
          buildCalculateButton()




        ],
      ),


    );
  }

  Widget buildMaleFemaleItems(){
  return Expanded(
    child: Row(


      children: [
        Expanded(
          child: InkWell(
            onTap: () {
male = true;
setState((){});
            },
            child: Container(

              margin:  EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color:  male ? selectedColor : secondColor,
                borderRadius: BorderRadius.circular(10),
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.male,size: 66,color: Colors.white,),
                  Text("Male",style: TextStyle(color: Colors.grey),)
                ],
              ),




            ),
          ),
        ),
        Expanded(

          child: InkWell(
            onTap: () {
              male = false;
              setState((){});
            },
            child: Container(

              margin:  EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: male ? secondColor : selectedColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.female,size: 66,color: Colors.white,),
                  Text("Female",style: TextStyle(color: Colors.grey),)
                ],
              ),




            ),
          ),
        ),

      ],

    ),
  );
  }

  Widget buildHeight(){

    return Expanded(
      child: Container(
        width: double.infinity,
        margin:  const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: secondColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("HEIGHT",style: TextStyle(color: Colors.grey),),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children:  [
                Text("${height.toInt()}",style: const TextStyle(color: Colors.white, fontSize: 45,fontWeight: FontWeight.bold),),
                const Text("cm",style: TextStyle(color: Colors.white, fontSize: 12,fontWeight: FontWeight.bold),),

              ],
            ),
          ),
          Slider(
            min: 50,
              max: 220,
            value: height,
            activeColor: pinkColor,
            inactiveColor: Colors.grey,
            onChanged: (double value){
              print(value);
              height = value;
              setState((){});
              },



          )


        ],
        ),
      ),
    );

  }

Widget buildAgeWeightItems(){
  return Expanded(
    child: Row(


      children: [
        Expanded(
          child: Container(

            margin:  EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: selectedColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                Text("Weight",style: TextStyle(color: Colors.grey),),
                Text("$weight",style: TextStyle(color: Colors.white, fontSize: 35,fontWeight: FontWeight.bold),),
                Row(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.grey,
                        ),
                        IconButton(onPressed: (){
                          if(weight <= 10){
                            return;
                          }else{
                            weight--;
                            setState((){});
                          }
                        }, icon: Icon(Icons.remove,color: Colors.white,))

                      ],
                    ),
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.grey,
                        ),
                        IconButton(onPressed: (){

                          if(weight >= 150){
                            return;
                          }else{
                            weight++;
                            setState((){});
                          }
                        }, icon: Icon(Icons.add,color: Colors.white,size: 22,))

                      ],
                    )

                  ],
                )


              ],
            ),




          ),
        ),
        Expanded(
          child: Container(

            margin:  EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: secondColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [

                Text("Age",style: TextStyle(color: Colors.grey),),
                Text("$age",style: TextStyle(color: Colors.white, fontSize: 35,fontWeight: FontWeight.bold),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.grey,
                        ),
                        IconButton(onPressed: (){

                          if(age <= 0){
                            return;
                          }else{
                            age--;
                            setState((){});
                          }
                        }, icon: Icon(Icons.remove,color: Colors.white,))

                      ],
                    ),
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.grey,
                        ),
                        IconButton(onPressed: (){
                          if(age >= 100){
                            return;
                          }else{
                            age++;
                            setState((){});
                          }
                        }, icon: Icon(Icons.add,color: Colors.white,size: 22,))

                      ],
                    )

                  ],
                )


              ],
            ),




          ),
        ),




      ],

    ),
  );
}


Widget buildCalculateButton(){
    return InkWell(
      onTap: () {


      },
      child: InkWell(
        onTap: () {


            double result = weight / pow(height/100,2);





          Navigator.push(context, MaterialPageRoute(builder: (context) => BMIResultScreen(result: result.toInt(),height:height,age: age,weight: weight,isMale: male) ,));
        },

        child: Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          alignment: AlignmentDirectional.center,
          color: pinkColor,

          child: Text("CALCULATE",style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 28),),

        ),
      ),
    );
}
}
