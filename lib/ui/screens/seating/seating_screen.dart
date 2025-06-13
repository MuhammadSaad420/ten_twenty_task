import 'package:court_pro/core/constants/app_constants.dart';
import 'package:court_pro/core/enums/image_type.dart';
import 'package:court_pro/core/enums/seat_status.dart';
import 'package:court_pro/ui/common/icon_widget.dart';
import 'package:court_pro/ui/common/image_widget.dart';
import 'package:court_pro/ui/common/main_button.dart';
import 'package:court_pro/ui/common/text_widget.dart';
import 'package:court_pro/ui/resources/app_assets.dart';
import 'package:court_pro/ui/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';

class SeatingScreen extends HookWidget {
  const SeatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    final currentScale = useState<double>(1);
    final screenHeight = MediaQuery.sizeOf(context).height;
    final selectedSeat = useState<(int, int)?>(null);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: screenHeight * 0.65,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Scrollbar(
                      controller: scrollController,
                      radius: const Radius.circular(10),
                      thumbVisibility: true,
                      child: SingleChildScrollView(
                        controller: scrollController,
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SeatingWidget(
                              scale: currentScale.value,
                              selectedSeat: selectedSeat.value,
                              onSeatTap: (seat) => selectedSeat.value = seat,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 70,
                  bottom: 20,
                  child: ZoomButton(
                    icon: Icons.add,
                    onPressed: () => currentScale.value += 0.1,
                  ),
                ),
                Positioned(
                  right: 30,
                  bottom: 20,
                  child: ZoomButton(
                    icon: Icons.remove,
                    onPressed: () => currentScale.value -= 0.1,
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 27, horizontal: 21),
            height: screenHeight * 0.35,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _seatsDescription(),
                if (selectedSeat.value != null)
                  _selectedSeat(
                      selectedSeat: selectedSeat.value!,
                      onTap: () => selectedSeat.value = null),
                _buttons()
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _selectedSeat(
      {required (int, int) selectedSeat, required VoidCallback onTap}) {
    final (row, col) = selectedSeat;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.unavailableSeatColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                  text: "${col + 1}  /",
                  style: TextStyle(
                    color: AppColors.darkBlue,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  children: [
                    TextSpan(
                      text: " ${row + 1} row",
                      style: TextStyle(
                        color: AppColors.darkBlue,
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ]),
            ),
            const Gap(15),
            const IconWidget(
              icon: Icons.close,
              iconSize: 14,
            )
          ],
        ),
      ),
    );
  }

  Row _seatsDescription() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getSeatDescription(seatStatus: SeatStatus.selected),
            const Gap(15),
            _getSeatDescription(seatStatus: SeatStatus.vip),
          ],
        ),
        const Gap(50),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getSeatDescription(seatStatus: SeatStatus.unavailable),
            const Gap(15),
            _getSeatDescription(seatStatus: SeatStatus.regular),
          ],
        )
      ],
    );
  }

  Row _buttons() {
    return Row(
      children: [
        _totalPrice(),
        const Gap(10),
        Expanded(
          flex: 3,
          child: MainButton(
            title: "Proceed to pay",
            onPressed: () {},
            buttonColor: AppColors.lightBlue,
            textColor: Colors.white,
          ),
        )
      ],
    );
  }

  Expanded _totalPrice() {
    return Expanded(
        flex: 2,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.unavailableSeatColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    title: "Total Price",
                    size: 10,
                    weight: FontWeight.w400,
                    color: AppColors.darkBlue,
                  ),
                  TextWidget(
                    title: "\$ 50",
                    size: 16,
                    weight: FontWeight.w600,
                    color: AppColors.darkBlue,
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  Row _getSeatDescription({required SeatStatus seatStatus}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SeatWidget(
          seatStatus: seatStatus,
          width: 21,
          height: 16,
        ),
        const Gap(5),
        TextWidget(
          title: seatStatus.label,
          size: 13,
          weight: FontWeight.w500,
          color: AppColors.overviewTextColor,
        )
      ],
    );
  }
}

class SeatingWidget extends StatelessWidget {
  const SeatingWidget({
    super.key,
    this.scale = 1,
    this.selectedSeat,
    required this.onSeatTap,
  });

  final double scale;
  final (int, int)? selectedSeat;
  final Function((int, int)?) onSeatTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const ImageWidget(
            imageSrc: AppAssets.icScreenCurve,
            type: ImageType.asset,
            isSvg: true,
          ),
          const Gap(10),
          ...List.generate(
            AppConstants.seats.length,
            (rowIndex) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Row(
                  children: [
                    SizedBox(
                      width: 6 * scale + 3,
                      child: TextWidget(
                        title: "${rowIndex + 1}",
                        size: 6 * scale,
                        weight: FontWeight.w700,
                      ),
                    ),
                    const Gap(12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          AppConstants.seats[rowIndex].length, (columnIndex) {
                        final currentSeat =
                            AppConstants.seats[rowIndex][columnIndex];
                        return GestureDetector(
                          onTap: () {
                            if (currentSeat == SeatStatus.regular) {
                              onSeatTap((rowIndex, columnIndex));
                            }
                            if ((rowIndex, columnIndex) == selectedSeat) {
                              onSeatTap(null);
                            }
                          },
                          child: SeatWidget(
                            scale: scale,
                            seatStatus: (rowIndex, columnIndex) == selectedSeat
                                ? SeatStatus.selected
                                : currentSeat,
                            width: 7,
                            height: 5,
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class ZoomButton extends StatelessWidget {
  const ZoomButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(color: AppColors.grey, width: 0.5),
        ),
        child: IconWidget(icon: icon),
      ),
    );
  }
}

class SeatWidget extends StatelessWidget {
  const SeatWidget({
    super.key,
    required this.seatStatus,
    this.scale = 1,
    required this.width,
    required this.height,
  });

  final double scale;
  final SeatStatus seatStatus;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: width * scale,
            height: height * scale,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: seatStatus.color,
            ),
          ),
          const Gap(0.5),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: (width / 1.7) * scale,
            height: (height / 5) * scale,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: seatStatus.color,
            ),
          ),
        ],
      ),
    );
  }
}
