import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'API/Characters/View.dart';
import 'API/login/login_view.dart';
import 'API/register/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sp =await SharedPreferences.getInstance();
  final isLoggedIn =sp.getString('token') !=null;
  runApp(MyApp(
    home: isLoggedIn ? CharactersView():RegisterView(),
  ));
}

class MyApp  extends StatelessWidget {
  const MyApp ({Key? key, required this.home}) : super(key: key);

  final Widget home;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home:LoginView(),
    );
  }
}
