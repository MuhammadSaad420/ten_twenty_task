import '../../main.dart';

enum DashboardType {
  dashboard(0),
  watch(1),
  mediaLibrary(2),
  more(3);

  final int value;

  const DashboardType(this.value);
}

extension DashboardTypeExtension on DashboardType {
  String get title => switch (this) {
        DashboardType.dashboard => loc.dashboard_bn_dashboard,
        DashboardType.watch => loc.dashboard_bn_watch,
        DashboardType.mediaLibrary => loc.dashboard_bn_media_library,
        DashboardType.more => loc.dashboard_bn_more,
      };
}
