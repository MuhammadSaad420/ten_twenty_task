import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

import '../../../../../../../providers/movie_provider.dart';
import 'watch_card.dart';

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
