// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'custem_appbar.dart';



class CarSell extends StatelessWidget {
  const CarSell({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: const Color.fromARGB(255, 37, 37, 37),
    appBar: PreferredSize(
    preferredSize: const Size.fromHeight(kToolbarHeight + 30), // adjust height as needed
    child: CustomAppBar(
      onBackArrowPressed: () => Navigator.pop(context), // callback for back arrow// user avatar image path
    ),
  ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 7),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'AUDI A8',
                          style: TextStyle(
                            color: Colors.white,
                             fontSize:20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                       
                      ],
                    ),
                  ),
                  SizedBox(width: 16),
                  Image.asset(
                    'images/carpcard6.png',
                    width: 250,
                    height: 200,
                   
                  ),
                ],
              ),
            ),


           
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'About Car',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(child: CardWidget(
                               imagePath: 'images/engine 11.png',
                              title: " Engine",
                               description: "2.5L Turbocharge",
                            )),
                            SizedBox(width: 16),
                            Expanded(child: CardWidget(
                               imagePath: 'images/color 11.png',
                               title: " Color",
                              description: "Amber Yellow",
                             

                            ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(child: CardWidget(
                               imagePath: 'images/transmission 11.png',
                               title: " Transmission",
                              description: "8 Speed CVT",
                             
                            )),
                            SizedBox(width: 16),
                            Expanded(child: CardWidget(
                               title: " Tinted Window",
                              description: "Black Panthom",
                              imagePath: 'images/carwindow 11.png',
                            )),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(child: CardWidget(
                               title: " Seats",
                              description: "Synthetic Leather",
                              imagePath: 'images/car sit 11.png',
                            )),
                            SizedBox(width: 16),
                            Expanded(child: CardWidget(
                               title: " Add On",
                              description: "360 Camera",
                              imagePath: 'images/camera 11.png',
                            )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),



            SizedBox(height: 24),


            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              
              child: Column(
                
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Key Specifications',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),


                  Container(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(width: 10),
                        Container(  
                          decoration: BoxDecoration(
              borderRadius: BorderRadius.only( 
                topLeft: Radius.circular(50),
                bottomRight: Radius.circular(50)
              ),
             color:Colors.greenAccent,
              boxShadow: const [
                BoxShadow(
                  color:Colors.grey,
                  blurRadius: 1.0,
                  spreadRadius: 1.0
                )
              ]
            ),
                          
                          width: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Image.asset(
                                  'images/103.png',
                                  height: 100,
                                 width: 110,
                                  alignment: Alignment.center,
                                ),
                              ),
                            
                              Text(
                                'Safety Features',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              
                              Text(
                                'Dual Front I-SRS Airbags , Side AirBags , Side Curtain AirBags',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),

//
//
//
//

                         Container(  
                          decoration: BoxDecoration(
              borderRadius: BorderRadius.only( 
                topLeft: Radius.circular(50),
                bottomRight: Radius.circular(50)
              ),
              color:Colors.greenAccent,
              boxShadow: const [
                BoxShadow(
                  color:Colors.grey,
                  blurRadius: 1.0,
                  spreadRadius: 1.0
                )
              ]
            ),
                          
                          width: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Image.asset(
                                  'images/101.png',
                                  height: 100,
                                 width: 110,
                                  alignment: Alignment.center,
                                ),
                              ),
                            
                              Text(
                                'Car Speed',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              
                              Text(
                                'Dual Front I-SRS Airbags , Side AirBags , Side Curtain AirBags',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
//
//
//
//
SizedBox(width: 8,),

                            Container(  
                          decoration: BoxDecoration(
              borderRadius: BorderRadius.only( 
                topLeft: Radius.circular(50),
                bottomRight: Radius.circular(50)
              ),
              color:Colors.greenAccent,
              boxShadow: const [
                BoxShadow(
                  color:Colors.grey,
                  blurRadius: 1.0,
                  spreadRadius: 1.0
                )
              ]
            ),
                          
                          width: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Image.asset(
                                  'images/100.jpg',
                                  height: 300,
                                 width: 300,
                                  alignment: Alignment.center,
                                ),
                              ),
                            
                              Text(
                                'Car Breaks',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              
                              Text(
                                'Dual Front I-SRS Airbags , Side AirBags , Side Curtain AirBags',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),

 SizedBox(width: 8),
                       //
                       //
                       //
                           Container(  
                          decoration: BoxDecoration(
              borderRadius: BorderRadius.only( 
                topLeft: Radius.circular(50),
                bottomRight: Radius.circular(50)
              ),
              color:Colors.greenAccent,
              boxShadow: const [
                BoxShadow(
                  color:Colors.grey,
                  blurRadius: 1.0,
                  spreadRadius: 1.0
                )
              ]
            ),
                          
                          width: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Image.asset(
                                  'images/104.jpg',
                                  height: 100,
                                 width: 110,
                                  alignment: Alignment.center,
                                ),
                              ),
                            
                              Text(
                                'Oil Variations',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              
                              Text(
                                'Dual Front I-SRS Airbags , Side AirBags , Side Curtain AirBags',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                       
                       
                       





                       
                      ],
                    ),
                  ),

                  
                  SizedBox(height: 16),
                  Container(
                     decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color:Color.fromARGB(255, 37, 37, 37),
              boxShadow: const [
                BoxShadow(
                  color:Colors.grey,
                  blurRadius: 1.0,
                  spreadRadius: 1.0
                )
              ]
            ),
                  
                   
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Options For This Car',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Credit  4.5M ETB available',
                          style: TextStyle(
                            color: Colors.red,
                             fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Negotiation 12.4M ETB available',
                          style: TextStyle(
                            color: Colors.yellow,
                             fontWeight: FontWeight.w600,
                            fontSize: 14,
                          
                          ),
                        ),
                        Container(
                          height: 2,
                          color: Colors.greenAccent,
                          margin: EdgeInsets.symmetric(vertical: 4),
                        ),
                        Text(
                          'Full Price  12.5M ETB',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                              fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.greenAccent,
                            elevation: 10,
                            shadowColor: Colors.grey[200],
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1),  
                            ) ,
                          ),
                          onPressed: () {
                            // Navigate to another page here
                          },
                         
                          child: Text('Sell This Car'),
                        ),
                      ],
                    ),



                  ),







               
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




class CardWidget extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

   const CardWidget({super.key, required this.title,required this.description,required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color:Colors.grey[100],
              boxShadow: const [
                BoxShadow(
                  color:Colors.grey,
                  blurRadius: 5.0,
                  spreadRadius: 1.0
                )
              ]
            ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
            height: 50,
            width: 40,
            ),
            Text( title,textAlign: TextAlign.center,  style: TextStyle(fontSize: 7.0, fontWeight: FontWeight.normal), ),
             Text( description,textAlign: TextAlign.right,  style: TextStyle(fontSize: 8.0,fontWeight: FontWeight.bold), ),
          
        ],
      ),
    );
  }
}

