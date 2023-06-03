import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oneone/Presentation/adminpanel/admincars.dart';
import '../../application/bloc/BottomNav_bloc.dart';
import '../../application/event/BottomNav_Event.dart';
import '../../application/model/car.dart';
import 'page1.dart';
import '../widget/drawer_widget.dart';


class TheMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, int>(
      builder: (context, selectedIndex) {
        return Scaffold(
          drawer: DrawerWidget(),
          body: IndexedStack(
            index: selectedIndex,
            children: [
              EmployeePage(cardItems: cardItems),
              AnotherPage(),
              AnotherPage(),
              AnotherPage()
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.yellow,
          unselectedItemColor: Colors.grey,
            currentIndex: selectedIndex,
            onTap: (index) {
              switch (index) {
                case 0:
                  context.read<BottomNavigationBloc>().add(BottomNavigationEvent.home);
                  break;
                case 1:
                  context.read<BottomNavigationBloc>().add(BottomNavigationEvent.mysolds);
                  break;
                case 2:
                  context.read<BottomNavigationBloc>().add(BottomNavigationEvent.creditrequest);
                  break;
                  case 3:
                  context.read<BottomNavigationBloc>().add(BottomNavigationEvent.setting);
                  
              }
            },
            items: [
             BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.car_rental),
              label: 'My Solds',
            ),
             BottomNavigationBarItem(
              icon: Icon(Icons.credit_score),
              label: 'Credit Request',),
            
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
            ],
          ),
        );
      },
    );
  }
}