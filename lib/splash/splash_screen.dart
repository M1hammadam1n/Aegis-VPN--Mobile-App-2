import 'package:aegis_vpn/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const WelcomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Картинка карты прижата к низу
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/images/map-base 1 1.png',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),

          // Градиент сверху (эффект "солнца")
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                  colors: [
                    Color(0xFFFFA500), // жёлто-оранжевый
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Логотип в центре
          Center(
            child: Image.asset(
              'assets/images/aegisvpn_new_page-0003 1.png',
              fit: BoxFit.contain,
              width: MediaQuery.of(context).size.width * 0.6,
            ),
          ),

          // Текст внизу
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: const Text(
                'Ваш личный VPN',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
