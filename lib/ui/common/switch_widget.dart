import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SwitchWidget extends HookWidget {
  const SwitchWidget({
    super.key,
    required this.isOn,
    this.isCupertino = true,
    required this.onChanged,
  });

  final bool isOn;
  final Function(bool)? onChanged;
  final bool isCupertino;
  @override
  Widget build(BuildContext context) {
    final isSwitchOn = useState(isOn);
    return isCupertino
        ? CupertinoSwitch(
            key: UniqueKey(),
            value: isSwitchOn.value,
            onChanged: onChanged == null
                ? null
                : (value) {
                    isSwitchOn.value = !isSwitchOn.value;
                    onChanged?.call(value);
                  },
          )
        : Switch(
            key: UniqueKey(),
            value: isSwitchOn.value,
            onChanged: onChanged == null
                ? null
                : (value) {
                    isSwitchOn.value = !isSwitchOn.value;
                    onChanged?.call(value);
                  },
          );
  }
}
