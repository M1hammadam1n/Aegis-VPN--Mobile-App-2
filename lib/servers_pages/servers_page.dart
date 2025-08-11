import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ServersPage extends StatelessWidget {
  const ServersPage({super.key});
  static final List<ServerData> freeServers = [
    ServerData(
      flagAsset: 'assets/images/theUnitedStates1.png',
      country: 'Америка',
      city: 'Нью-Йорк',
      level: 4,
      showCrown: false,
      crownAsset: '',
    ),
    ServerData(
      flagAsset: 'assets/images/France1.png',
      country: 'Франция',
      city: 'Париж',
      level: 2,
      showCrown: false,
      crownAsset: '',
    ),
  ];

  static final List<ServerData> recommendedServers = [
    ServerData(
      flagAsset: 'assets/images/CzechRepublic1.png',
      country: 'Чехия',
      city: 'Прага',
      level: 4,
      showCrown: true,
      crownAsset: 'assets/icons/king.svg',
    ),
    ServerData(
      flagAsset: 'assets/images/Canada1.png',
      country: 'Индонезия',
      city: 'Джакарта',
      level: 4,
      showCrown: true,
      crownAsset: 'assets/icons/king.svg',
    ),
    ServerData(
      flagAsset: 'assets/images/Indonesia1.png',
      country: 'Сервер 4',
      city: 'Город 4',
      level: 3,
      showCrown: true,
      crownAsset: 'assets/icons/king.svg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Получаем размеры экрана
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    // Функция для масштабирования шрифта относительно ширины экрана
    double fontSize(double size) {
      // Можно использовать clamp, чтобы шрифт не становился слишком маленьким или большим
      return (size * w / 400).clamp(10, 24);
    }

    // Функция для адаптивных отступов/высот/ширин
    double adaptWidth(double size) => size * w / 400;
    double adaptHeight(double size) => size * h / 800;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Сервера',
          style: TextStyle(color: Colors.white, fontSize: fontSize(18)),
        ),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: adaptWidth(20)),
          children: [
            SizedBox(height: adaptHeight(10)),
            TextField(
              obscureText: false,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, color: Colors.white24),
                hintText: 'Поиск локаций',
                filled: true,
                fillColor: Colors.white10,
                labelStyle: TextStyle(
                  color: Colors.white24,
                  fontSize: fontSize(16),
                  fontWeight: FontWeight.w400,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(adaptWidth(18)),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(color: Colors.white, fontSize: fontSize(14)),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: adaptHeight(25)),

            // Автоматический сервер
            Text(
              'Автоматический сервер',
              style: TextStyle(
                color: Colors.white,
                fontSize: fontSize(20),
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: adaptHeight(20)),
            Container(
              height: adaptHeight(70),
              padding: EdgeInsets.all(adaptWidth(12)),
              decoration: BoxDecoration(
                color: const Color(0xFF3f3f3f),
                borderRadius: BorderRadius.circular(adaptWidth(16)),
              ),
              child: Row(
                children: [
                  Container(
                    width: adaptWidth(50),
                    height: adaptWidth(50),
                    decoration: BoxDecoration(
                      color: const Color(0xFF3c3c3c),
                      borderRadius: BorderRadius.circular(adaptWidth(16)),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/icons/rame2085661612.svg',
                        width: (w * 0.08).clamp(24.0, 40.0),
                        height: (w * 0.08).clamp(24.0, 40.0),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: adaptWidth(12)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Умное подключение',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: fontSize(15),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Самое быстрое местоположение',
                        style: TextStyle(
                          color: const Color(0xFF7d7d7d),
                          fontSize: fontSize(13),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(adaptWidth(48), adaptWidth(48)),
                      shadowColor: Colors.transparent,
                      overlayColor: Colors.black,
                      backgroundColor: const Color(0xFF343434),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(adaptWidth(15)),
                      ),
                      padding: EdgeInsets.zero,
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: adaptHeight(25)),

            // Бесплатные сервера
            Text(
              'Бесплатные сервера',
              style: TextStyle(
                color: Colors.white,
                fontSize: fontSize(20),
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: adaptHeight(20)),

            ...freeServers.map(
              (server) => Padding(
                padding: EdgeInsets.only(bottom: adaptHeight(20)),
                child: ServerTile(
                  flagAsset: server.flagAsset,
                  country: server.country,
                  city: server.city,
                  level: server.level,
                  showCrown: false,
                  crownAsset: '',
                  fontSizeFunction: fontSize,
                  adaptWidthFunction: adaptWidth,
                  adaptHeightFunction: adaptHeight,
                ),
              ),
            ),

            SizedBox(height: adaptHeight(25)),

            // Рекомендованные сервера
            Text(
              'Рекомендованные сервера',
              style: TextStyle(
                color: Colors.white,
                fontSize: fontSize(20),
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: adaptHeight(20)),

            ...recommendedServers.map(
              (server) => Padding(
                padding: EdgeInsets.only(bottom: adaptHeight(20)),
                child: ServerTile(
                  flagAsset: server.flagAsset,
                  country: server.country,
                  city: server.city,
                  level: server.level,
                  showCrown: server.showCrown,
                  crownAsset: server.crownAsset,
                  fontSizeFunction: fontSize,
                  adaptWidthFunction: adaptWidth,
                  adaptHeightFunction: adaptHeight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServerData {
  final String flagAsset;
  final String country;
  final String city;
  final int level;
  final bool showCrown;
  final String crownAsset;

  ServerData({
    required this.flagAsset,
    required this.country,
    required this.city,
    required this.level,
    required this.showCrown,
    required this.crownAsset,
  });
}

class ServerTile extends StatelessWidget {
  final String flagAsset;
  final String country;
  final String city;
  final int level;
  final bool showCrown;
  final String crownAsset;

  // Добавляем функции для адаптации размеров и шрифтов
  final double Function(double) fontSizeFunction;
  final double Function(double) adaptWidthFunction;
  final double Function(double) adaptHeightFunction;

  const ServerTile({
    super.key,
    required this.flagAsset,
    required this.country,
    required this.city,
    required this.level,
    this.showCrown = false,
    this.crownAsset = '',
    required this.fontSizeFunction,
    required this.adaptWidthFunction,
    required this.adaptHeightFunction,
  });

  @override
  Widget build(BuildContext context) {
    final fontSize = fontSizeFunction;
    final adaptWidth = adaptWidthFunction;
    final adaptHeight = adaptHeightFunction;

    return Container(
      height: adaptHeight(70),
      padding: EdgeInsets.all(adaptWidth(12)),
      decoration: BoxDecoration(
        color: const Color(0xFF272727),
        borderRadius: BorderRadius.circular(adaptWidth(16)),
      ),
      child: Row(
        children: [
          Container(
            width: adaptWidth(50),
            height: adaptWidth(50),
            decoration: BoxDecoration(
              color: const Color(0xFF333333),
              borderRadius: BorderRadius.circular(adaptWidth(16)),
            ),
            child: Center(
              child: Image.asset(
                flagAsset,
                width: adaptWidth(32),
                height: adaptWidth(32),
              ),
            ),
          ),
          SizedBox(width: adaptWidth(12)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                country,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSize(15),
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                city,
                style: TextStyle(
                  color: const Color(0xFF7d7d7d),
                  fontSize: fontSize(13),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const Spacer(),
          if (showCrown)
            Padding(
              padding: EdgeInsets.only(right: adaptWidth(8)),
              child: SvgPicture.asset(
                crownAsset,
                width: adaptWidth(20),
                height: adaptWidth(20),
              ),
            ),
          NetworkSignalIndicator(
            level: level,
            adaptWidthFunction: adaptWidth,
            adaptHeightFunction: adaptHeight,
          ),
          SizedBox(width: adaptWidth(12)),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              fixedSize: Size(adaptWidth(48), adaptWidth(48)),
              shadowColor: Colors.transparent,
              overlayColor: Colors.black,
              backgroundColor: const Color(0xFF333333),
              disabledBackgroundColor: const Color(0xFF333333),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(adaptWidth(15)),
              ),
              padding: EdgeInsets.zero,
            ),
            child: const Icon(
              Icons.arrow_forward_ios_sharp,
              color: Colors.white,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class NetworkSignalIndicator extends StatelessWidget {
  final int level;
  final double Function(double) adaptWidthFunction;
  final double Function(double) adaptHeightFunction;

  const NetworkSignalIndicator({
    super.key,
    required this.level,
    required this.adaptWidthFunction,
    required this.adaptHeightFunction,
  });

  @override
  Widget build(BuildContext context) {
    final adaptWidth = adaptWidthFunction;
    // высоты столбиков сделаем адаптивными
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(4, (index) {
        int barNumber = index + 1;

        Color activeColor;
        if (level == 4) {
          activeColor = Colors.green;
        } else if (level == 3) {
          activeColor = Colors.orange;
        } else {
          activeColor = Colors.red;
        }

        return Container(
          margin: EdgeInsets.symmetric(horizontal: adaptWidth(1)),
          width: adaptWidth(4),
          height: adaptWidth(barNumber * 6),
          decoration: BoxDecoration(
            color: barNumber <= level ? activeColor : const Color(0xFF555555),
            borderRadius: BorderRadius.circular(adaptWidth(2)),
          ),
        );
      }),
    );
  }
}
