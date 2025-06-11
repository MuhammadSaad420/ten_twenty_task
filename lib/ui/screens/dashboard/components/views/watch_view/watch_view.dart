import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../../core/enums/watch_mode.dart';
import 'components/category_card.dart';
import 'components/movie_result_card.dart';
import 'components/watch_card.dart';
import 'components/watch_header.dart';

class WatchView extends HookWidget {
  const WatchView({super.key});

  @override
  Widget build(BuildContext context) {
    final currentMode = useState(WatchMode.search);
    return Column(
      children: [
        WatchHeader(
          currentMode: currentMode.value,
          onModeToggled: (WatchMode mode) => currentMode.value = mode,
        ),
        if (currentMode.value == WatchMode.searched)
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
              itemCount: 10,
              itemBuilder: (_, index) => const MovieResultCard(),
            ),
          ),
        if (currentMode.value == WatchMode.searching)
          Expanded(
            child: GridView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.2,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const CatergoryCard();
                }),
          ),
        if (currentMode.value == WatchMode.search)
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
              itemCount: 10,
              itemBuilder: (_, index) => const WatchCard(),
            ),
          )
      ],
    );
  }
}
