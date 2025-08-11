import 'package:aegis_vpn/settings_page/domain_switch.dart';
import 'package:aegis_vpn/settings_page/siteswidget.dart';
import 'package:aegis_vpn/settings_page/social_card.dart';
import 'package:flutter/material.dart';

class SettingsRouting extends StatefulWidget {
  const SettingsRouting({super.key});

  @override
  State<SettingsRouting> createState() => _SettingsRoutingState();
}

class _SettingsRoutingState extends State<SettingsRouting> {
  bool isRoutingEnabled1 = false; // состояние переключателя
  bool isRoutingEnabled2 = true; // состояние переключателя

  bool isChecked1 = true;
  bool isChecked2 = false;
  bool isChecked3 = true;
  bool isChecked4 = false;
  bool isChecked5 = true;
  bool isChecked6 = true;
  bool isChecked7 = true;
  bool isChecked8 = false;
  bool domains1 = true;
  bool domains2 = false;
  bool domains3 = true;
  bool domains4 = false;
  bool domains5 = true;
  bool domains6 = false;
  bool domains7 = true;
  bool domains8 = false;
  bool domains9 = true;
  bool domains10 = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;

    // Ограничиваем максимальную ширину контента для больших экранов
    final maxContentWidth = w > 800 ? 800.0 : w * 0.96;

    // Адаптивные размеры
    final pagePadding = (w * 0.03).clamp(10.0, 24.0);
    final innerPadding = (w * 0.04).clamp(10.0, 20.0);
    final blockCornerRadius = (w * 0.02).clamp(12.0, 24.0);

    final titleFontSize = (w * 0.045).clamp(14.0, 20.0);
    final descFontSize = (w * 0.05).clamp(13.0, 18.0);
    final headingFontSize = (w * 0.05).clamp(16.0, 22.0);

    // Карточки соцсетей: высота адаптивная, но в разумных пределах
    final cardHeight = (h * 0.17).clamp(110.0, 160.0);

    // Размер изображения (вверху блоки)
    final topImageSize = (w * 0.16).clamp(56.0, 100.0);

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
        title: Text(
          'Роутинг',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: headingFontSize,
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: maxContentWidth,
          padding: EdgeInsets.all(pagePadding),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              // Блок 1
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF191919),
                  borderRadius: BorderRadius.circular(blockCornerRadius),
                ),
                child: Padding(
                  padding: EdgeInsets.all(innerPadding),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: topImageSize,
                            height: topImageSize,
                            child: Image.asset('assets/images/Frame 2085661621.png'),
                          ),
                          SizedBox(width: w * 0.03),
                          Expanded(
                            child: Text(
                              'Позволяет пользоваться \nвеб-сайтами и приложениями \nв обход VPN.',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: descFontSize,
                                fontWeight: FontWeight.w500,
                                height: 1.25,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: h * 0.015),
                      const Divider(thickness: 0.8, color: Colors.white12),
                      SizedBox(height: h * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isRoutingEnabled1 = !isRoutingEnabled1;
                              });
                            },
                            child: Text(
                              isRoutingEnabled1 ? 'Включено' : 'Выключено',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: titleFontSize,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Switch(
                            value: isRoutingEnabled1,
                            activeColor: Colors.white,
                            activeTrackColor: const Color(0xFF34c759),
                            inactiveThumbColor: Colors.white,
                            inactiveTrackColor: const Color(0xFF6b6b6b),
                            onChanged: (bool value) {
                              setState(() {
                                isRoutingEnabled1 = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: h * 0.02),

              // Блок "Приложения"
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF191919),
                  borderRadius: BorderRadius.circular(blockCornerRadius),
                ),
                child: Padding(
                  padding: EdgeInsets.all(innerPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Приложения',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: h * 0.005),
                      Text(
                        'Выберите приложения для обхода VPN.',
                        style: TextStyle(
                          color: Colors.white30,
                          fontSize: descFontSize,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: h * 0.02),

                      // Ряды карточек — высота адаптивна
                      SizedBox(
                        height: cardHeight,
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(right: w * 0.02),
                                child: SocialCard(
                                  title: 'YouTube',
                                  subtitle: 'Доступно',
                                  assetImagePath: 'assets/images/video.png',
                                  value: isChecked1,
                                  onChanged: (bool? val) {
                                    setState(() {
                                      isChecked1 = val ?? false;
                                    });
                                  },
                                  backgroundColor: const Color(0xFF31191b),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: w * 0.02),
                                child: SocialCard(
                                  title: 'Instagram',
                                  subtitle: 'Доступно',
                                  assetImagePath: 'assets/images/instagram.png',
                                  value: isChecked2,
                                  onChanged: (bool? val) {
                                    setState(() {
                                      isChecked2 = val ?? false;
                                    });
                                  },
                                  backgroundColor: const Color(0xFF2b1c26),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: h * 0.02),
                      SizedBox(
                        height: cardHeight,
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(right: w * 0.02),
                                child: SocialCard(
                                  title: 'Facebook',
                                  subtitle: 'Доступно',
                                  assetImagePath: 'assets/images/facebook.png',
                                  value: isChecked3,
                                  onChanged: (bool? val) {
                                    setState(() {
                                      isChecked3 = val ?? false;
                                    });
                                  },
                                  backgroundColor: const Color(0xFF19232f),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: w * 0.02),
                                child: SocialCard(
                                  title: 'TikTok',
                                  subtitle: 'Доступно',
                                  assetImagePath: 'assets/images/tiktok.png',
                                  value: isChecked4,
                                  onChanged: (bool? val) {
                                    setState(() {
                                      isChecked4 = val ?? false;
                                    });
                                  },
                                  backgroundColor: const Color(0xFF311924),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: h * 0.02),
                      SizedBox(
                        height: cardHeight,
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(right: w * 0.02),
                                child: SocialCard(
                                  title: 'X (Twitter)',
                                  subtitle: 'Доступно',
                                  assetImagePath: 'assets/images/social_x.png',
                                  value: isChecked5,
                                  onChanged: (bool? val) {
                                    setState(() {
                                      isChecked5 = val ?? false;
                                    });
                                  },
                                  backgroundColor: const Color(0xFF282828),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: w * 0.02),
                                child: SocialCard(
                                  title: 'Telegram',
                                  subtitle: 'Доступно',
                                  assetImagePath: 'assets/images/telegram.png',
                                  value: isChecked6,
                                  onChanged: (bool? val) {
                                    setState(() {
                                      isChecked6 = val ?? false;
                                    });
                                  },
                                  backgroundColor: const Color(0xFF1b282f),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: h * 0.02),
                      SizedBox(
                        height: cardHeight,
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(right: w * 0.02),
                                child: SocialCard(
                                  title: 'Discord',
                                  subtitle: 'Доступно',
                                  assetImagePath: 'assets/images/discord.png',
                                  value: isChecked7,
                                  onChanged: (bool? val) {
                                    setState(() {
                                      isChecked7 = val ?? false;
                                    });
                                  },
                                  backgroundColor: const Color(0xFF20212f),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: w * 0.02),
                                child: SocialCard(
                                  title: 'ChatGPT',
                                  subtitle: 'Доступно',
                                  assetImagePath: 'assets/images/openai.png',
                                  value: isChecked8,
                                  onChanged: (bool? val) {
                                    setState(() {
                                      isChecked8 = val ?? false;
                                    });
                                  },
                                  backgroundColor: const Color(0xFF303030),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: h * 0.015),
                    ],
                  ),
                ),
              ),

              SizedBox(height: h * 0.02),

              // SitesWidget (оставляем как есть, он сам отвечает за свою адаптацию)
              SitesWidget(),

              SizedBox(height: h * 0.02),

              // Блок 2 (домены и переключатель)
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF191919),
                  borderRadius: BorderRadius.circular(blockCornerRadius),
                ),
                child: Padding(
                  padding: EdgeInsets.all(innerPadding),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: topImageSize,
                            height: topImageSize,
                            child: Image.asset('assets/images/Frame 2085661621.png'),
                          ),
                          SizedBox(width: w * 0.03),
                          Expanded(
                            child: Text(
                              'Выберите приложения и доменные зоны для исключения их из VPN.',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: descFontSize,
                                fontWeight: FontWeight.w500,
                                height: 1.25,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: h * 0.015),
                      const Divider(thickness: 0.8, color: Colors.white12),
                      SizedBox(height: h * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isRoutingEnabled2 = !isRoutingEnabled2;
                              });
                            },
                            child: Text(
                              isRoutingEnabled2 ? 'Включено' : 'Выключено',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: titleFontSize,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Switch(
                            value: isRoutingEnabled2,
                            activeColor: Colors.white,
                            activeTrackColor: const Color(0xFF34c759),
                            inactiveThumbColor: Colors.white,
                            inactiveTrackColor: const Color(0xFF6b6b6b),
                            onChanged: (bool value) {
                              setState(() {
                                isRoutingEnabled2 = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: h * 0.02),

              // Блок Домены
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF191919),
                  borderRadius: BorderRadius.circular(blockCornerRadius),
                ),
                child: Padding(
                  padding: EdgeInsets.all(innerPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Домены',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: titleFontSize + 1,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: h * 0.01),
                      const Divider(thickness: 0.8, color: Colors.white12),
                      SizedBox(height: h * 0.01),

                      DomainSwitch(
                        label: '*.ru',
                        value: domains1,
                        onChanged: (val) {
                          setState(() {
                            domains1 = val;
                          });
                        },
                      ),
                      DomainSwitch(
                        label: '*.ua',
                        value: domains2,
                        onChanged: (val) {
                          setState(() {
                            domains2 = val;
                          });
                        },
                      ),
                      DomainSwitch(
                        label: '*.com',
                        value: domains3,
                        onChanged: (val) {
                          setState(() {
                            domains3 = val;
                          });
                        },
                      ),
                      DomainSwitch(
                        label: '*.kz',
                        value: domains4,
                        onChanged: (val) {
                          setState(() {
                            domains4 = val;
                          });
                        },
                      ),
                      DomainSwitch(
                        label: '*.uk',
                        value: domains5,
                        onChanged: (val) {
                          setState(() {
                            domains5 = val;
                          });
                        },
                      ),
                      DomainSwitch(
                        label: '*.by',
                        value: domains6,
                        onChanged: (val) {
                          setState(() {
                            domains6 = val;
                          });
                        },
                      ),
                      DomainSwitch(
                        label: '*.net',
                        value: domains7,
                        onChanged: (val) {
                          setState(() {
                            domains7 = val;
                          });
                        },
                      ),
                      DomainSwitch(
                        label: '*.su',
                        value: domains8,
                        onChanged: (val) {
                          setState(() {
                            domains8 = val;
                          });
                        },
                      ),
                      DomainSwitch(
                        label: '*.рф',
                        value: domains9,
                        onChanged: (val) {
                          setState(() {
                            domains9 = val;
                          });
                        },
                      ),
                      DomainSwitch(
                        label: '*.cn',
                        value: domains10,
                        onChanged: (val) {
                          setState(() {
                            domains10 = val;
                          });
                        },
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
