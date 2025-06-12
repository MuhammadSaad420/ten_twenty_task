import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../../../main.dart';
import '../../../../../../common/icon_widget.dart';
import '../../../../../../resources/app_colors.dart';

class SearchTextField extends HookWidget {
  SearchTextField({
    super.key,
    required this.onClose,
    required this.onSubmit,
    required this.onTextEntered,
  });

  final VoidCallback onClose;
  final ValueChanged<String> onSubmit;
  final ValueChanged<String> onTextEntered;
  Timer? _debounce;

  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();
    useEffect(() {
      return () {
        _debounce?.cancel();
      };
    }, []);
    return Expanded(
      child: TextField(
        controller: searchController,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        onSubmitted: onSubmit,
        onChanged: (enteredText) {
          if (_debounce?.isActive ?? false) _debounce?.cancel();
          _debounce = Timer(const Duration(milliseconds: 1000), () {
            onTextEntered(enteredText);
          });
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          hintText: loc.dashboard_watch_tf_hint,
          hintStyle: TextStyle(
            color: AppColors.textFieldHintColor,
          ),
          filled: true,
          fillColor: AppColors.textFieldColor,
          suffixIcon: InkWell(
            onTap: () {
              searchController.clear();
              onClose();
            },
            child: const IconWidget(icon: Icons.close),
          ),
          prefixIcon: const IconWidget(icon: Icons.search),
        ),
      ),
    );
  }
}
