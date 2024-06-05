import 'package:flutter/material.dart';
import 'package:ina17/common/common.dart';

class ButtonAnswer extends StatelessWidget {
  final String label;
  final VoidCallback onPress;
  const ButtonAnswer({
    super.key,
    required this.onPress,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      onPress: onPress,
      text: label,
    );
  }
}
