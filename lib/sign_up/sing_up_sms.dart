import 'package:aegis_vpn/bottomnavigationbar/bottom_navigation_bar.dart';
import 'package:aegis_vpn/general/general_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SingUpSms extends StatefulWidget {
  const SingUpSms({super.key});

  @override
  State<SingUpSms> createState() => _SingUpSmsState();
}

class _SingUpSmsState extends State<SingUpSms> {
  final int codeLength = 6;
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  bool _showError = false;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(codeLength, (_) => TextEditingController());
    _focusNodes = List.generate(codeLength, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (var c in _controllers) c.dispose();
    for (var f in _focusNodes) f.dispose();
    super.dispose();
  }

  String get _code => _controllers.map((c) => c.text).join();

  void _onChanged(String value, int index) {
    if (value.length > 1) {
      _controllers[index].text = value[0];
    }
    if (value.isNotEmpty) {
      if (index + 1 != codeLength) {
        FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
      } else {
        FocusScope.of(context).unfocus();

        // Если введено полностью — сразу проверяем и переходим
        if (_code.length == codeLength) {
          _validateAndNavigate();
        }
      }
    }
  }

  void _onKey(RawKeyEvent event, int index) {
    if (event is RawKeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.backspace &&
        _controllers[index].text.isEmpty &&
        index > 0) {
      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
    }
  }

  void _validateAndNavigate() {
    bool allFilled = _controllers.every((c) => c.text.isNotEmpty);
    if (allFilled) {
      setState(() => _showError = false);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const NavigationExample()),
      );
    } else {
      setState(() => _showError = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    // Базовые размеры от высоты экрана (можно подстроить)
    final verticalSpacingLarge = height * 0.06; // вместо 50
    final verticalSpacingSmall = height * 0.01; // вместо 8
    final inputBoxWidth =
        (width - 32 - 5 * 10) / 6; // горизонтальные паддинги + промежутки
    final inputBoxHeight = height * 0.07; // около 55 при экране 6.6 дюймов

    // Шрифты с масштабированием
    final titleFontSize = height * 0.045; // около 36
    final subtitleFontSize = height * 0.02; // около 16
    final codeFontSize = height * 0.03; // около 24
    final buttonFontSize = height * 0.025; // около 20

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04), // вместо 16
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Верхний блок
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: verticalSpacingLarge),
                  Text(
                    'Подтверждение',
                    style: TextStyle(
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: verticalSpacingSmall),
                  Text(
                    'Введите 6-ти значный код, который находится в письме, отправленный на вашу эл. почту.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: subtitleFontSize,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),

              SizedBox(height: height * 0.05),

              // Поля ввода кода
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(codeLength, (index) {
                  return SizedBox(
                    width: inputBoxWidth.clamp(
                      40,
                      60,
                    ), // ограничиваем по ширине
                    height: inputBoxHeight.clamp(45, 65),
                    child: RawKeyboardListener(
                      focusNode: FocusNode(),
                      onKey: (event) => _onKey(event, index),
                      child: TextField(
                        controller: _controllers[index],
                        focusNode: _focusNodes[index],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        cursorColor: Colors.white,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: codeFontSize,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          counterText: '',
                          filled: true,
                          fillColor: Colors.white10,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.white12,
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          contentPadding: EdgeInsets.zero,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onChanged: (value) => _onChanged(value, index),
                      ),
                    ),
                  );
                }),
              ),

              const Spacer(),

              // Ошибка поверх кнопки
              if (_showError)
                Container(
                  margin: EdgeInsets.only(bottom: height * 0.015),
                  padding: EdgeInsets.symmetric(
                    vertical: height * 0.015,
                    horizontal: width * 0.04,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF191919),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Не пришёл код? Проверьте папку "Спам" или попробуйте снова.',
                          style: TextStyle(
                            color: Colors.white38,
                            fontSize: subtitleFontSize,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF272727),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _showError = false;
                              for (var c in _controllers) {
                                c.clear();
                              }
                              FocusScope.of(
                                context,
                              ).requestFocus(_focusNodes[0]);
                            });
                          },
                          icon: const Icon(Icons.refresh, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),

              SizedBox(
                width: double.infinity,
                height: height * 0.07,
                child: ElevatedButton(
                  onPressed: _validateAndNavigate,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: EdgeInsets.symmetric(vertical: height * 0.012),
                  ),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Продолжить',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: buttonFontSize,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),

              SizedBox(height: height * 0.008),
              SizedBox(
                width: double.infinity,
                height: height * 0.07,
                child: ElevatedButton(
                  onPressed: () {
                    // Логика повторной отправки кода или возврата назад
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white12,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: EdgeInsets.symmetric(vertical: height * 0.023),
                  ),
                  child: Text(
                    'Попробовать снова',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: buttonFontSize,
                    ),
                    textAlign: TextAlign.center,
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
