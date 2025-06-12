import 'package:court_pro/providers/movie_provider.dart';
import 'package:court_pro/ui/common/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../main.dart';
import 'components/movie_description.dart';
import 'components/movie_header.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key, required this.matchId});

  final int matchId;

  @override
  Widget build(BuildContext context) {
    final movieProvider = context.read<MovieProvider>();
    return Scaffold(
      body: FutureBuilder(
        future: movieProvider.fetchMovieInfo(id: matchId),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(
                child: TextWidget(title: loc.msg_no_network_available),
              );

            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );

            case ConnectionState.active:
              return const Center(
                child: CircularProgressIndicator(),
              );

            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        color: Colors.red,
                        size: 60,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '${snapshot.error}',
                        style: const TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          // Retry loading the movie details
                          context
                              .read<MovieProvider>()
                              .fetchMovieInfo(id: matchId);
                        },
                        child: TextWidget(title: loc.retry),
                      ),
                    ],
                  ),
                );
              }

              if (!snapshot.hasData) {
                return Center(
                  child: TextWidget(title: loc.msg_no_data_available),
                );
              }

              return SingleChildScrollView(
                child: Column(
                  children: [
                    MovieHeader(
                      movie: snapshot.data!,
                    ),
                    MovieDecription(
                      movie: snapshot.data!,
                    ),
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}
