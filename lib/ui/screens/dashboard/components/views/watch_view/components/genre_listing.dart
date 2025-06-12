import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../providers/movie_provider.dart';
import 'category_card.dart';

class GenreListing extends StatelessWidget {
  const GenreListing({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final movieProvider = context.watch<MovieProvider>();
    return Expanded(
      child: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.2,
          ),
          itemCount: movieProvider.genres.length,
          itemBuilder: (context, index) {
            return CatergoryCard(
              genre: movieProvider.genres[index],
            );
          }),
    );
  }
}
