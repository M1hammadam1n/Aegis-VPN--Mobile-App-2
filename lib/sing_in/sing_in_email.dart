import 'package:flutter/material.dart';

class SingInEmail extends StatelessWidget {
  const SingInEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === Верхний блок ===
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(height: 50), // отступ сверху
                  Text(
                    'Вход с E-Mail',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Введите адрес электронной почты.\nМы отправим вам код верификации.',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),

              // === Средний блок ===
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  Divider(thickness: 0.8, color: Colors.white12),
                  const SizedBox(height: 15),
                  const Text(
                    'Электронная почта',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    obscureText: false,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      hintText: '  Введите адрес эл. почты',
                      filled: true,
                      fillColor: Colors.white10,
                      labelStyle: const TextStyle(color: Colors.white24),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
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
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        overlayColor: Colors.black,
                      ),
                      child: const Text(
                        'Продолжить',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide.none,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        overlayColor: Colors.white,
                      ),
                      child: const Text(
                        'Назад',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
