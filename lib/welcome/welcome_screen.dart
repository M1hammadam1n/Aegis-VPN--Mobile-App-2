import 'package:aegis_vpn/sign_up/sign_up_screen.dart';
import 'package:aegis_vpn/sing_in/sign_In_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isSmallScreen = size.height < 600;
    // Рассчитываем динамические отступы, которые будут меньше на маленьких экранах
    final double verticalSpacingLarge =
        size.height < 600 ? size.height * 0.05 : size.height * 0.08;
    final double verticalSpacingSmall =
        size.height < 600 ? size.height * 0.008 : size.height * 0.01;
    final double buttonHeight = size.height < 600 ? 44 : 55;

    // Размеры изображения с учетом пропорций
    final double imageAspectRatio =
        375 / 812; // Примерное соотношение сторон оригинального изображения
    final double backgroundImageHeight =
        isSmallScreen
            ? size.width / imageAspectRatio * 0.5
            : (size.width / imageAspectRatio).clamp(200, 500);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Image.asset(
          'assets/images/logo.png',
          height: isSmallScreen ? 40 : 50,
          width: isSmallScreen ? 120 : 150,
        ),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            // Центрированное изображение
            Center(
              child: SizedBox(
                width: size.width,
                height: backgroundImageHeight,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        'assets/images/Frame 2085661581.png',
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
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
            ),
            // Остальной контент с адаптивным паддингом и отступом снизу для navbar
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: (size.width * 0.05).clamp(16, 32),
                  right: (size.width * 0.05).clamp(16, 32),
                  bottom:
                      MediaQuery.of(context).padding.bottom +
                      16, // Вот этот отступ!
                ),
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            fontSize:
                                isSmallScreen
                                    ? size.width * 0.07
                                    : (size.width * 0.08).clamp(24, 36),
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            height: 1.2,
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
                        height:
                            isSmallScreen
                                ? size.height * 0.010
                                : size.height * 0.020,
                      ),
                      Text(
                        'Погрузись в свободный интернет \nбез ограничений скорости',
                        style: TextStyle(
                          fontSize:
                              isSmallScreen
                                  ? size.width * 0.035
                                  : (size.width * 0.04).clamp(12, 16),
                          fontWeight: FontWeight.w400,
                          color: Colors.white38,
                          height: 1.4,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: verticalSpacingLarge),
                      SizedBox(
                        height: buttonHeight,
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
                            overlayColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          child: Text(
                            'Создать аккаунт',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: (size.width * 0.05).clamp(14, 22),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: verticalSpacingSmall),
                      TextButton(
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(
                            Colors.transparent,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const SignInScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Войти',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: (size.width * 0.05).clamp(14, 22),
                          ),
                        ),
                      ),

                      // Добавляем нижний отступ, чтобы не прятаться за navbar:
                      SizedBox(
                        height: MediaQuery.of(context).padding.bottom + 14,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
