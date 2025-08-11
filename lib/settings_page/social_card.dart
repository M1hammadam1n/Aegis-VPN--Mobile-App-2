import 'package:flutter/material.dart';

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
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(12.0),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 45,
                height: 45,
                child: Image.asset(assetImagePath),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white30,
                ),
              ),
            ],
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Checkbox(
              value: value,
              onChanged: onChanged,
              activeColor: Colors.white,
              checkColor: Colors.black,
              side: const BorderSide(color: Colors.white),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50), // круглый чекбокс
              ),
            ),
          ),
        ],
      ),
    );
  }
}
