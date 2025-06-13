import 'package:court_pro/core/extensions/date_time_extensions.dart';
import 'package:court_pro/model/args/seating_screen_args.dart';
import 'package:court_pro/ui/common/reservation_app_bar.dart';
import 'package:court_pro/ui/screens/seating/components/seats_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../main.dart';
import 'components/seating_footer.dart';
import 'components/seating_widget.dart';
import 'components/selected_seat_chip.dart';
import 'components/zoom_button.dart';

class SeatingScreen extends HookWidget {
  const SeatingScreen({super.key, required this.seatingArgs});

  final SeatingScreenArgs seatingArgs;

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    final currentScale = useState<double>(1);
    final selectedSeat = useState<(int, int)?>(null);
    return Scaffold(
      body: Column(
        children: [
          ReservationAppBar(
            title: seatingArgs.movieName,
            subtitle:
                "${seatingArgs.date.parse(dateFormat: "MMMM d, y")} | ${loc.seating_txt_hall(seatingArgs.hallNumber)}",
          ),
          Expanded(
            flex: 3,
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Stack(
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
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 50),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SeatingWidget(
                                      scale: currentScale.value,
                                      selectedSeat: selectedSeat.value,
                                      onSeatTap: (seat) =>
                                          selectedSeat.value = seat,
                                    ),
                                  ],
                                ),
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
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 27, horizontal: 21),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SeatsInfo(),
                  if (selectedSeat.value != null)
                    SelectedSeatChip(
                        selectedSeat: selectedSeat.value!,
                        onTap: () => selectedSeat.value = null),
                  const SeatingFooter()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
