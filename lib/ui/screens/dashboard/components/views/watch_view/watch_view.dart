import 'package:court_pro/providers/movie_provider.dart';
import 'package:court_pro/ui/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

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
    final movieProvider = context.watch<MovieProvider>();
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
              itemCount: movieProvider.movies.length,
              itemBuilder: (_, index) => MovieResultCard(
                movie: movieProvider.movies[index],
              ),
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
        if (currentMode.value == WatchMode.search) const UpcomingListing()
      ],
    );
  }
}

class UpcomingListing extends HookWidget {
  const UpcomingListing({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final movieProvider = context.watch<MovieProvider>();
    final scrollController = useScrollController();
    bool isBottom() {
      return scrollController.position.maxScrollExtent ==
          scrollController.position.pixels;
    }

    Future<void> onScroll() async {
      if (isBottom()) {
        await movieProvider.fetchUpcomingMovies();
      }
    }

    useEffect(() {
      scrollController.addListener(onScroll);
      return null;
    }, []);

    return Expanded(
      child: ListView.builder(
        controller: scrollController,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
        itemCount: movieProvider.movies.length,
        itemBuilder: (_, index) => WatchCard(
          movie: movieProvider.movies[index],
        ),
      ),
    );
  }
}
