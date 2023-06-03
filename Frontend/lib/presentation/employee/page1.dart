import 'package:flutter/material.dart';
import 'package:oneone/Presentation/widget/imgwithdescri.dart';
import 'package:oneone/Presentation/widget/profile_widget.dart';
import '../../Presentation/widget/drawer_widget.dart';
import '../../application/model/car.dart';
import 'detailsPage.dart';

class EmployeePage extends StatefulWidget {
  final List<CardItem> cardItems;
  const EmployeePage({
    super.key,
    required this.cardItems,
  });

  @override
  // ignore: library_private_types_in_public_api
  _EmployeePageState createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  late List<CardItem> _filteredCardItems;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _filteredCardItems = widget.cardItems;
    _searchController = TextEditingController();
    _searchController.addListener(() {
      setState(() {
        final query = _searchController.text.trim().toLowerCase();
        if (query.isEmpty) {
          _filteredCardItems = widget.cardItems;
        } else {
          _filteredCardItems = widget.cardItems
              .where((item) => item.name.toLowerCase().contains(query))
              .toList();
        }
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _navigateToDetailsPage(CardItem item) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => DetailsPage(item: item),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 37, 37, 37),
      drawer: DrawerWidget(),
      appBar:AppBar(
        backgroundColor: const Color.fromARGB(255, 37, 37, 37),
        elevation: 5,
       
         actions: [ProfileWidget()], 
         title: TextField(

          controller: _searchController,
          decoration:  InputDecoration(

           iconColor: Colors.white,
                        hintText: 'What are you looking for?',
                         hintStyle: const TextStyle( 
                          color: Colors.white,
                        ),
                        
                         fillColor:Colors.white, 
                        border: InputBorder.none,
                        contentPadding:  const EdgeInsets.symmetric(horizontal: 16, vertical:16),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(16)
                        ),
                        
          ),
          style: const TextStyle( color: Colors.white),
          
        ),

        
        
      ),
      body: ListView.builder(
        itemCount: _filteredCardItems.length,
        itemBuilder: (context, index) {
          final item = _filteredCardItems[index];
          return GestureDetector(
            onTap: () => _navigateToDetailsPage(item),
            child: Container(
              height: 180,
              margin: const EdgeInsets.fromLTRB(28, 5, 28, 5),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.white, Colors.white24],
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Column(
                            children: [
                              Text(
                                item.firstText,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Text(
                                item.secondText,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Expanded(
                            child: Image.asset(
                              item.imagePath,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ImgDescription(
                                  description: '12.5M ETB',
                                  imagePath: 'images/107.png',
                                ),
                                ImgDescription(
                                  description:'1000cc',
                                  imagePath: 'images/111.png',
                                ),
                                ImgDescription(
                                  description: '1000bhp',
                                  imagePath: 'images/100.jpg',
                                ),
                                ImgDescription(
                                  description: '1000km/hr',
                                  imagePath: 'images/101.png',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

