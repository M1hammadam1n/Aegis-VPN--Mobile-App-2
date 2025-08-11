import 'package:aegis_vpn/sing_in/sing_in_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Получаем размеры экрана
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    // Динамические размеры шрифтов и отступов
    double titleFontSize = width * 0.08; // примерно 8% ширины экрана
    if (titleFontSize > 36) titleFontSize = 36; // максимум 36
    double subtitleFontSize = width * 0.035;
    if (subtitleFontSize > 16) subtitleFontSize = 16;
    double buttonHeight = height * 0.08; // высота кнопок 8% высоты экрана
    if (buttonHeight < 55) buttonHeight = 55; // минимум 55

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Верхняя картинка с динамической высотой (примерно 20% высоты экрана)
            Padding(
              padding: EdgeInsets.only(top: height * 0.03),
              child: SizedBox(
                height: height * 0.2,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/singin.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Основная часть с фоном и содержимым (текст + кнопки)
            Expanded(
              child: Stack(
                children: [
                  // Фон — картинка с градиентом поверх
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

                  // Содержимое поверх фона: текст и кнопки
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: height * 0.03,
                      left: width * 0.05,
                      right: width * 0.05,
                      top: height * 0.1,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Тексты
                        Text(
                          'Вход в аккаунт',
                          style: TextStyle(
                            fontSize: titleFontSize,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: height * 0.01),
                        Text(
                          'Войдите в аккаунт любым удобным \nдля вас методом, доступным ниже.',
                          style: TextStyle(
                            fontSize: subtitleFontSize,
                            color: Colors.white38,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const Spacer(),

                        // Кнопки с динамическими размерами
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
                                Icon(
                                  Icons.email,
                                  color: Colors.black,
                                  size: buttonHeight * 0.4,
                                ),
                                SizedBox(width: width * 0.02),
                                Text(
                                  'Войти с E-Mail',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: buttonHeight * 0.3,
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
                                Icon(
                                  Icons.telegram,
                                  color: Colors.blue,
                                  size: buttonHeight * 0.45,
                                ),
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
                                      Icon(
                                        Icons.apple,
                                        color: Colors.white,
                                        size: buttonHeight * 0.45,
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
