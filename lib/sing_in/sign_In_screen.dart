import 'package:aegis_vpn/sing_in/sing_in_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    // Базовые размеры под которые верстался макет
    const baseWidth = 390.0;
    const baseHeight = 844.0;

    // Коэффициенты масштабирования
    final scaleW = width / baseWidth;
    final scaleH = height / baseHeight;
    final scale = scaleW < scaleH ? scaleW : scaleH; // чтобы не перекашивало

    // Динамические размеры с учетом масштаба
    double titleFontSize = (28 * scale).clamp(20, 36);
    double subtitleFontSize = (14 * scale).clamp(12, 16);
    double buttonHeight = (60 * scale).clamp(50, 70);
    double iconSize = (24 * scale).clamp(18, 28);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 24 * scale),
              child: SizedBox(
                height: height * 0.2,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/singin.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Expanded(
              child: Stack(
                children: [
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
                      horizontal: 20 * scale,
                    ).copyWith(top: height * 0.1, bottom: 24 * scale),
                    child: Column(
                      children: [
                        Text(
                          'Вход в аккаунт',
                          style: TextStyle(
                            fontSize: titleFontSize,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8 * scale),
                        Text(
                          'Войдите в аккаунт любым удобным \nдля вас методом, доступным ниже.',
                          style: TextStyle(
                            fontSize: subtitleFontSize,
                            color: Colors.white38,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        const Spacer(),

                        // Пример кнопки с иконкой
                        SizedBox(
                          width: double.infinity,
                          height: buttonHeight,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SingInEmail(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              overlayColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12 * scale),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/66666.svg',
                                  width: iconSize,
                                  height: iconSize,
                                ),
                                SizedBox(width: 8 * scale),
                                Text(
                                  'Войти с E-Mail',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: (16 * scale).clamp(12, 20),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: height * 0.015),

                        SizedBox(
                          width: double.infinity,
                          height: buttonHeight,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF191919),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: buttonHeight * 0.25,
                              ),
                              overlayColor: Colors.black,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset('assets/icons/Telegram.svg'),

                                SizedBox(width: width * 0.02),

                                Text(
                                  'Войти с Telegram',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: buttonHeight * 0.3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: height * 0.015),

                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: buttonHeight,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF191919),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      vertical: buttonHeight * 0.25,
                                    ),
                                    overlayColor: Colors.black,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/AppleOriginal.svg',
                                      ),

                                      SizedBox(width: width * 0.02),

                                      Text(
                                        'Apple',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: buttonHeight * 0.25,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(width: width * 0.02),

                            Expanded(
                              child: SizedBox(
                                height: buttonHeight,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF191919),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      vertical: buttonHeight * 0.25,
                                    ),
                                    overlayColor: Colors.black,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/google.svg',
                                        width: buttonHeight * 0.45,
                                        height: buttonHeight * 0.45,
                                      ),
                                      SizedBox(width: width * 0.02),
                                      Text(
                                        'Google',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: buttonHeight * 0.25,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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
}
