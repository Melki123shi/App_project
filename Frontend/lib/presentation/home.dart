import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _imageUrls = [
    'images/car2.jpg',
    'images/car3.jpg',
    'images/car1.jpg',
  ];
  List<String> _textList1 = [
    'Welcome Employee!',
    "Let's make car buying hassle-free",
    'Be the reason someone buys today.'
  ];
  List<String> _textList2 = [
    'Be passionate about your product, and it will show in your sales. Know it inside out and share that knowledge.',
    'Treat every customer with respect, empathy, and understanding. You never know what someone is going through.',
    'the best salespeople are not the ones who talk the most, but the ones who listen and provide solutions.'
  ];

  List<Color> _iconColors = [Colors.white, Colors.grey, Colors.grey];
  int _currentIndex = 0;

  void _changeSlide() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _imageUrls.length;

      for (int i = 0; i < _iconColors.length; i++) {
        if (i == _currentIndex) {
          _iconColors[i] = Colors.yellow;
        } else {
          _iconColors[i] = Colors.grey;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 90,
          ),
          GestureDetector(
            onTap: _changeSlide,
            child: Column(
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image.asset(
                      height: MediaQuery.of(context).size.height * 0.35,
                      width: MediaQuery.of(context).size.width * 0.9,
                      _imageUrls[_currentIndex],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _iconColors.map((color) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                  Icons.circle,
                  size: 10.0,
                  color: color,
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: Text(
              _textList1[_currentIndex],
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22.0,
              ),
            ),
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: Text(
              _textList2[_currentIndex],
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
              ),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Get Started',
                        style: TextStyle(fontSize: 20.0, color: Colors.black)),
                    Icon(
                      Icons.start_sharp,
                      color: Colors.black,
                    )
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.yellow,
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
