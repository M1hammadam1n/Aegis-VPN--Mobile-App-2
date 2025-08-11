import 'package:flutter/material.dart';

class DomainSwitch extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  const DomainSwitch({
    Key? key,
    required this.label,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 18, color: Colors.white)),
        Switch(
          value: value,
          activeColor: Colors.white,
          activeTrackColor: const Color(0xFF34c759),
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: const Color(0xFF6b6b6b),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
