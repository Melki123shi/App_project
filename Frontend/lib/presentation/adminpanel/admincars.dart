import 'package:flutter/material.dart';
import '../../Presentation/widget/profile_widget.dart';
import '../../Presentation/employee/page1.dart';
import '../../Presentation/widget/drawer_widget.dart';
import '../../application/model/car.dart';


class AdminCars extends StatelessWidget {
  const AdminCars({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 37, 37, 37),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 37, 37, 37),
        elevation: 5,
        actions: [ProfileWidget()],
      ),

//body starts
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              padding: const EdgeInsets.all(1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Brands',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  const SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        const SizedBox(width: 30),

//buttons starts here

                        //button 1 starts
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AnotherPage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                            elevation: 10,
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 27,
                                width: 60,
                                child: Image.asset(
                                  'images/1.png',
                                  width: double.maxFinite,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Padding(
                                padding: EdgeInsets.all(1.0),
                                child: Text(
                                  'Audi',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 8,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // button 2
                        const SizedBox(width: 10),
                        //button 1 starts
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AnotherPage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                            elevation: 10,
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 27,
                                width: 60,
                                child: Image.asset(
                                  'images/2.png',
                                  width: double.maxFinite,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Padding(
                                padding: EdgeInsets.all(1.0),
                                child: Text(
                                  'SUV',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 8,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //button 3
                        const SizedBox(width: 10),
                        //button 1 starts
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AnotherPage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                            elevation: 10,
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 39,
                                width: 60,
                                child: Image.asset(
                                  'images/8.png',
                                  width: double.maxFinite,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(1.0),
                                child: Text(
                                  'Toyota',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 8,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //button 5
                        const SizedBox(width: 10),
                        //button 1 starts
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AnotherPage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                            elevation: 10,
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 27,
                                width: 60,
                                child: Image.asset(
                                  'images/10.png',
                                  width: double.maxFinite,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Padding(
                                padding: EdgeInsets.all(1.0),
                                child: Text(
                                  'Hyundai',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 8,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //button 6
                        const SizedBox(width: 10),
                        //button 1 starts
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AnotherPage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                            elevation: 10,
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 28,
                                width: 60,
                                child: Image.asset(
                                  'images/6.png',
                                  width: 90,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Padding(
                                padding: EdgeInsets.all(1.0),
                                child: Text(
                                  'Wuling',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 8,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //button 5
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ),
//
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Top Saling Cars',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),

//first card
//
//
//
//
//
                  const SizedBox(height: 5),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        //first card
                        //
                        //
                        //
                        //

                        Card(
                          color: Colors.amber,
                          child: Stack(
                            children: [
                              SizedBox(
                                height: 300,
                                width: 300,
                                child: Image.asset(
                                  'images/image1.png',
                                  height: 100,
                                  width: 50,
                                ),
                              ), //large image

                              Positioned(
                                top: -1,
                                right: -15,
                                child: Image.asset(
                                  'images/first place1.png',
                                  height: 100,
                                  width: 100,
                                ),
                              ),

                              //small image
                              Positioned(
                                bottom: 10,
                                right: 6,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Hyundai',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              Positioned(
                                bottom: 10,
                                left: 120,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      '12M ETB',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 10),
                              Positioned(
                                bottom: 10,
                                left: 20,
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CustomPaint(
                                    painter: CircleArcPainter(
                                      percentage: 75,
                                      colors: [
                                        const Color.fromARGB(255, 208, 243, 33),
                                        const Color.fromARGB(255, 42, 45, 47),
                                      ],
                                    ),
                                    child: const Center(
                                      child: Text(
                                        '75%',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AnotherPage()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 35, 35, 35),
                                  elevation: 20,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                                child: const Text('Detail'),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        Card(
                          color: Colors.amber,
                          child: Stack(
                            children: [
                              SizedBox(
                                height: 300,
                                width: 300,
                                child: Image.asset(
                                  'images/image1.png',
                                  height: 100,
                                  width: 50,
                                ),
                              ), //large image

                              Positioned(
                                top: -1,
                                right: -15,
                                child: Image.asset(
                                  'images/second place1.png',
                                  height: 100,
                                  width: 100,
                                ),
                              ),

                              //small image
                              Positioned(
                                bottom: 10,
                                right: 6,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Hyundai',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              Positioned(
                                bottom: 10,
                                left: 120,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      '12M ETB',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 10),
                              Positioned(
                                bottom: 10,
                                left: 20,
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CustomPaint(
                                    painter: CircleArcPainter(
                                      percentage: 55,
                                      colors: [
                                        const Color.fromARGB(255, 208, 243, 33),
                                        const Color.fromARGB(255, 42, 45, 47),
                                      ],
                                    ),
                                    child: const Center(
                                      child: Text(
                                        '55%',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AnotherPage()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 35, 35, 35),
                                  elevation: 20,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                                child: const Text('Detail'),
                              ),
                            ],
                          ),
                        ),
                        //
                        //

//
//
//
//third card
//
//
                        const SizedBox(height: 5),
                        Card(
                          color: Colors.amber,
                          child: Stack(
                            children: [
                              SizedBox(
                                height: 300,
                                width: 300,
                                child: Image.asset(
                                  'images/cardpcard3.png',
                                  height: 100,
                                  width: 50,
                                ),
                              ), //large image

                              Positioned(
                                top: -1,
                                right: -15,
                                child: Image.asset(
                                  'images/third place1.png',
                                  height: 100,
                                  width: 100,
                                ),
                              ),

                              //small image
                              Positioned(
                                bottom: 10,
                                right: 6,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Hyundai',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              Positioned(
                                bottom: 10,
                                left: 120,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      '12M ETB',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 10),
                              Positioned(
                                bottom: 10,
                                left: 20,
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CustomPaint(
                                    painter: CircleArcPainter(
                                      percentage: 40,
                                      colors: [
                                        const Color.fromARGB(255, 208, 243, 33),
                                        const Color.fromARGB(255, 42, 45, 47),
                                      ],
                                    ),
                                    child: const Center(
                                      child: Text(
                                        '40%',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AnotherPage()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 35, 35, 35),
                                  elevation: 20,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                                child: const Text('Detail'),
                              ),
                            ],
                          ),
                        ),

                        //fourth card
                        //
                        //
                        //
                        const SizedBox(height: 5),
                        Card(
                          color: Colors.amber,
                          child: Stack(
                            children: [
                              SizedBox(
                                height: 300,
                                width: 300,
                                child: Image.asset(
                                  'images/carpcard2.webp',
                                  height: 100,
                                  width: 50,
                                ),
                              ), //large image

                              //small image
                              Positioned(
                                bottom: 10,
                                right: 6,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Hyundai',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              Positioned(
                                bottom: 10,
                                left: 120,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      '12M ETB',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 10),
                              Positioned(
                                bottom: 10,
                                left: 20,
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CustomPaint(
                                    painter: CircleArcPainter(
                                      percentage: 35,
                                      colors: [
                                        const Color.fromARGB(255, 208, 243, 33),
                                        const Color.fromARGB(255, 42, 45, 47),
                                      ],
                                    ),
                                    child: const Center(
                                      child: Text(
                                        '35%',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AnotherPage()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 35, 35, 35),
                                  elevation: 20,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                                child: const Text('Detail'),
                              ),
                            ],
                          ),
                        ),
                        //
                        //
                        //
                        //
                        //
                        //fifth card
                        const SizedBox(height: 5),
                        Card(
                          color: Colors.amber,
                          child: Stack(
                            children: [
                              SizedBox(
                                height: 300,
                                width: 300,
                                child: Image.asset(
                                  'images/carpcard4.png',
                                  height: 100,
                                  width: 50,
                                ),
                              ), //large image

                              //small image
                              Positioned(
                                bottom: 10,
                                right: 6,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Hyundai',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              Positioned(
                                bottom: 10,
                                left: 120,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      '12M ETB',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 10),
                              Positioned(
                                bottom: 10,
                                left: 20,
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CustomPaint(
                                    painter: CircleArcPainter(
                                      percentage: 30,
                                      colors: [
                                        const Color.fromARGB(255, 208, 243, 33),
                                        const Color.fromARGB(255, 42, 45, 47),
                                      ],
                                    ),
                                    child: const Center(
                                      child: Text(
                                        '30%',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AnotherPage()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 35, 35, 35),
                                  elevation: 20,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                                child: const Text('Detail'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

//second card
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.amber),
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  EmployeePage(cardItems: cardItems)),
                        );
                      },
                      child: const Text(
                        'Availabel Cars',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.amber),
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const YetAnotherPage()),
                        );
                      },
                      child: const Text(
                        'Sold Out Cars',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
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

class AnotherPage extends StatelessWidget {
  const AnotherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 37, 37, 37),
        elevation: 5,
        actions: [ProfileWidget()],
      ),
      drawer:DrawerWidget(),
      body: const Center(
        child: Text('This is another page.'),
      ),
    );
  }
}

class YetAnotherPage extends StatelessWidget {
  const YetAnotherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 37, 37, 37),
        elevation: 5,
        actions: [ProfileWidget()],
      ),
      body: const Center(
        child: Text('This is yet another page.'),
      ),
    );
  }
}

class CircleArcPainter extends CustomPainter {
  final double percentage;
  final List<Color> colors;

  CircleArcPainter({
    required this.percentage,
    required this.colors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;

    Paint paint = Paint()
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Rect rect = Rect.fromLTWH(0, 0, width, height);
    canvas.drawArc(
      rect,
      0,
      (percentage / 100) * (2 * 3.14),
      false,
      paint..color = colors[0],
    );

    canvas.drawArc(
      rect,
      (percentage / 100) * (2 * 3.14),
      (1 - percentage / 100) * (2 * 3.14),
      false,
      paint..color = colors[1],
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function() onBackArrowPressed; // callback function for back arrow
  final String avatarImage; // user avatar image path

  const CustomAppBar(
      {Key? key, required this.onBackArrowPressed, required this.avatarImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 242, 213, 46),
      leading: IconButton(
        // arrow button
        icon: const Icon(Icons.arrow_back),
        onPressed: onBackArrowPressed,
      ),
      title: const Text(
        'Your Cars',
        style: TextStyle(
          color: Color.fromARGB(255, 1, 1, 1),
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
      shape: const ContinuousRectangleBorder(
        // curved shape
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      actions: [
        Container(
          // user avatar
          margin: const EdgeInsets.only(right: 16),
          child: CircleAvatar(
            backgroundImage: AssetImage(avatarImage),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight + 20); // adjust height as needed
}
