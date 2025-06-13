import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../common/main_button.dart';
import '../../../common/text_widget.dart';
import '../../../resources/app_colors.dart';

class SeatingFooter extends StatelessWidget {
  const SeatingFooter({super.key});

  @override
  Widget build(BuildContext context) {
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
}
