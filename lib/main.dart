import 'package:flutter/material.dart';

import 'package:provider/provider.dart'; 

import './providers/receiver_list.dart';
import './screens/user_editing_screen.dart';
import './screens/loan_receiver_list_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: LoanReceiver(),
          child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.amber,
            accentColor: Color.fromRGBO(101,188,144,1),
            primaryColor: Color.fromRGBO(126,206,147,1), 
          ),
          home: LoanReceiverScreen(),
          routes: {
            UserEditingScreen.routeName : (ctx)=> UserEditingScreen(),
          },
        ),
    );
  }
} 