import 'package:aegis_vpn/settings_page/payment_error_page.dart';
import 'package:aegis_vpn/settings_page/tariffcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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

      await Navigator.of(
        context,
        rootNavigator: true,
      ).push(MaterialPageRoute(builder: (_) => const PaymentSuccessPage()));

      _emailController.clear();
    } else {
      await Navigator.of(
        context,
        rootNavigator: true,
      ).push(MaterialPageRoute(builder: (_) => const PaymentErrorPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final h = constraints.maxHeight;
        final textScale = MediaQuery.of(context).textScaleFactor;

        // Используем минимальное значение для баланса
        final shortestSide = w < h ? w : h;

        final titleFont = (shortestSide * 0.07).clamp(16.0, 24.0) * textScale;
        final subtitleFont =
            (shortestSide * 0.045).clamp(12.0, 16.0) * textScale;
        final buttonFont = (shortestSide * 0.05).clamp(14.0, 18.0) * textScale;
        final totalFont = (shortestSide * 0.05).clamp(14.0, 18.0) * textScale;

        final padding = (w * 0.03).clamp(8.0, 20.0);
        final imageSize = (h * 0.06).clamp(32.0, 50.0);
        final iconSize = (h * 0.05).clamp(24.0, 40.0);
        final buttonHeight = (h * 0.07).clamp(40.0, 60.0);

        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_sharp, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            backgroundColor: Colors.black,
            centerTitle: true,
            title: Text(
              'Покупка тарифа',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: titleFont,
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Электронная почта',
                  style: TextStyle(color: Colors.white, fontSize: subtitleFont),
                ),
                SizedBox(height: h * 0.015),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    hintText: 'Адрес эл. почты, куда придёт чек',
                    hintStyle: TextStyle(
                      color: Colors.white38,
                      fontSize: subtitleFont * 0.9,
                    ),
                    filled: true,
                    fillColor: Colors.white10,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: padding,
                      vertical: (h * 0.016).clamp(8.0, 14.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: TextStyle(color: Colors.white, fontSize: subtitleFont),
                ),

                SizedBox(height: h * 0.025),
                Text(
                  'Способ оплаты',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: totalFont,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: h * 0.012),

                Container(
                  padding: EdgeInsets.all(padding),
                  decoration: BoxDecoration(
                    color: const Color(0xFF191919),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/Badge Flags.png',
                        height: imageSize,
                        width: imageSize,
                      ),
                      SizedBox(width: w * 0.03),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ЮMoney',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: totalFont,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: h * 0.005),
                          Text(
                            'МИР, Visa, MasterCard',
                            style: TextStyle(
                              color: Colors.white30,
                              fontSize: subtitleFont,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                Container(
                  padding: EdgeInsets.all(padding),
                  decoration: BoxDecoration(
                    color: const Color(0xFF191919),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: (h * 0.07).clamp(36.0, 56.0),
                        height: (h * 0.07).clamp(36.0, 56.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFF3c3c3c),
                          borderRadius: BorderRadius.circular(16),
                        ),

                        child: Center(
                          child: SvgPicture.asset(
                            'assets/icons/9.svg',
                            height: iconSize,
                            width: iconSize,
                          ),
                        ),
                      ),
                      SizedBox(width: w * 0.03),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Итого: ${widget.tariff['price']!.replaceAll(' в месяц', '')}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: totalFont,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(height: h * 0.005),
                            Text(
                              '${widget.tariff['subtitle']}, ${widget.tariff['duration']}',
                              style: TextStyle(
                                color: Colors.white38,
                                fontSize: subtitleFont,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: h * 0.018),

                SizedBox(
                  width: double.infinity,
                  height: buttonHeight,
                  child: ElevatedButton(
                    onPressed: _onPayPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Оплатить',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: buttonFont,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: h * 0.050),
              ],
            ),
          ),
        );
      },
    );
  }
}
