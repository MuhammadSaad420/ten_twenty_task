import 'package:court_pro/core/constants/app_constants.dart';
import 'package:court_pro/main.dart';
import 'package:court_pro/model/data/cinema_hall.dart';
import 'package:court_pro/ui/common/main_button.dart';
import 'package:court_pro/ui/resources/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';

import '../../../core/utils/date_utils.dart';
import '../../../model/args/seating_screen_args.dart';
import '../../../model/data/movies_response.dart';
import '../../common/reservation_app_bar.dart';
import '../../resources/app_colors.dart';
import 'components/cinema_listing.dart';
import 'components/date_listing.dart';

class HallSelectionScreen extends HookWidget {
  HallSelectionScreen({
    super.key,
    required this.movie,
  });

  final Movie movie;

  List<DateTime> ticketDates = [];
  DateTime selectedDate = DateTime.now();

  CinemaHall? selectedHall;
  @override
  Widget build(BuildContext context) {
    useEffect(() {
      ticketDates = DateUtil.generateDates(
          startDate: DateUtil.stringToDate(movie.releaseDate));
      selectedDate = ticketDates.first;
      return null;
    }, []);
    return Scaffold(
        body: Column(
      children: [
        ReservationAppBar(
          title: movie.originalTitle,
          subtitle: loc.movie_details_txt_in_theatre(
              DateUtil.formatStringDate(movie.releaseDate)),
        ),
        const Gap(90),
        DateListing(
          futureDates: ticketDates,
          currentDate: selectedDate,
          onDateSelected: (date) {
            selectedDate = date;
          },
        ),
        const Gap(40),
        CinemaListing(
          onSelection: (hall) => selectedHall = hall,
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 26),
          child: MainButton(
            title: loc.hall_selection_btn_select_seats,
            onPressed: () {
              final seatingArgs = SeatingScreenArgs(
                movieName: movie.originalTitle,
                hallTime:
                    selectedHall?.time ?? AppConstants.cinemaHalls.first.time,
                hallNumber: selectedHall?.number ??
                    AppConstants.cinemaHalls.first.number,
                date: selectedDate,
              );
              Navigator.pushNamed(context, AppRoutes.seatingRoute, arguments: seatingArgs);
            },
            buttonColor: AppColors.lightBlue,
            textColor: Colors.white,
            btnWidth: double.infinity,
          ),
        )
      ],
    ));
  }
}
