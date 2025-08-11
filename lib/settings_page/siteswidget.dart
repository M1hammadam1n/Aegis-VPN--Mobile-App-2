import 'package:flutter/material.dart';
import 'dart:ui';

class SitesWidget extends StatefulWidget {
  const SitesWidget({super.key});

  @override
  State<SitesWidget> createState() => _SitesWidgetState();
}

class _SitesWidgetState extends State<SitesWidget> {
  final List<String> sites = [];
  final TextEditingController controller = TextEditingController();

  void _showAddSiteDialog() {
    controller.clear();

    showGeneralDialog(
      context: context,
      barrierLabel: "Добавить сайт",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.9),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Material(
              color: Colors.transparent,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height - 200,
                    padding: const EdgeInsets.all(20),
                    color: const Color(0xFF303030).withOpacity(0.9),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/Frame 2085661621.png'),
                        SizedBox(height: 15),
                        const Text(
                          'Добавьте сайт',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          'Вставьте или введите URL-адрес веб-сайта.',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            const Text(
                              'URL-адрес',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 15),
                            TextField(
                              controller: controller, // <-- добавь эту строчку
                              obscureText: false,
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                hintText: '',
                                filled: true,
                                fillColor: Colors.white10,
                                labelStyle: const TextStyle(
                                  color: Colors.white24,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              style: const TextStyle(color: Colors.white),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                        const Spacer(),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              final text = controller.text.trim();
                              if (text.isNotEmpty) {
                                setState(() {
                                  sites.add(text);
                                });
                                Navigator.of(context).pop();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              overlayColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              'Применить',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 50),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return FadeTransition(opacity: anim1, child: child);
      },
    );
  }

  void _removeSite(int index) {
    setState(() {
      sites.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF191919),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Сайты',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Выберите веб-сайты для обхода VPN.',
            style: TextStyle(
              color: Colors.white30,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 10),

          // Список добавленных сайтов
          ...sites.asMap().entries.map((entry) {
            final i = entry.key;
            final site = entry.value;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    site,

                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFF3A1E20),
                    ),
                    child: Text(
                      'Удалить',
                      style: TextStyle(color: Color(0xFFFF424C)),
                    ),
                    onPressed: () => _removeSite(i),
                  ),
                ],
              ),
            );
          }),

          const SizedBox(height: 10),

          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              onPressed: _showAddSiteDialog,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF303030),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
                overlayColor: Colors.black,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.add_circle, color: Colors.white, size: 25),
                  SizedBox(width: 8),
                  Text(
                    'Добавить сайт',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
