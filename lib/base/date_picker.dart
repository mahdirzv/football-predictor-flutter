import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:football_predictor_flutter/resources/app_colours.dart';
import 'package:football_predictor_flutter/resources/app_font_styles.dart';
import 'package:intl/intl.dart';

class AppDatePicker extends StatelessWidget {
  final DateTime currentDate = DateTime.now();

  AppDatePicker({super.key, required this.scrollController, required this.onDateSelected, this.selectedDate});

  final ScrollController scrollController;
  final Function(DateTime) onDateSelected;
  final DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: ListView.builder(
        shrinkWrap: true,
        controller: scrollController,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        scrollDirection: Axis.horizontal,
        itemCount: 21,
        itemBuilder: (context, index) {
          final date = currentDate.subtract(Duration(days: 10 - index));
          final isSelected = selectedDate?.day == date.day && selectedDate?.month == date.month && selectedDate?.year == date.year;
          return _getDateItem(onDateSelected, date, isSelected);
        },
      ),
    );
  }

  _getDateItem(Function(DateTime) onDateSelected, DateTime date, bool isSelected) {
    return GestureDetector(
      onTap: () { onDateSelected(date);},
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Column(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                color: AppColors.white1,
              ),
              alignment: Alignment.center,
              width: 60.0,
              height: 35,
              child: Text(
                '${date.day}',
                style: AppStyles.nunitoBlack.copyWith(fontSize: 24.0, color: isSelected ? AppColors.black2 : AppColors.black6),
              ),
            ),

            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                color: isSelected ? AppColors.black2 : AppColors.white3,
              ),
              alignment: Alignment.center,
              width: 60,
              height: 20,
              child: Text(
                DateFormat('EEE').format(date),
                style: AppStyles.nunitoMedium.copyWith(color: isSelected ? AppColors.white5 : AppColors.black2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}