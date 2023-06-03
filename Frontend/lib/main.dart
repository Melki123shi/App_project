import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'application/bloc/BottomNav_bloc.dart';
import 'presentation/login_page.dart';
import './application/bloc/drawer_bloc.dart';
import 'presentation/home.dart';
import 'presentation/signup.dart';
import 'Presentation/adminpanel/admin_panel_page.dart';
import 'Presentation/employee/themainpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<BottomNavigationBloc>(
            create: (context) => BottomNavigationBloc(),
          ),
          BlocProvider<DrawerBloc>(
            create: (_) => DrawerBloc(),),   
        ],
        child:MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      home: HomePage(),
  ),
        
    );
  }
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/user':
        return MaterialPageRoute(builder: (_) => TheMainPage());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage(),);
      case '/admin':
        return MaterialPageRoute(builder: (_) => AdminPanel(),);
      case '/signup':
        return MaterialPageRoute(builder: (_) => Signup());
      default:
        return MaterialPageRoute(builder: (_) => NotFoundPage());
    }
  }
}
class NotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Not Found')),
      body: Center(
        child: Text('Page not found.'),
      ),
    );
  }
}
