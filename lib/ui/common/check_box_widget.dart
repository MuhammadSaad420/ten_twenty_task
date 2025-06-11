import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CheckBoxWidget extends HookWidget {
  const CheckBoxWidget({
    super.key,
    required this.initialValue,
    required this.onChange,
  });

  final bool initialValue;
  final ValueChanged<bool?> onChange;

  @override
  Widget build(BuildContext context) {
    final isOn = useState(initialValue);
    return Checkbox(
      value: isOn.value,
      onChanged: (on) {
        isOn.value = on ?? false;
        onChange(on);
      },
    );
  }
}
