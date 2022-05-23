// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:qubehealth/app/modules/feeling_history_screen/controllers/homescreen_controller.dart';
import 'package:qubehealth/app/utils/functions/util_functions.dart';
import 'package:qubehealth/app/utils/screen_utils/size_config.dart';
import 'package:qubehealth/app/utils/screen_utils/widgets/spacing_widgets.dart';
import 'package:qubehealth/app/utils/theme/app_theme.dart';

class AnimatedHorizontalCalendar extends StatelessWidget {
  final Color textColor;
  final Color nonSelectedTextColor;
  final FeelingHistoryScreenViewController controller;

  // final Function? onDateSelected;

  const AnimatedHorizontalCalendar({
    Key? key,
    required this.controller,
    required this.textColor,
    required this.nonSelectedTextColor,
    // required this.onDateSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          controller: controller.scrollController,
          scrollDirection: Axis.horizontal,
          reverse: false,
          child: Row(
            children: <Widget>[
              ListView.builder(
                itemCount: controller.maxDate.value.difference(controller.minDate.value).inDays + 1,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                // padding: const EdgeInsets.z,
                itemBuilder: (context, index) {
                  // if (diffDays == 0) {
                  //   _scrollController.animateTo(
                  //     40.hdp() * index,
                  //     duration: const Duration(seconds: 1),
                  //     curve: Curves.bounceOut,
                  //   );
                  // }
                  return Obx(() {
                    DateTime date = controller.minDate.value.add(Duration(days: index));
                    int diffDays = date.difference(controller.selectedDate.value).inDays;

                    return Container(
                      width: 40.hdp(),
                      height: 70.vdp(),
                      padding: EdgeInsets.only(
                        top: 5.vdp(),
                      ),
                      decoration: BoxDecoration(
                          color: diffDays == 0 ? const Color(0xff4F4F4F) : Colors.transparent,
                          borderRadius: BorderRadius.circular(
                            10.vdp(),
                          )),

                      margin: const EdgeInsets.only(
                        // left: 5,
                        right: 5,
                      ),
                      // ignore: deprecated_member_use
                      child: FlatButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          controller.changeSelectedDate(date);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              UtilFunctions.getDayOfWeek(date).substring(0, 2),
                              maxLines: 1,
                              style: AppTheme.textThemes.subtitle2.copyWith(
                                color: AppTheme.appColors.blurredGreySubtitleTextColor,
                                // fontSize: 14.sp(),
                                // fontWeight: FontWeight.w400,
                              ),
                            ),
                            const VSpace(5),
                            Text(
                              UtilFunctions.getDayOfMonth(date),
                              maxLines: 1,
                              style: AppTheme.textThemes.bodyText2.copyWith(
                                color: diffDays == 0 ? textColor : nonSelectedTextColor,

                                // fontWeight: FontWeight.w600,
                              ),
                            ),
                            const VSpace(25),
                          ],
                        ),
                      ),
                    );
                  });
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
