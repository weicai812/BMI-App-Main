import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  final double min;
  final double max;
  final double value;
  final Function(double) onChanged;

  CustomSlider({this.max, this.min, this.value, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
          activeTrackColor: Colors.yellow[900],
          thumbColor: Colors.yellow[900],
          inactiveTrackColor: Colors.grey,
          overlayColor: Color(0x3FF57F15)),
      child: Slider(min: min, max: max, value: value, onChanged: onChanged),
    );
  }
}
