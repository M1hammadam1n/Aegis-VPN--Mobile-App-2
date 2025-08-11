import 'package:aegis_vpn/settings_page/payment_error_page.dart';
import 'package:aegis_vpn/settings_page/tariffcard.dart';
import 'package:flutter/material.dart';
import 'payment_success_page.dart';

class TariffPurchasePage extends StatefulWidget {
  final Map<String, String> tariff;

  const TariffPurchasePage({super.key, required this.tariff});

  @override
  State<TariffPurchasePage> createState() => _TariffPurchasePageState();
}
class _TariffPurchasePageState extends State<TariffPurchasePage> {
  final TextEditingController _emailController = TextEditingController();

  final RegExp _emailRegExp = RegExp(r'^[\w\-.]+@([\w\-]+\.)+[\w\-]{2,4}$');

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  // Вставь сюда, заменяя/дополняя свой существующий метод _onPayPressed
  Future<void> _onPayPressed() async {
  final email = _emailController.text.trim();

  if (email.isNotEmpty && _emailRegExp.hasMatch(email)) {
    SubscriptionManager().activeTariff = TariffData(
      duration: widget.tariff['duration']!,
      subtitle: widget.tariff['subtitle']!,
      price: widget.tariff['price']!,
    );

    await Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(builder: (_) => const PaymentSuccessPage()),
    );

    _emailController.clear();

  } else {
    await Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(builder: (_) => const PaymentErrorPage()),
    );
  }
}


  @override
  Widget build(BuildContext context) {
        final size = MediaQuery.of(context).size;
    final w = size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_sharp, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Покупка тарифа',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 25,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Электронная почта',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                hintText: 'Адрес эл. почты, куда придёт чек',
                hintStyle: const TextStyle(color: Colors.white38),
                filled: true,
                fillColor: Colors.white10,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),

            const SizedBox(height: 18),
            const Text(
              'Способ оплаты',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF191919),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/Badge Flags.png',
                    height: 50,
                    width: 50,
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'ЮMoney',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'МИР, Visa, MasterCard',
                        style: TextStyle(color: Colors.white30, fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Spacer(),

            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF191919),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFF3c3c3c),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/images/Badge Flags 2.png',
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Итого: ${widget.tariff['price']!.replaceAll(' в месяц', '')}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${widget.tariff['subtitle']}, ${widget.tariff['duration']}',
                        style: const TextStyle(
                          color: Colors.white38,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 14),

            // Кнопка оплатить — валидируем email
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: _onPayPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Оплатить',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
