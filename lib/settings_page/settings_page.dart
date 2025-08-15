import 'package:aegis_vpn/settings_page/account_settings.dart';
import 'package:aegis_vpn/settings_page/purchase%20_of_tariff.dart';
import 'package:aegis_vpn/settings_page/settings_vpn.dart';
import 'package:aegis_vpn/settings_page/tariffcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final horizontalPadding = 10.0;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text('Настройки', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF191919),
                  borderRadius: BorderRadius.circular(16),
                ),
                height: 76,
                child: Row(
                  children: [
                    const SizedBox(width: 20),
                    ClipOval(
                      child: SvgPicture.asset(
                        'assets/icons/Avatar.svg',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: w * 0.025),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: w * 0.015),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Аккаунт',
                                style: TextStyle(
                                  color: Color(0xFF7a7a7a),
                                  fontSize: (w * 0.04).clamp(12.0, 16.0),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(height: w * 0.007),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'designband@aic.ru',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: (w * 0.035).clamp(11.0, 14.0),
                                  fontWeight: FontWeight.w600,
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
              SizedBox(height: w * 0.025),
              const SubscriptionScreen(),
              SizedBox(height: w * 0.05),

              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF191919),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.all(w * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AccountSettings(),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/Frame2085661612.svg',
                            width: (w * 0.08).clamp(24.0, 40.0),
                            height: (w * 0.08).clamp(24.0, 40.0),
                          ),
                          SizedBox(width: w * 0.025),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Настройки аккаунта',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: (w * 0.045).clamp(14.0, 16.0),
                                    fontWeight: FontWeight.w500,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: w * 0.01),
                                Text(
                                  'Пароль, подписка и пр.',
                                  style: TextStyle(
                                    color: Colors.white30,
                                    fontSize: (w * 0.04).clamp(13.0, 16.0),
                                    fontWeight: FontWeight.w400,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: w * 0.025),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Colors.white30,
                            size: (w * 0.04).clamp(16.0, 20.0),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: w * 0.025),
                    const Divider(thickness: 0.8, color: Colors.white12),
                    SizedBox(height: w * 0.025),

                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingsVpn(),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/rame2085661612.svg',
                            width: (w * 0.08).clamp(24.0, 40.0),
                            height: (w * 0.08).clamp(24.0, 40.0),
                          ),
                          SizedBox(width: w * 0.025),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Настройки VPN',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: (w * 0.045).clamp(14.0, 16.0),
                                    fontWeight: FontWeight.w500,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: w * 0.01),
                                Text(
                                  'Подключение и безопасность',
                                  style: TextStyle(
                                    color: Colors.white30,
                                    fontSize: (w * 0.04).clamp(13.0, 16.0),
                                    fontWeight: FontWeight.w400,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: w * 0.025),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Colors.white30,
                            size: (w * 0.04).clamp(16.0, 20.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: w * 0.025),

              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF191919),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.all(w * 0.05),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/2085661612.svg',
                            width: (w * 0.08).clamp(24.0, 40.0),
                            height: (w * 0.08).clamp(24.0, 40.0),
                          ),
                          SizedBox(width: w * 0.025),
                          Expanded(
                            child: Text(
                              'Оцените приложение',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: (w * 0.045).clamp(14.0, 16.0),
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(width: w * 0.025),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Colors.white30,
                            size: (w * 0.04).clamp(16.0, 20.0),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: w * 0.025),
                    const Divider(thickness: 0.8, color: Colors.white12),
                    SizedBox(height: w * 0.025),

                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/085661612.svg',
                            width: (w * 0.08).clamp(24.0, 40.0),
                            height: (w * 0.08).clamp(24.0, 40.0),
                          ),
                          SizedBox(width: w * 0.025),
                          Expanded(
                            child: Text(
                              'Пригласите друзей',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: (w * 0.045).clamp(14.0, 16.0),
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(width: w * 0.025),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Colors.white30,
                            size: (w * 0.04).clamp(16.0, 20.0),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: w * 0.025),
                    const Divider(thickness: 0.8, color: Colors.white12),
                    SizedBox(height: w * 0.025),

                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/2.svg',
                            width: (w * 0.08).clamp(24.0, 40.0),
                            height: (w * 0.08).clamp(24.0, 40.0),
                          ),
                          SizedBox(width: w * 0.02),
                          Expanded(
                            child: Text(
                              'Правила пользования',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: (w * 0.045).clamp(14.0, 16.0),
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(width: w * 0.025),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Colors.white30,
                            size: (w * 0.04).clamp(16.0, 20.0),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: w * 0.025),
                    const Divider(thickness: 0.8, color: Colors.white12),
                    SizedBox(height: w * 0.025),

                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/4.svg',
                            width: (w * 0.08).clamp(24.0, 40.0),
                            height: (w * 0.08).clamp(24.0, 40.0),
                          ),
                          SizedBox(width: w * 0.025),
                          Expanded(
                            child: Text(
                              'Политика конфиденциальности...',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: (w * 0.045).clamp(14.0, 16.0),
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(width: w * 0.025),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Colors.white30,
                            size: (w * 0.04).clamp(16.0, 20.0),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: w * 0.025),
                    const Divider(thickness: 0.8, color: Colors.white12),
                    SizedBox(height: w * 0.025),

                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/7.svg',
                            width: (w * 0.08).clamp(24.0, 40.0),
                            height: (w * 0.08).clamp(24.0, 40.0),
                          ),
                          SizedBox(width: w * 0.025),
                          Expanded(
                            child: Text(
                              'Написать в поддержку',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: (w * 0.045).clamp(14.0, 16.0),
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(width: w * 0.025),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Colors.white30,
                            size: (w * 0.04).clamp(16.0, 20.0),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: w * 0.025),
                    const Divider(thickness: 0.8, color: Colors.white12),
                    SizedBox(height: w * 0.025),

                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PurchaseOfTariff(),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/9.svg',
                            width: (w * 0.08).clamp(24.0, 40.0),
                            height: (w * 0.08).clamp(24.0, 40.0),
                          ),
                          SizedBox(width: w * 0.025),
                          Expanded(
                            child: Text(
                              'Восстановить покупки',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: (w * 0.045).clamp(14.0, 16.0),
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(width: w * 0.025),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Colors.white30,
                            size: (w * 0.04).clamp(16.0, 20.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: w * 0.025),
            ],
          ),
        ],
      ),
    );
  }
}
