import 'package:flutter/material.dart';

class SwitchButton extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;

  const SwitchButton({super.key, required this.onThemeChanged});

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  late bool themeSwitch;

  @override
  void initState() {
    super.initState();
    themeSwitch = false;
  }

  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      value: themeSwitch,
      onChanged: (value) {
        setState(() {
          themeSwitch = value;
        });
        widget.onThemeChanged(value);
      },
    );
  }
}
