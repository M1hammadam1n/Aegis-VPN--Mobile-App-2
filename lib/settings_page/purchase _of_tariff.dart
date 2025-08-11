import 'package:aegis_vpn/settings_page/tariff_Purchase_page.dart';
import 'package:aegis_vpn/settings_page/wings_title.dart';
import 'package:flutter/material.dart';

class PurchaseOfTariff extends StatefulWidget {
  const PurchaseOfTariff({super.key});

  @override
  State<PurchaseOfTariff> createState() => _PurchaseOfTariffState();
}

class _PurchaseOfTariffState extends State<PurchaseOfTariff> {
  int selectedIndex = 0;

  final List<Map<String, String>> tariffs = [
    {
      'duration': '1 мес.',
      'subtitle': 'Базовый тариф',
      'price': '500₽ в месяц',
    },
    {
      'duration': '6 мес.',
      'subtitle': '2 мес. в подарок',
      'price': '350₽ в месяц',
    },
    {
      'duration': '1 год',
      'subtitle': '3 мес. в подарок',
      'price': '280₽ в месяц',
    },
    {
      'duration': '2 года',
      'subtitle': '6 мес. в подарок',
      'price': '190₽ в месяц',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final textScale = mq.textScaleFactor;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_sharp, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Image.asset('assets/images/logo.png', height: 50, width: 150),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final w = constraints.maxWidth;
          final h = constraints.maxHeight;
          final isSmall = w < 360;

          // Адаптивные размеры
          final durationFont =
              (w * 0.055 * (isSmall ? 0.9 : 1)).clamp(14.0, 22.0) * textScale;
          final subtitleFont =
              (w * 0.045 * (isSmall ? 0.9 : 1)).clamp(12.0, 18.0) * textScale;
          final priceFont = (w * 0.045).clamp(12.0, 18.0) * textScale;
          final buttonFont = (w * 0.055).clamp(16.0, 22.0) * textScale;
          final cardPadding = w * 0.04;
          final cardHeight = isSmall ? 70.0 : 80.0;

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                w * 0.04, // слева
                0, // сверху
                w * 0.04, // справа
                8, // снизу — подняли всё на 8px
              ),
              child: Column(
                children: [
                  const WingsTitle(),
                  SizedBox(height: h * 0.02),

                  // Список тарифов
                  ...List.generate(tariffs.length, (index) {
                    final tariff = tariffs[index];
                    final bool isSelected = selectedIndex == index;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: GestureDetector(
                        onTap: () => setState(() => selectedIndex = index),
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                isSelected
                                    ? const Color(0xFFFFBC40)
                                    : const Color(0xFF191919),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.all(cardPadding),
                          height: cardHeight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Левая часть
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    tariff['duration']!,
                                    style: TextStyle(
                                      color:
                                          isSelected
                                              ? Colors.white
                                              : (index == 3
                                                  ? const Color(0xFFFFBC40)
                                                  : Colors.white),
                                      fontSize: durationFont,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    tariff['subtitle']!,
                                    style: TextStyle(
                                      color:
                                          isSelected
                                              ? Colors.white
                                              : Colors.white30,
                                      fontSize: subtitleFont,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),

                              // Правая часть
                              // Правая часть
                              Row(
                                children: [
                                  ConstrainedBox(
                                    constraints: BoxConstraints(
                                      // Минимум 90px, максимум 38% ширины экрана
                                      minWidth: w * 0.25,
                                      maxWidth: w * 0.35,
                                    ),
                                    child: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.3),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: w * 0.02,
                                      ),
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          tariff['price']!,
                                          style: TextStyle(
                                            fontSize:
                                                (w * 0.042).clamp(11.0, 16.0) *
                                                textScale,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: w * 0.02),
                                  Checkbox(
                                    value: isSelected,
                                    onChanged:
                                        (_) => setState(
                                          () => selectedIndex = index,
                                        ),
                                    activeColor: Colors.white,
                                    checkColor: Colors.black,
                                    side: const BorderSide(color: Colors.white),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),

                  SizedBox(height: h * 0.08),

                  // Кнопка "Приобрести"
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (_) => TariffPurchasePage(
                                  tariff: tariffs[selectedIndex],
                                ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        padding: EdgeInsets.symmetric(vertical: h * 0.018),
                      ),
                      child: Text(
                        'Приобрести за ${tariffs[selectedIndex]['price']}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: buttonFont,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: h * 0.01), // отступ под кнопкой
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.white30,
                        fontSize: (w * 0.032).clamp(10.0, 14.0),
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        const TextSpan(
                          text:
                              'Автоматическая оплата. Можно отменить в любой момент.\n',
                        ),
                        TextSpan(
                          text: 'Политика конфиденциальности',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const TextSpan(text: ' и '),
                        TextSpan(
                          text: 'Правила пользования',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
