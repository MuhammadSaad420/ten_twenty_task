import 'package:court_pro/providers/movie_filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../../../../core/enums/watch_mode.dart';
import '../../../../../../../main.dart';
import '../../../../../../common/icon_widget.dart';
import '../../../../../../common/text_widget.dart';
import 'search_text_field.dart';

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
    final filteredMovies = context.read<MovieFilterProvider>().filteredMovies;
    return Material(
      elevation: 0.2,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 22),
        child: currentMode == WatchMode.normal
            ? Row(
                children: [
                  TextWidget(
                    title: loc.dashboard_watch_title,
                    size: 18,
                    weight: FontWeight.w500,
                  ),
                  const Spacer(),
                  InkWell(
                      onTap: () => onModeToggled(WatchMode.search),
                      child: const IconWidget(icon: Icons.search)),
                ],
              )
            : currentMode == WatchMode.searching ||
                    currentMode == WatchMode.search
                ? Row(
                    children: [
                      SearchTextField(
                        onClose: () => onModeToggled(WatchMode.normal),
                        onSubmit: (enteredText) =>
                            onModeToggled(WatchMode.searched),
                        onTextEntered: (enteredText) {
                          if (currentMode == WatchMode.search &&
                              enteredText.isNotEmpty) {
                            onModeToggled(WatchMode.searching);
                          }
                          if (enteredText.isNotEmpty) {
                            context
                                .read<MovieFilterProvider>()
                                .searchByKeyword(keyword: enteredText, page: 1);
                          }
                        },
                      ),
                    ],
                  )
                : Row(
                    children: [
                      InkWell(
                        onTap: () => onModeToggled(WatchMode.normal),
                        child: const IconWidget(
                          icon: Icons.arrow_back_ios,
                        ),
                      ),
                      const Gap(15),
                      TextWidget(
                        title: loc.dashboard_txt_result(filteredMovies.length),
                        size: 16,
                        weight: FontWeight.w500,
                      )
                    ],
                  ),
      ),
    );
  }
}
