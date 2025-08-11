import 'package:aegis_vpn/sign_up/sign_up_screen.dart';
import 'package:aegis_vpn/sing_in/sign_In_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // Высота фонового изображения сделана динамической: 35% от высоты экрана, но максимум 500
    final double backgroundImageHeight =
        size.height * 0.70 > 500 ? 500 : size.height * 0.35;

    // Шрифты тоже можно масштабировать относительно ширины экрана
    final double titleFontSize =
        size.width * 0.08 > 30 ? 30 : size.width * 0.08;
    final double subtitleFontSize =
        size.width * 0.04 > 14 ? 14 : size.width * 0.04;
    final double buttonFontSize =
        size.width * 0.05 > 20 ? 20 : size.width * 0.05;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Image.asset('assets/images/logo.png', height: 50, width: 150),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.05,
            ), // Отступ сверху 5% высоты экрана
            SizedBox(
              width: double.infinity,
              height: backgroundImageHeight,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/Frame 2085661581.png',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.7),
                          Colors.transparent,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05,
                ), // Отступы 5% от ширины экрана
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: titleFontSize,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                        children: const [
                          TextSpan(text: 'Добро пожаловать \nв '),
                          TextSpan(
                            text: 'Aegis VPN!',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ), // Отступ 2% от высоты экрана
                    Text(
                      'Погрузись в свободный интернет \nбез ограничений скорости',
                      style: TextStyle(
                        fontSize: subtitleFontSize,
                        fontWeight: FontWeight.w400,
                        color: Colors.white38,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: size.height * 0.06,
                    ), // Отступ 6% от высоты экрана
                    SizedBox(
                      height: size.height * 0.07 > 55 ? 55 : size.height * 0.07,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const SignUpScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.02,
                          ),
                          overlayColor: Colors.black12,
                        ),
                        child: Text(
                          'Создать аккаунт',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: buttonFontSize,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.015), // Отступ 1.5% высоты
                    SizedBox(
                      height: size.height * 0.07 > 55 ? 55 : size.height * 0.07,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const SignInScreen(),
                            ),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide.none,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.02,
                          ),
                          overlayColor: Colors.white12,
                        ),
                        child: Text(
                          'Войти',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: buttonFontSize,
                          ),
                        ),
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
  }
}
