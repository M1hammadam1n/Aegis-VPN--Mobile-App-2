import 'package:aegis_vpn/settings_page/protocols.dart';
import 'package:aegis_vpn/settings_page/settings_routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingsVpn extends StatelessWidget {
  const SettingsVpn({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;
    final maxContentWidth = w > 600 ? 600.0 : w * 0.95;
    final fontSizeTitle = w * 0.045 < 16 ? w * 0.045 : 16.0;
    final fontSizeDesc = w * 0.042 < 16 ? w * 0.042 : 16.0;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_sharp, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Настройки VPN',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 25,
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: maxContentWidth,
          padding: EdgeInsets.all(w * 0.03),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF191919),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.all(w * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const SettingsRouting(),
                            transitionDuration: const Duration(
                              milliseconds: 200,
                            ),
                            transitionsBuilder: (
                              context,
                              animation,
                              secondaryAnimation,
                              child,
                            ) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/2222.svg',
                            fit: BoxFit.cover,
                            height: 45,
                            width: 45,
                          ),
                          SizedBox(width: w * 0.025),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Роутинг',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: fontSizeTitle,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'Доступ к определенным ресурсам \nв обход VPN.',
                                  style: TextStyle(
                                    color: Colors.white30,
                                    fontSize: fontSizeDesc,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Colors.white30,
                            size: 20,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: h * 0.015),
                    const Divider(thickness: 0.8, color: Colors.white12),
                    SizedBox(height: h * 0.015),

                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Protocols(),
                          ),
                        );
                      },

                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/6666.svg',
                            fit: BoxFit.cover,
                            height: 45,
                            width: 45,
                          ),
                          SizedBox(width: w * 0.025),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Протоколы',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: fontSizeTitle,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'Автоматический выбор \n(В данный момент: Shadowsocks)',
                                  style: TextStyle(
                                    color: Colors.white30,
                                    fontSize: fontSizeDesc,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Colors.white30,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
