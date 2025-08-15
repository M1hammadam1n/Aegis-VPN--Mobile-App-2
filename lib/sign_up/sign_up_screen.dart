import 'package:aegis_vpn/sign_up/sing_up_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isSmallScreen = size.height < 700;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Верхняя картинка
            Padding(
              padding: EdgeInsets.only(top: isSmallScreen ? 10 : 20),
              child: Image.asset(
                'assets/images/singin.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: isSmallScreen ? size.height * 0.25 : null,
              ),
            ),

            // Основной блок с фоном и содержимым
            Expanded(
              child: Stack(
                children: [
                  // Фон
                  Positioned.fill(
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          'assets/images/map-base 1 1.png',
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.7),
                                Colors.transparent,
                                Colors.black.withOpacity(0.6),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: const [0.0, 0.5, 1.0],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isSmallScreen ? 20 : 30,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Spacer(flex: 2),
                        Text(
                          'Регистрация',
                          style: TextStyle(
                            fontSize: isSmallScreen ? 34 : 42,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(height: isSmallScreen ? 8 : 12),

                        Text(
                          'Создайте аккаунт любым удобным \nдля вас методом, доступным ниже.',
                          style: TextStyle(
                            fontSize: isSmallScreen ? 16 : 18,
                            color: Colors.white70,
                            height: 1.4,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        const Spacer(flex: 3),

                        _buildAuthButton(
                          context: context,
                          iconWidget: SvgPicture.asset(
                            'assets/icons/66666.svg',
                            width: 24,
                            height: 24,
                          ),
                          text: 'Продолжить с E-Mail',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SingUpEmail(),
                              ),
                            );
                          },
                          isPrimary: true,
                        ),

                        SizedBox(height: isSmallScreen ? 12 : 16),

                        Row(
                          children: [
                            Expanded(
                              child: _buildAuthButton(
                                context: context,
                                iconWidget: SvgPicture.asset(
                                  'assets/icons/AppleOriginal.svg',
                                  width: 24,
                                  height: 24,
                                ),
                                text: 'Apple',
                                onPressed: () {},
                              ),
                            ),

                            SizedBox(width: isSmallScreen ? 8 : 12),

                            Expanded(
                              child: _buildAuthButton(
                                context: context,
                                iconWidget: SvgPicture.asset(
                                  'assets/icons/google.svg',
                                  width: 24,
                                  height: 24,
                                ),
                                text: 'Google',
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: isSmallScreen ? 16 : 24),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAuthButton({
    required BuildContext context,
    required Widget iconWidget,
    required String text,
    required VoidCallback onPressed,
    bool isPrimary = false,
  }) {
    final size = MediaQuery.of(context).size;
    final bool isSmallScreen = size.height < 700;

    return SizedBox(
      height: isSmallScreen ? 56 : 65,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isPrimary ? Colors.white : const Color(0xFF191919),
          foregroundColor: isPrimary ? Colors.black : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          padding: EdgeInsets.zero,
          splashFactory: NoSplash.splashFactory,
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: isSmallScreen ? 24 : 28,
              height: isSmallScreen ? 24 : 28,
              child: iconWidget,
            ),

            SizedBox(width: isSmallScreen ? 8 : 12),

            Text(
              text,
              style: TextStyle(
                fontSize: isSmallScreen ? 18 : (isPrimary ? 22 : 18),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
