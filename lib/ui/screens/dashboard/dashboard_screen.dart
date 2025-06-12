import 'package:court_pro/providers/movie_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

import '../../../core/enums/dashboard_view.dart';
import 'components/bottom_bar_widget.dart';
import 'components/views/dashboard_view.dart';
import 'components/views/media_library_view.dart';
import 'components/views/more_view.dart';
import 'components/views/watch_view/watch_view.dart';

class DashboardScreen extends HookWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentView = useState(DashboardType.dashboard);
    useEffect(() {
      context.read<MovieProvider>().fetchUpcomingMovies();
      context.read<MovieProvider>().fetchGenres();
      return null;
    }, []);
    return Scaffold(
      bottomNavigationBar: BottomBarWidget(
        currentView: currentView.value,
        onTabSelected: (selectedView) {
          currentView.value = selectedView;
        },
      ),
      body: SafeArea(
          child: switch (currentView.value) {
        DashboardType.dashboard => const DashboardView(),
        DashboardType.watch => const WatchView(),
        DashboardType.mediaLibrary => const MediaLibraryView(),
        DashboardType.more => const MoreView(),
      }),
    );
  }
}
