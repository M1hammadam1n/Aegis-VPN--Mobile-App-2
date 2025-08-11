import 'dart:async';

import 'package:flutter/material.dart';

enum ConnectionStateStatus {
  disconnected, // дефолт: Подключиться, белая кнопка
  connecting, // промежуточное: Подключается + индикатор, серая кнопка, кнопка неактивна
  connected, // подключено: Отключиться, темная кнопка
}

class GeneralScreens extends StatefulWidget {
  const GeneralScreens({super.key});

  @override
  State<GeneralScreens> createState() => _GeneralScreensState();
}

class _GeneralScreensState extends State<GeneralScreens> {
  ConnectionStateStatus connectionState = ConnectionStateStatus.disconnected;
  Timer? _timer; // для секундомера
  Timer? _connectTimer; // для задержки "Подключается"
  int secondsElapsed = 0;

  void _toggleConnection() {
    if (connectionState == ConnectionStateStatus.disconnected) {
      setState(() {
        connectionState = ConnectionStateStatus.connecting;
      });

      // Через 2 секунды считаем, что подключились
      _connectTimer?.cancel();
      _connectTimer = Timer(const Duration(seconds: 2), () {
        setState(() {
          connectionState = ConnectionStateStatus.connected;
          secondsElapsed = 0;

          _timer?.cancel();
          _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
            setState(() {
              secondsElapsed++;
            });
          });
        });
      });
    } else if (connectionState == ConnectionStateStatus.connected) {
      // Отключаемся сразу
      _connectTimer?.cancel();
      _timer?.cancel();
      setState(() {
        connectionState = ConnectionStateStatus.disconnected;
        secondsElapsed = 0;
      });
    }
    // Если состояние connecting — кнопка неактивна, нажатия не будет
  }

  String _formatTime(int seconds) {
    final mins = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$mins:$secs';
  }

  @override
  void dispose() {
    _timer?.cancel();
    _connectTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    final bool isDisconnected =
        connectionState == ConnectionStateStatus.disconnected;
    final bool isConnecting =
        connectionState == ConnectionStateStatus.connecting;
    final bool isConnected = connectionState == ConnectionStateStatus.connected;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: w * 0.05,
            vertical: h * 0.01,
          ),
          child: Column(
            children: [
              SizedBox(height: h * 0.01),

              // Верхняя часть с фото и временем
              Flexible(
                flex: 3,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      isConnected
                          ? 'assets/images/singin.jpg'
                          : 'assets/images/singin_off.png',
                      fit: BoxFit.contain,
                      width: w,
                      height: double.infinity,
                    ),
                    Positioned(
                      bottom: h * 0.14,
                      child: Image.asset(
                        isConnected
                            ? 'assets/images/Icon Frame on.png'
                            : 'assets/images/Icon Frame.png',
                        fit: BoxFit.cover,
                        width: w * 0.1,
                        height: h * 0.05,
                      ),
                    ),
                    Positioned(
                      top: h * 0.12,
                      child: Text(
                        _formatTime(secondsElapsed),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: w * 0.13,
                          fontWeight: FontWeight.bold,
                          shadows: const [
                            Shadow(
                              offset: Offset(1, 1),
                              blurRadius: 3,
                              color: Colors.black54,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: h * 0.20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          isConnected
                              ? Image.asset('assets/images/lock 2.png')
                              : Image.asset('assets/images/lock 1.png'),
                          const SizedBox(width: 5),
                          Text(
                            isConnected ? 'защищено' : 'Не Защищено',
                            style: TextStyle(
                              color:
                                  isConnected
                                      ? const Color(0xFFFF9E2C)
                                      : Colors.grey,
                              fontSize: w * 0.05,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: h * 0.015),

              // Карта
              Flexible(
                flex: 3,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/images/map-base 1 1.png',
                      fit: BoxFit.fill,
                      width: w,
                      height: double.infinity,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        isConnected
                            ? 'assets/images/aegisvpn_new_page-0006 3.png'
                            : 'assets/images/aegisvpn_new_page-0006 4.png',
                        fit: BoxFit.cover,
                        width: w,
                        height: double.infinity,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: h * 0.015),

              // Блок трафика
              Flexible(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(w * 0.04),
                  decoration: BoxDecoration(
                    color: const Color(0xFF272727),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Image.asset('assets/images/Frame 2085661600.png'),
                      SizedBox(width: w * 0.04),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Зашифровано трафика:',
                            style: TextStyle(
                              color: const Color(0xFF757575),
                              fontSize: w * 0.04,
                            ),
                          ),
                          Text(
                            isConnected ? '2,5 ГБ' : '0,00 Кбайт',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: h * 0.015),

              // Нижний блок с выбором региона и кнопкой подключения
              Flexible(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(w * 0.02),
                  decoration: BoxDecoration(
                    color: const Color(0xFF272727),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/usa icon .png'),

                            SizedBox(width: w * 0.04),

                            // Точка состояния
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Америка',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: w * 0.045,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                      width: 5,
                                      height: 5,
                                      margin: const EdgeInsets.only(right: 8),
                                      decoration: BoxDecoration(
                                        color:
                                            isConnected
                                                ? Colors.green
                                                : Colors.grey,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  isConnected
                                      ? 'IP: 192.168.0.1'
                                      : 'IP: Не определён',
                                  style: TextStyle(
                                    color: const Color(0xFF757575),
                                    fontSize: w * 0.04,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),

                            const Spacer(),

                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF272727),
                                elevation: 0,
                              ).copyWith(
                                overlayColor: MaterialStateProperty.resolveWith<
                                  Color?
                                >((Set<MaterialState> states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return const Color(0xFF272727);
                                  }
                                  return null;
                                }),
                              ),
                              onPressed: () {},
                              label: const Icon(
                                Icons.keyboard_arrow_right,
                                color: Color(0xFF7d7d7d),
                              ),
                              icon: const Text(
                                'Выбрать',
                                style: TextStyle(color: Color(0xFF7d7d7d)),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        width: double.infinity,
                        height: h * 0.07,
                        child: ElevatedButton.icon(
                          onPressed: isConnecting ? null : _toggleConnection,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                isConnecting
                                    ? Color(0xFF525252)
                                    : isConnected
                                    ? Color(0xFF525252)
                                    : Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          icon:
                              isConnecting
                                  ? SizedBox(
                                    width: w * 0.06,
                                    height: w * 0.06,
                                    child: Image.asset('assets/images/3.png'),
                                  )
                                  : isConnected
                                  ? Image.asset('assets/images/2.png')
                                  : Image.asset('assets/images/1.png'),
                          label: Text(
                            isDisconnected
                                ? 'Подключиться'
                                : isConnecting
                                ? 'Подключение'
                                : 'Отключиться',
                            style: TextStyle(
                              color:
                                  isConnecting
                                      ? Colors.grey
                                      : isConnected
                                      ? Colors.grey
                                      : Colors.black,
                              fontSize: w * 0.05,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
