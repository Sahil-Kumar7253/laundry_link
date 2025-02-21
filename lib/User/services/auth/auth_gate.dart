import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:laundry_link/User/Screens/HomePage.dart';
import 'LogorReg.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot){
            if(snapshot.hasData && snapshot.data != null){
              return const Homepage();
            }else{
              return const LogOrReg();
            }
          }
      ),
    );
  }
}
