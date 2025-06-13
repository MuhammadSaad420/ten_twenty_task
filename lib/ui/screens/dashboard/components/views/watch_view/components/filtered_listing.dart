import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../providers/movie_filter_provider.dart';
import '../../../../../../common/text_widget.dart';
import 'movie_result_card.dart';

class FilteredListing extends StatelessWidget {
  const FilteredListing({
    super.key,
    required this.isSearching,
  });

  final bool isSearching;

  @override
  Widget build(BuildContext context) {
    final movieFilterProvider = context.watch<MovieFilterProvider>();
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(isSearching) const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  title: "Top Results",
                  size: 15,
                  weight: FontWeight.w500,
                ),
                Divider()
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
              itemCount: movieFilterProvider.filteredMovies.length,
              itemBuilder: (_, index) => MovieResultCard(
                movie: movieFilterProvider.filteredMovies[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
