import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';

import '../../../../../../../core/enums/watch_mode.dart';
import '../../../../../../../main.dart';
import '../../../../../../common/icon_widget.dart';
import '../../../../../../common/text_widget.dart';
import '../../../../../../resources/app_colors.dart';

class WatchHeader extends HookWidget {
  const WatchHeader({
    super.key,
    required this.currentMode,
    required this.onModeToggled,
  });

  final WatchMode currentMode;

  final ValueChanged<WatchMode> onModeToggled;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
      child: currentMode == WatchMode.search
          ? Row(
              children: [
                TextWidget(
                  title: loc.dashboard_watch_title,
                  size: 18,
                  weight: FontWeight.w500,
                ),
                const Spacer(),
                InkWell(
                    onTap: () => onModeToggled(WatchMode.searching),
                    child: const IconWidget(icon: Icons.search)),
              ],
            )
          : currentMode == WatchMode.searching
              ? Row(
                  children: [
                    SearchTextField(
                      onClose: () => onModeToggled(WatchMode.search),
                      onSubmit: (enteredText) =>
                          onModeToggled(WatchMode.searched),
                    ),
                  ],
                )
              : Row(
                  children: [
                    InkWell(
                      onTap: () => onModeToggled(WatchMode.search),
                      child: const IconWidget(
                        icon: Icons.arrow_back_ios,
                      ),
                    ),
                    const Gap(15),
                    const TextWidget(
                      title: "3 Results Found",
                      size: 16,
                      weight: FontWeight.w500,
                    )
                  ],
                ),
    );
  }
}

class SearchTextField extends HookWidget {
  const SearchTextField({
    super.key,
    required this.onClose,
    required this.onSubmit,
  });

  final VoidCallback onClose;
  final ValueChanged<String> onSubmit;

  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();
    return Expanded(
      child: TextField(
        controller: searchController,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        onSubmitted: onSubmit,
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
