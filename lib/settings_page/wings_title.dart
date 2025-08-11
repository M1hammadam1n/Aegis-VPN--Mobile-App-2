import 'dart:math';
import 'package:flutter/material.dart';

class WingsTitle extends StatelessWidget {
  const WingsTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    // Базовые размеры под эталонный макет (например, 360x800)
    const baseWidth = 360.0;
    const baseHeight = 800.0;

    // Коэффициенты масштабирования (минимум 0.85 чтобы не схлопывалось)
    final scaleW = max(0.85, screenWidth / baseWidth);
    final scaleH = max(0.85, screenHeight / baseHeight);

    // Размер контейнера (по высоте)
    final containerHeight = min(
      screenHeight * (0.22 * scaleH), // базовая пропорция
      280.0 * scaleH, // ограничение сверху
    );

    // Шрифты (масштабируем относительно ширины)
    final titleFontSize = 28.0 * scaleW;
    final subtitleFontSize = 14.0 * scaleW;

    return SizedBox(
      width: double.infinity,
      height: containerHeight,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Фон
          Positioned.fill(
            child: Center(
              child: SizedBox(
                height: containerHeight * 0.95,
                child: Image.asset(
                  'assets/images/Frame 2085661625.png',
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),

          // Текст
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: screenWidth * 0.9),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    screenWidth < 340
                        ? 'Открой\nпреимущества'
                        : 'Открой для себя\nвсе преимущества',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: titleFontSize,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      height: 1.05,
                    ),
                  ),

                  SizedBox(height: screenWidth * 0.02),

                  Text(
                    screenWidth < 340
                        ? 'Попробуйте подписку и забудьте о медленном интернете.'
                        : 'Попробуйте подписку и забудьте о медленной \nскорости интернета. Смотрите 4К контент,\nиграйте в игры и наслаждайтесь YouTube.\nПродлится автоматически.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white30,
                      fontSize: subtitleFontSize,
                      fontWeight: FontWeight.w500,
                      height: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
