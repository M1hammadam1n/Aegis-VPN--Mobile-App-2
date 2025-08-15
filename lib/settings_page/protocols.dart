import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Protocols extends StatefulWidget {
  const Protocols({super.key});

  @override
  State<Protocols> createState() => _ProtocolsState();
}

class _ProtocolsState extends State<Protocols> {
  bool isChecked1 = false;
  bool isChecked2 = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;
    final maxContentWidth = w > 600 ? 600.0 : w * 0.95;
    final titleFontSize = w * 0.045 < 16 ? w * 0.045 : 16.0;
    final descFontSize = w * 0.02 < 16 ? w * 0.035 : 16.0;
    final paddingAll = w * 0.04;
    final topImageSize = (w * 0.05).clamp(40.0, 80.0);

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
          'Протоколы',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 30,
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: maxContentWidth,
          padding: EdgeInsets.symmetric(
            horizontal: paddingAll,
            vertical: h * 0.02,
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF191919),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(paddingAll),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: topImageSize,
                      height: topImageSize,
                      child: SvgPicture.asset('assets/icons/55.svg'),
                    ),
                    SizedBox(width: w * 0.04),
                    Expanded(
                      child: Text(
                        'Протокол обеспечивает безопасное\nподключение к интернету, маскируя\nваш IP-адрес и шифруя трафик.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: descFontSize,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: h * 0.025),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF191919),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(paddingAll),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Протоколы',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    SizedBox(height: h * 0.015),

                    const Divider(thickness: 0.8, color: Colors.white12),

                    SizedBox(height: h * 0.015),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Shadowsocks',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: titleFontSize,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'Скорость: высокая',
                              style: TextStyle(
                                color: Colors.white30,
                                fontSize: descFontSize,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Checkbox(
                          value: isChecked1,
                          onChanged: (val) {
                            setState(() {
                              isChecked1 = val ?? false;
                            });
                          },
                          activeColor: Colors.white,
                          checkColor: Colors.black,
                          side: const BorderSide(color: Colors.white),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: h * 0.015),

                    const Divider(thickness: 0.8, color: Colors.white12),

                    SizedBox(height: h * 0.015),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'VLESS',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: titleFontSize,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'Скорость: средняя',
                              style: TextStyle(
                                color: Colors.white30,
                                fontSize: descFontSize,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Checkbox(
                          value: isChecked2,
                          onChanged: (val) {
                            setState(() {
                              isChecked2 = val ?? false;
                            });
                          },
                          activeColor: Colors.white,
                          checkColor: Colors.black,
                          side: const BorderSide(color: Colors.white),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ],
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
