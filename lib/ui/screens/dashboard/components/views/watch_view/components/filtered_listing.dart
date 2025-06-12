import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../providers/movie_filter_provider.dart';
import 'movie_result_card.dart';

class FilteredListing extends StatelessWidget {
  const FilteredListing({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final movieFilterProvider = context.watch<MovieFilterProvider>();
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
        itemCount: movieFilterProvider.filteredMovies.length,
        itemBuilder: (_, index) => MovieResultCard(
          movie: movieFilterProvider.filteredMovies[index],
        ),
      ),
    );
  }
}
