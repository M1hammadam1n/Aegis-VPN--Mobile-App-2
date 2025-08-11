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
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Верхний блок
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  SizedBox(height: 50),
                  Text(
                    'Попробовать снова',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Введите 6-ти значный код, который находится в письме, отправленный на вашу эл. почту.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // Поля ввода кода
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(codeLength, (index) {
                  return SizedBox(
                    width: 45,
                    height: 55,
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
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
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
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF191919),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Text(
                          'Пожалуйста, введите полный код',
                          style: TextStyle(color: Colors.white38, fontSize: 16),
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
                            // Можно добавить логику повтора отправки кода
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

              // Кнопки
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: _validateAndNavigate,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Продолжить',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    // Логика повторной отправки кода или возврата назад
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white12,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Попробовать снова',
                    style: TextStyle(color: Colors.white, fontSize: 20),
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
