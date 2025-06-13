import 'package:court_pro/ui/common/text_widget.dart';
import 'package:court_pro/ui/resources/app_assets.dart';
import 'package:court_pro/ui/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../core/enums/dashboard_view.dart';

class BottomBarWidget extends StatelessWidget {
  final DashboardType currentView;
  final ValueChanged<DashboardType> onTabSelected;

  const BottomBarWidget({
    super.key,
    required this.currentView,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 75,
        decoration: BoxDecoration(
          color: AppColors.darkPurple,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(27),
            topRight: Radius.circular(27),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(
              icon: AppAssets.icDashboard,
              label: DashboardType.dashboard.title,
              isSelected: currentView == DashboardType.dashboard,
              view: DashboardType.dashboard,
            ),
            _buildNavItem(
              icon: AppAssets.icWatch,
              label: DashboardType.watch.title,
              isSelected: currentView == DashboardType.watch,
              view: DashboardType.watch,
            ),
            _buildNavItem(
              icon: AppAssets.icMediaLibrary,
              label: DashboardType.mediaLibrary.title,
              isSelected: currentView == DashboardType.mediaLibrary,
              view: DashboardType.mediaLibrary,
            ),
            _buildNavItem(
              icon: AppAssets.icMore,
              label: DashboardType.more.title,
              isSelected: currentView == DashboardType.more,
              view: DashboardType.more,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required String icon,
    required String label,
    required bool isSelected,
    required DashboardType view,
  }) {
    return GestureDetector(
      onTap: () => onTabSelected(view),
      child: SizedBox(
        height: 75,
        width: 75,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              colorFilter: ColorFilter.mode(
                  isSelected ? Colors.white : AppColors.darkGrey,
                  BlendMode.srcIn),
              width: 16,
              height: 16,
            ),
            const SizedBox(height: 4),
            TextWidget(
              title: label,
              size: 10,
              color: isSelected ? Colors.white : AppColors.darkGrey,
            ),
          ],
        ),
      ),
    );
  }
}
