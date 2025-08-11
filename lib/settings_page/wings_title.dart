import 'dart:math';
import 'package:flutter/material.dart';

class WingsTitle extends StatelessWidget {
  const WingsTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;

    // Определяем тип экрана
    final isSmall = screenWidth < 360;
    final isMedium = screenWidth >= 360 && screenWidth < 600;
    final isLarge = screenWidth >= 600;

    // Высота контейнера
    final containerHeight =
        isSmall
            ? min(size.height * 0.18, 200.0)
            : isMedium
            ? min(size.height * 0.22, 240.0)
            : min(size.height * 0.26, 280.0);

    // Размер шрифтов
    final titleFontSize =
        isSmall
            ? 20.0
            : isMedium
            ? 28.0
            : 42.0;
    final subtitleFontSize =
        isSmall
            ? 12.0
            : isMedium
            ? 14.0
            : 18.0;

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
                height: containerHeight * (isSmall ? 0.9 : 0.95),
                child: Image.asset(
                  'assets/images/Frame 2085661625.png', // без пробелов
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
                    isSmall
                        ? 'Открой\nпреимущества' // короче на маленьких
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
                    isSmall
                        ? 'Попробуйте подписку и забудьте о медленном интернете.'
                        : 'Попробуйте подписку и забудьте о медленной \nскорости интернета. Смотрите 4К контент,\nиграйте в игры и наслаждайтесь YouTube.\nПродлится автоматически.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white30,
                      fontSize: subtitleFontSize,
                      fontWeight: FontWeight.w500,
                      height: 1.2,
                    ),
                    // maxLines: isSmall ? 2 : 3,
                    // overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          // SizedBox(height: ,)
        ],
      ),
    );
  }
}
