import 'package:court_pro/ui/screens/dashboard/components/views/watch_view/components/genre_listing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../../core/enums/watch_mode.dart';
import 'components/filtered_listing.dart';
import 'components/upcoming_listing.dart';
import 'components/watch_header.dart';

class WatchView extends HookWidget {
  const WatchView({super.key});

  @override
  Widget build(BuildContext context) {
    final currentMode = useState(WatchMode.normal);
    return Column(
      children: [
        WatchHeader(
          currentMode: currentMode.value,
          onModeToggled: (WatchMode mode) => currentMode.value = mode,
        ),
        if (currentMode.value == WatchMode.searched ||
            currentMode.value == WatchMode.searching)
          const FilteredListing(),
        if (currentMode.value == WatchMode.search) const GenreListing(),
        if (currentMode.value == WatchMode.normal) const UpcomingListing()
      ],
    );
  }
}
