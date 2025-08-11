import 'package:aegis_vpn/settings_page/purchase%20_of_tariff.dart';
import 'package:flutter/material.dart';

class SubscriptionManager {
  TariffData? activeTariff;

  // Singleton
  SubscriptionManager._privateConstructor();
  static final SubscriptionManager _instance = SubscriptionManager._privateConstructor();
  factory SubscriptionManager() => _instance;
}

class TariffData {
  final String duration;
  final String subtitle;
  final String price;

  TariffData({required this.duration, required this.subtitle, required this.price});
}

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  TariffData? tariff;

  @override
  void initState() {
    super.initState();
    tariff = SubscriptionManager().activeTariff;
  }

  void _goToPurchase() async {
    await Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(builder: (_) => const PurchaseOfTariff()),
    );

    // Обновляем состояние после возврата (вдруг тариф изменился)
    setState(() {
      tariff = SubscriptionManager().activeTariff;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (tariff == null) {
      // Нет подписки — показываем кнопку покупки
      return LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth;
          // Масштабируем размеры шрифтов и отступов под ширину контейнера
          double baseFontSizeTitle = 24;
          double baseFontSizeSubtitle = 15;
          double titleFontSize = baseFontSizeTitle * (maxWidth / 360).clamp(0.8, 1.2);
          double subtitleFontSize = baseFontSizeSubtitle * (maxWidth / 360).clamp(0.8, 1.2);
          double buttonFontSize = 20 * (maxWidth / 360).clamp(0.8, 1.2);
          double paddingAll = 20 * (maxWidth / 360).clamp(0.8, 1.2);
          double buttonHorizontalPadding = 40 * (maxWidth / 360).clamp(0.8, 1.2);
          double buttonVerticalPadding = 15 * (maxWidth / 360).clamp(0.8, 1.2);
          double iconSize = 20 * (maxWidth / 360).clamp(0.8, 1.2);

          return Container(
            padding: EdgeInsets.all(paddingAll),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFF292929),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Подписка не оплачена',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16 * (maxWidth / 360).clamp(0.8, 1.2)),
                Text(
                  'Попробуйте подписку и забудьте \nоб ограничениях и медленной скорости интернета!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: subtitleFontSize,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 20 * (maxWidth / 360).clamp(0.8, 1.2)),
                ElevatedButton(
                  onPressed: _goToPurchase,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: buttonHorizontalPadding,
                      vertical: buttonVerticalPadding,
                    ),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/icon 9.png', width: iconSize, height: iconSize),
                      SizedBox(width: 6 * (maxWidth / 360).clamp(0.8, 1.2)),
                      Text(
                        'Купить подписку',
                        style: TextStyle(
                          fontSize: buttonFontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    } else {
      // Отображаем активный тариф
      return LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth;
          final maxHeight = constraints.maxHeight > 0 ? constraints.maxHeight : 120.0;

          // Масштабируем шрифты и размеры элементов под доступный размер
          double baseHeight = 120;
          double heightFactor = (maxHeight / baseHeight).clamp(0.8, 1.0);
          double baseFontSizeTitle = 22;
          double baseFontSizeBadge = 16;
          double titleFontSize = baseFontSizeTitle * heightFactor;
          double badgeFontSize = baseFontSizeBadge * heightFactor;
          double containerPaddingLeft = 20 * heightFactor;
          double containerRadius = 20 * heightFactor;
          double imageWidth = 150 * heightFactor;
          double imageHeight = baseHeight * heightFactor;

          return Container(
            padding: EdgeInsets.only(left: containerPaddingLeft),
            height: imageHeight,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(containerRadius),
              color: const Color(0xFF38270f),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Заголовок тарифа
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Тариф ${tariff!.subtitle}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: titleFontSize,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        children: [
                          // Первый бейдж с длительностью
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 0 * heightFactor,
                              vertical: 8 * heightFactor,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF463620),
                              borderRadius: BorderRadius.circular(20 * heightFactor),
                            ),
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                '  ${tariff!.duration}  ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: badgeFontSize,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 5 * heightFactor),
                          // Второй бейдж с оставшимися днями
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12 * heightFactor,
                              vertical: 8 * heightFactor,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF463620),
                              borderRadius: BorderRadius.circular(20 * heightFactor),
                            ),
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                'Осталось: 32 дня',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: badgeFontSize,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Картинка справа
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25 * heightFactor),
                    bottomRight: Radius.circular(20 * heightFactor),
                  ),
                  child: Image.asset(
                    'assets/images/aegisvpn_new_page-0006 1.png',
                    fit: BoxFit.cover,
                    height: imageHeight,
                    width: imageWidth,
                  ),
                ),
              ],
            ),
          );
        },
      );
    }
  }
}
