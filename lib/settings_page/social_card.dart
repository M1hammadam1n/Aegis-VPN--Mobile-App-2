import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String assetImagePath;
  final bool value;
  final ValueChanged<bool?> onChanged;
  final Color backgroundColor;

  const SocialCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.assetImagePath,
    required this.value,
    required this.onChanged,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenWidth < 350;
    final maxCardHeight =
        screenHeight * 0.20 < 120 ? 120.0 : screenHeight * 0.25;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        constraints: BoxConstraints(
          minWidth: isSmallScreen ? 130 : 150,
          maxWidth: isSmallScreen ? 170 : 200,
          maxHeight: maxCardHeight,
          minHeight: 100,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.all(isSmallScreen ? 10.0 : 12.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: isSmallScreen ? 40 : 45,
                  height: isSmallScreen ? 40 : 40,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: SvgPicture.asset(assetImagePath),
                  ),
                ),

                SizedBox(height: isSmallScreen ? 6 : 8),

                Flexible(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: isSmallScreen ? 18 : 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                ),
                Flexible(
                  child: Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: isSmallScreen ? 16 : 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white30,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                ),
              ],
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Checkbox(
                      value: value,
                      onChanged: onChanged,
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
          ],
        ),
      ),
    );
  }
}
