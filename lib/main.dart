import 'package:aegis_vpn/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyVPNApp());
}

class MyVPNApp extends StatelessWidget {
  const MyVPNApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VPN App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SplashScreen(),
    );
  }
}
