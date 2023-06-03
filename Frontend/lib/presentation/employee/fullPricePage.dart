
// ignore_for_file: library_private_types_in_public_ap
import 'package:flutter/material.dart';

import 'creditPage.dart';
import 'custem_appbar.dart';
import 'negotiatePage.dart';



class FullPricePage extends StatefulWidget {
  const FullPricePage ({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FullPricePage  createState() => _FullPricePage ();
}

class _FullPricePage  extends State<FullPricePage > {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color.fromARGB(255, 37, 37, 37),
    appBar: CustomAppBar(
      onBackArrowPressed: () => Navigator.pop(context), // callback for back arrow// user avatar image path
),
      body:SingleChildScrollView(
        child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 ElevatedButton(
                   onPressed: () {
                              Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const FullPricePage()),
                            );
                          },
                          
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                            elevation: 5,
                            shadowColor: Colors.grey[10],
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),  
                            ) ,
                          ),
                         
                         
                          child: const Text('Full Price' ,style:  TextStyle( color: Colors.black),),
                        ),
               
                 ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[100],
                            elevation: 5,
                            shadowColor: Colors.grey[10],
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),  
                            ) ,
                          ),
                          onPressed: () {
                              Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const CreditPage()),
                            );
                            // Navigate to another page here
                          },
                         
                          child: const Text('Via Credit' , style:  TextStyle( color: Colors.black),),
                        ),


                 ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[100],
                            elevation: 5,
                            shadowColor: Colors.grey[10],
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),  
                            ) ,
                          ),
                          onPressed: () {
                              Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const NegotiatePage()),
                            );
                            // Navigate to another page here
                          },
                         
                          child: const Text('Negotiate',style:  TextStyle( color: Colors.black),),
                        ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'AUDI A8',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      Text('Price 12.5M', 
                       style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      Text('ID 1078',
                       style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                'images/carpcard6.png',
                  height: 130,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sell With Full Price Of 12.5M ETB',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                         const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        iconColor: Colors.white,
                        hintText: 'Employees  Name',
                        hintStyle: const TextStyle( 
                          color: Colors.white,
                        ),
                        fillColor:Colors.white, 
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical:10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(16)
                        )

                        
                      ),
                    ),
                  ),
                   
                  ],
                ),
                

           
              const SizedBox(height: 12,),
                    ElevatedButton(
              onPressed: (){},
                style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[100],
                            elevation: 5,
                            shadowColor: Colors.grey[10],
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),  
                            ) ,
                          ),
              
              child: const Text('Sell Car' ,style:  TextStyle( color: Colors.black),), )
          ],
        )     //
                  
                
              
            ),


          
        ],
      ),
      )
    );
  }


}