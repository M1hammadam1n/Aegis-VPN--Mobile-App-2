import 'package:aegis_vpn/sign_up/sing_up_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Верхняя картинка без изменений
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Image.asset('assets/images/singin.jpg', fit: BoxFit.cover),
            ),

            // Основной блок с фоном и содержимым
            Expanded(
              child: Stack(
                children: [
                  // Фон: картинка + градиент, покрывающий область текста и кнопок
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
                                Colors.black.withOpacity(
                                  0.7,
                                ), // сверху затемнение
                                Colors.transparent,
                                Colors.black.withOpacity(
                                  0.6,
                                ), // снизу затемнение
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0.0, 0.5, 1.0],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Содержимое поверх фона: тексты и кнопки
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                    ), // чуть больше отступы
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Spacer(flex: 2),
                        const Text(
                          'Регистрация',
                          style: TextStyle(
                            fontSize: 42, // увеличен шрифт
                            color: Colors.white,
                            fontWeight: FontWeight.w600, // чуть жирнее
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10), // больше отступ
                        const Text(
                          'Создайте аккаунт любым удобным \nдля вас методом, доступным ниже.',
                          style: TextStyle(
                            fontSize: 18, // увеличен шрифт
                            color: Colors.white70, // чуть светлее и контрастней
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const Spacer(flex: 3),

                        // Кнопка E-Mail с большей высотой и padding
                        SizedBox(
                          width:
                              double
                                  .infinity, // растянуть на всю ширину Padding (экран минус отступы)
                          height: 65,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SingUpEmail(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              overlayColor: Colors.black,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.email,
                                  color: Colors.black,
                                  size: 28,
                                ),
                                SizedBox(width: 12),
                                Text(
                                  'Продолжить с E-Mail',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Кнопки Apple и Google — делим ширину поровну, с отступом между ними
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 65,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF191919),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 18,
                                    ),
                                    overlayColor: Colors.black,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.apple,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      SizedBox(width: 12),
                                      Text(
                                        'Apple',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12), // отступ между кнопками
                            Expanded(
                              child: SizedBox(
                                height: 65,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF191919),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 18,
                                    ),
                                    overlayColor: Colors.black,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/google.svg',
                                        width: 30,
                                        height: 30,
                                      ),
                                      const SizedBox(width: 12),
                                      const Text(
                                        'Google',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24), // увеличенный отступ внизу
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
