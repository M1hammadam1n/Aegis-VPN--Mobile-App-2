import 'package:flutter/material.dart';

class SingInEmail extends StatelessWidget {
  const SingInEmail({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double screenHeight = size.height;
    final double screenWidth = size.width;
    final bool isSmallScreen = size.height < 600;

    // Масштабирование шрифтов и отступов
    double scale(double value) => value * (screenHeight / 800);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: scale(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === Верхний блок ===
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: scale(50)), // отступ сверху
                  Text(
                    'Вход с E-Mail',
                    style: TextStyle(
                      fontSize: scale(36),
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: scale(8)),
                  Text(
                    'Введите адрес электронной почты.\nМы отправим вам код верификации.',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: scale(16),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),

              // === Средний блок ===
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: scale(15)),
                  Divider(thickness: 0.8, color: Colors.white12),
                  SizedBox(height: scale(15)),
                  Text(
                    'Электронная почта',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: scale(16),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: scale(10)),
                  TextField(
                    obscureText: false,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      hintText: '  Введите адрес эл. почты',
                      hintStyle: TextStyle(fontSize: scale(14)),
                      filled: true,
                      fillColor: Colors.white10,
                      labelStyle: TextStyle(
                        color: Colors.white24,
                        fontSize: scale(14),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(scale(18)),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: scale(14),
                        horizontal: scale(12),
                      ),
                    ),
                    style: TextStyle(color: Colors.white, fontSize: scale(16)),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              const Spacer(),
              // === Нижний блок (кнопки) ===
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: scale(55).clamp(45, 60),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(scale(20)),
                        ),
                        padding: EdgeInsets.symmetric(vertical: scale(16)),
                        overlayColor: Colors.black.withOpacity(0.1),
                      ),
                      child: Text(
                        'Продолжить',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: scale(20),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: scale(8)),
                  TextButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(
                        Colors.transparent,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Назад',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize:
                            isSmallScreen
                                ? size.width * 0.045
                                : (size.width * 0.05).clamp(16, 22),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   width: double.infinity,
                  //   height: scale(55).clamp(45, 60),
                  //   child: OutlinedButton(
                  //     onPressed: () {
                  //       Navigator.pop(context);
                  //     },
                  //     style: OutlinedButton.styleFrom(
                  //       side: BorderSide.none,
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(scale(20)),
                  //       ),
                  //       padding: EdgeInsets.symmetric(vertical: scale(16)),
                  //       overlayColor: Colors.white.withOpacity(0.1),
                  //     ),
                  //     child: Text(
                  //       'Назад',
                  //       style: TextStyle(color: Colors.white, fontSize: scale(20)),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
