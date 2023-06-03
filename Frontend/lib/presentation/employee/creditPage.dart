
// ignore_for_file: library_private_types_in_public_api

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

import 'custem_appbar.dart';
import 'file_list.dart';
import 'fullPricePage.dart';
import 'negotiatePage.dart';


class CreditPage extends StatefulWidget {
  const CreditPage({super.key});

  @override
  _CreditPage createState() => _CreditPage();
}

class _CreditPage extends State<CreditPage> {
  String fileType = 'All';
  var fileTypeList = ['All', 'Image','MultipleFile'];

  FilePickerResult? result;
  PlatformFile? file;
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
                            backgroundColor: Colors.grey[100],
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
                             backgroundColor: Colors.amber,
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
                  'Credit Request Form',
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
                        hintText: 'Customers Name',
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
                 const SizedBox(height: 16),

           
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        iconColor: Colors.white,
                        hintText: 'Employees Name',
                           hintStyle: const TextStyle( 
                          color: Colors.white,
                        ),
                        fillColor:Colors.white, 
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical:16),
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
                  ),]
                ),
                  const SizedBox(width: 5),

                    Column(                    
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                    DropdownButton(
                      dropdownColor: Colors.grey[900],
                      elevation: 15,
                      value: fileType,
                      items: fileTypeList.map((String type) {
                        return DropdownMenuItem(
                            value: type,
                            child: Text(
                              type,
                              style: const TextStyle(fontSize: 16 , 
                              color: Colors.white),
                            ));
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          fileType = value!;
                          file = null;
                        });
                      },
                    ),
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                    pickFiles(fileType);},
                     style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[100],
                            elevation: 5,
                            shadowColor: Colors.grey[10],
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),  
                            ) ,
                          ),
              child: const Text('Pick file',style:  TextStyle( color: Colors.black),),
            ),
            if (file != null) fileDetails(file!),
            if (file != null) 
            ElevatedButton(
              onPressed: (){
                viewFile(file!);
                },
                style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[100],
                            elevation: 5,
                            shadowColor: Colors.grey[10],
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),  
                            ) ,
                          ),
              
              child: const Text('View Selected File',style:  TextStyle( color: Colors.black),),),
              const SizedBox(height: 8.0,),
                    ElevatedButton(
              onPressed: (){

              },
                style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[100],
                            elevation: 5,
                            shadowColor: Colors.grey[10],
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),  
                            ) ,
                          ),
              
              child: const Text('Request Credit' ,style:  TextStyle( color: Colors.black),), )
          ],
        )     //
                  ],
                
              
            ),


          ),
        ],
      ),
      )
    );
  }


   Widget fileDetails(PlatformFile file){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('File Name: ${file.name}'),
        ],
      ),
    );

  }

  void pickFiles(String? filetype) async {
    switch (filetype) {
      case 'Image':
        result = await FilePicker.platform.pickFiles(type: FileType.image);
        if (result == null) return;
        file = result!.files.first;
        setState(() {});
        break;
      case 'All':
        result = await FilePicker.platform.pickFiles();
        if (result == null) return;
        file = result!.files.first;
        setState(() {});
        break;
      
    }
  }

  // multiple file selected
  // navigate user to 2nd screen to show selected files
  void loadSelectedFiles(List<PlatformFile> files){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => FileList(files: files, onOpenedFile:viewFile ))
    );
  }

  // open the picked file
  void viewFile(PlatformFile file) {
    OpenFile.open(file.path);
  }
}

