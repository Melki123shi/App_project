import 'package:flutter/material.dart';
import '../../application/model/car.dart';
import 'fullPricePage.dart';
import 'custem_appbar.dart';
import '../../Presentation/widget/cardwidget.dart';

class DetailsPage extends StatelessWidget {
  final CardItem item;

  const DetailsPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color.fromARGB(255, 37, 37, 37),
    appBar: CustomAppBar(
      onBackArrowPressed: () => Navigator.pop(context), // callback for back arrow// user avatar image path
),



      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
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
                  const SizedBox(width: 16),
                  Image.asset(
                    'images/carpcard6.png',
                    width: 250,
                    height: 200,
                   
                  ),
                ],
              ),
            ),


           
            const Padding(
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
                            color: Colors.white
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(child: CardWidget(
                               imagePath: 'images/engine 11.png',
                              title: " Engine",
                               description: "2.5L Turbocharge"
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



            const SizedBox(height: 24),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              
              child: Column(
                
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Key Specifications',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),


                  SizedBox(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        const SizedBox(width: 10),
                        Container(  
                          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only( 
                topLeft: Radius.circular(50),
                bottomRight: Radius.circular(50)
              ),
             color:Colors.amber,
              boxShadow: [
                BoxShadow(
                  color:Colors.grey,
                  blurRadius: 0.5,
                  spreadRadius: 0.5
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
                            
                              const Text(
                                'Safety Features',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              
                              const Text(
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
                        const SizedBox(width: 10),

//
//
//
//

                         Container(  
                          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only( 
                topLeft: Radius.circular(50),
                bottomRight: Radius.circular(50)
              ),
              color:Colors.amber,
              boxShadow: [
                BoxShadow(
                  color:Colors.grey,
                  blurRadius: 0.5,
                  spreadRadius: 0.5
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
                            
                              const Text(
                                'Car Speed',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              
                              const Text(
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
const SizedBox(width: 8,),

                            Container(  
                          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only( 
                topLeft: Radius.circular(50),
                bottomRight: Radius.circular(50)
              ),
              color:Colors.amber,
              boxShadow: [
                BoxShadow(
                  color:Colors.grey,
                  blurRadius: 0.5,
                  spreadRadius: 0.5
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
                            
                              const Text(
                                'Car Breaks',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              
                              const Text(
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

 const SizedBox(width: 8),
                       //
                       //
                       //
                           Container(  
                          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only( 
                topLeft: Radius.circular(50),
                bottomRight: Radius.circular(50)
              ),
              color:Colors.amber,
              boxShadow: [
                BoxShadow(
                  color:Colors.grey,
                  blurRadius: 0.5,
                  spreadRadius: 0.5
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
                            
                              const Text(
                                'Oil Variations',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              
                              const Text(
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

                  
                  const SizedBox(height: 16),
                  Container(
                     decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color:Color.fromARGB(255, 37, 37, 37),
              boxShadow: [
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
                        const Text(
                          'Options For This Car',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Credit  4.5M ETB available',
                          style: TextStyle(
                            color: Colors.white,
                             fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Negotiation 12.4M ETB available',
                          style: TextStyle(
                            color: Colors.white,
                             fontWeight: FontWeight.w600,
                            fontSize: 14,
                          
                          ),
                        ),
                        Container(
                          height: 2,
                          color: Colors.grey[100],
                          margin: const EdgeInsets.symmetric(vertical: 4),
                        ),
                        const Text(
                          'Full Price  12.5M ETB',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                              fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.amber,
                                elevation: 10,
                                shadowColor: Colors.grey[200],
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                shape:RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),  
                                ) ,
                              ),
                              onPressed: () {
                                  Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const FullPricePage ()),
                                );
                                // Navigate to another page here
                              },
                             
                              child: const Text('Sell This Car'),
                            ),
                          ],
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