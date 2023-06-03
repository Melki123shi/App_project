// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'admincars.dart';


class AdminPanel extends StatelessWidget {
  final _bloc =  AdminPanelBloc();

  AdminPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child:Column(
        children: [
          Container (
            height:300,
            decoration: const BoxDecoration(
              image:DecorationImage(image: AssetImage("images/00001.png"),
              fit:BoxFit.cover)
            ),
            child: const Center(
            child:Text("Greetings Admin!!",
            style: TextStyle(
              height: -6,
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 10, 10, 10),
            ),
            ),
          ),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color:Colors.white,
              boxShadow: const [
                BoxShadow(
                  color:Colors.grey,
                  blurRadius: 5.0,
                  spreadRadius: 1.0
                )
              ]
            ),
           padding: EdgeInsets.all(30.0),
         child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                //button1
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:<Widget> [


                    //button one starts
                    StreamBuilder<void>(
                      stream:_bloc.button1Stream,
                      builder: (context,snapshot){
                        return Expanded(
                         
                          child: ElevatedButton(
                           style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 10,
                            shadowColor: Colors.grey,
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),  
                            ) ,
                          ),
                           onPressed: (){
                           _bloc.button4Pressed();
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminCars()),
                            );
                          },
                         child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/car1.png',
                         width: 100,
                         height: 100,),
                      const SizedBox(height: 10),
                      const Text('Cars', 
                      style: TextStyle(
                        fontSize: 16, color: Colors.black)),
                    ],),),);},),
SizedBox(width:16.0),



//button two starts
 StreamBuilder<void>(
                      stream:_bloc.button2Stream,
                      builder: (context,snapshot){
                        return Expanded(
                         
                          child: ElevatedButton(
                           style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 10,
                            shadowColor: Colors.grey,
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),  
                            ) ,
                          ),
                           onPressed: (){
                           
                          },
                         child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/0001employees.png', 
                         width: 100,
                         height: 100,),
                      const SizedBox(height: 10),
                      const Text('Employees', 
                      style: TextStyle(
                        fontSize: 16,color:Colors.black)),
                    ],),
                    ),
                    );
                    },
                    ),],
                  ),
                  SizedBox(height:20),

 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:<Widget> [
                    StreamBuilder<void>(
                      stream:_bloc.button3Stream,
                      builder: (context,snapshot){
                        return Expanded(
                         
                          child: ElevatedButton(
                           style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 10,
                            shadowColor: Colors.grey,
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),  
                            ) ,
                          ),
                           onPressed: (){
                            _bloc.button3Pressed();
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>AnotherPage()),
                            );
                          },
                         child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                         'images/00001profit.webp', 
                         width: 100,
                         height: 100,),
                      const SizedBox(height: 10),
                      const Text('Profit', 
                      style: TextStyle(
                        fontSize: 16,color: Colors.black)),
                    ],),
                    ),
                    );
                    },
                    ),

 SizedBox(width:16.0),
//utton four
 StreamBuilder<void>(
                      stream:_bloc.button4Stream,
                      builder: (context,snapshot){
                        return Expanded(
                         
                          child: ElevatedButton(
                           style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 10,
                            shadowColor: Colors.grey,
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),  
                            ) ,
                          ),
                           onPressed: (){
                            _bloc.button4Pressed();
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminCars()),
                            );
                          },
                         child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                           'images/00001credit.png',
                         width: 100,
                         height: 100,),
                      const SizedBox(height: 10),
                      const Text('Credit', 
                      style: TextStyle(
                        fontSize: 16,color:Colors.black)),
                    ],),
                    ),
                    );
                    },
                    ),],
                  ),
              ], 
             
              ),
              
          ),
        ],
      )
      )
    );
  }
}



















class AdminPanelBloc {
  final _button1Controller = StreamController <void>();
  final _button2Controller = StreamController <void>();
  final _button3Controller = StreamController <void>();
  final _button4Controller = StreamController <void>();

  Stream<void> get button1Stream => _button1Controller.stream;
  Stream<void> get button2Stream => _button2Controller.stream;
  Stream<void> get button3Stream => _button3Controller.stream;
  Stream<void> get button4Stream => _button4Controller.stream;

  void button1Pressed(){
    _button1Controller.sink.add(null);
  }

  void button2Pressed(){
    _button2Controller.sink.add(null);
  }

  void button3Pressed(){
    _button3Controller.sink.add(null);
  }
  void button4Pressed(){
    _button4Controller.sink.add(null);
  }

  void dispose(){
    _button1Controller.close();
    _button2Controller.close();
    _button3Controller.close();
    _button4Controller.close();
  }
}
