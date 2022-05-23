import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qubehealth/app/data/models/feeling_response_model.dart';
import 'package:qubehealth/app/modules/feeling_history_screen/views/widgets/animated_horizontal_calender.dart';
import 'package:qubehealth/app/modules/feeling_history_screen/views/widgets/feeling_icon_widget.dart';
import 'package:qubehealth/app/modules/feeling_history_screen/views/widgets/monthly_feeling_percentage_indication_widget.dart';
import 'package:qubehealth/app/utils/functions/util_functions.dart';
import 'package:qubehealth/app/utils/screen_utils/size_config.dart';
import 'package:qubehealth/app/utils/screen_utils/widgets/app_custom_scaffold.dart';
import 'package:qubehealth/app/utils/screen_utils/widgets/responsive_safe_area.dart';
import 'package:qubehealth/app/utils/screen_utils/widgets/spacing_widgets.dart';
import 'package:qubehealth/app/utils/theme/app_theme.dart';

import '../controllers/feelings_history_screen_controller.dart';

class FeelingHistoryScreenView extends GetView<FeelingHistoryScreenViewController> {
  const FeelingHistoryScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AppCustomScaffold(
      statusBarColor: AppTheme.appColors.appPrimaryBackground,
      body: ResponsiveSafeArea(
        builder: (context, size) => SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              buildAppBar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      buildLastMonthsFeelingWidget(),
                      const CustomDivider(.2),
                      const VSpace(10),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.hdp(),
                        ),
                        child: SizedBox(
                          height: 148.vdp(),
                          width: size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: AppTheme.appColors.appPrimaryColorCyan,
                                  borderRadius: BorderRadius.circular(
                                    5.vdp(),
                                  ),
                                ),
                                padding: EdgeInsets.all(
                                  5.vdp(),
                                ),
                                child: Obx(() {
                                  return Text(
                                    UtilFunctions.getDate(controller.selectedDate.value),
                                    style: AppTheme.textThemes.bodyText2.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                }),
                              ),
                              const VSpace(20),
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: size.width,
                                  maxHeight: 70.vdp(),
                                ),
                                child: AnimatedHorizontalCalendar(
                                  // onDateSelected: (dateTime) {},
                                  textColor: AppTheme.appColors.blurredGrayTitleTextColor,
                                  nonSelectedTextColor: AppTheme.appColors.secondaryTextColor, controller: controller,
                                ),
                              ),
                              const VSpace(25),
                            ],
                          ),
                        ),
                      ),
                      const VSpace(10),
                      const CustomDivider(.2),
                      const SelectedDaysLoggedFeelingsWidget(),
                      // const VSpace(138),
                      const CustomDivider(.2),
                      const YoutubeVideosAndDesciptionsWidget(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildLastMonthsFeelingWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.hdp(),
      ),
      child: SizedBox(
        height: 157.vdp(),
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const VSpace(20),
          Text(
            "Your feelings from last 30 days",
            style: AppTheme.textThemes.headline2.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          const VSpace(10),
          Expanded(
            child: SizedBox(
              child: Obx(() {
                return ListView.separated(
                  itemCount: controller.lastMonthsFeelingList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => MonthlyFeelingPercentageIndicationWidget(
                    feelingDataModel: controller.lastMonthsFeelingList[index],
                  ),
                  separatorBuilder: (context, index) => const HSpace(15),
                );
              }),
            ),
          ),
          const VSpace(10),
        ]),
      ),
    );
  }

  SizedBox buildAppBar() {
    return SizedBox(
      height: 53.vdp(),
      width: double.infinity,
      child: Column(
        children: [
          const VSpace(10),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.vdp(),
                    ),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: AppTheme.appColors.primaryTextColor,
                      size: 25.vdp(),
                    ),
                  ),
                ),
                const HSpace(50),
                Text(
                  "Your Feelings History",
                  textAlign: TextAlign.center,
                  style: AppTheme.textThemes.headline3.copyWith(
                    color: AppTheme.appColors.primaryTextColor,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SelectedDaysLoggedFeelingsWidget extends StatelessWidget {
  const SelectedDaysLoggedFeelingsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GetBuilder<FeelingHistoryScreenViewController>(builder: (controller) {
        final list = controller.feelingHistoryModel?.data?.feelingList ?? [];
        if (list.isNotEmpty) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.hdp(),
            ),
            child: Column(
              children: [
                const VSpace(16),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.feelingHistoryModel?.data?.feelingList.length ?? 0,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final feeling = controller.feelingHistoryModel!.data!.feelingList[index];

                    return Row(
                      children: [
                        SizedBox(
                          width: 100.hdp(),
                          child: Text(
                            UtilFunctions.getTime(
                              DateTime.parse(feeling.submitTime),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTheme.textThemes.bodyText1.copyWith(
                              height: 1,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        FeelingIconWidget(
                          iconUrl: UtilFunctions.getIconUrlFromFeelingName(
                            feeling.feelingName,
                          ),
                          radius: 15,
                        ),
                        const HSpace(4),
                        Text(
                          feeling.feelingName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTheme.textThemes.bodyText1.copyWith(
                            height: 1,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                const VSpace(16),
              ],
            ),
          );
        } else {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.hdp(),
            ),
            child: Column(
              children: [
                const VSpace(16),
                Text(
                  "Sorry ,No Feelings Logged for the selected date",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.textThemes.bodyText1.copyWith(
                    height: 1,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const VSpace(16),
              ],
            ),
          );
        }
      }),
    );
  }
}

class YoutubeVideosAndDesciptionsWidget extends StatelessWidget {
  const YoutubeVideosAndDesciptionsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 349,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.hdp(),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VSpace(32),
            GetBuilder<FeelingHistoryScreenViewController>(builder: (controller) {
              return Text(
                controller.feelingHistoryModel?.data?.videoArr.first.title ?? "",
                style: AppTheme.textThemes.headline3,
              );
            }),
            const VSpace(10),
            GetBuilder<FeelingHistoryScreenViewController>(builder: (controller) {
              return Text(
                "${controller.feelingHistoryModel?.data?.videoArr.first.description}",
                style: AppTheme.textThemes.bodyText1.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.appColors.primaryTextColor.withOpacity(
                      .4,
                    )),
              );
            }),
            const VSpace(10),
            SizedBox(
              height: 128.vdp(),
              width: Get.width - 40.hdp(),
              child: GetBuilder<FeelingHistoryScreenViewController>(builder: (controller) {
                return PageView(
                  padEnds: false,
                  pageSnapping: true,
                  onPageChanged: (index) {
                    controller.onVideoChanged(index);
                  },
                  scrollDirection: Axis.horizontal,
                  controller: controller.pageController,
                  children: (controller.feelingHistoryModel?.data?.videoArr ?? <VideoArr>[])
                      .map((element) => Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.hdp(),
                            ),
                            child: GestureDetector(
                              onTap: () => controller.launchYoutubeUrl(element.youtubeUrl),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  10.vdp(),
                                ),
                                child: SizedBox(
                                  height: 128.vdp(),
                                  width: 208.hdp(),
                                  // constraints: BoxConstraints(
                                  //   maxWidth: 208.hdp(),
                                  // ),
                                  // decoration: BoxDecoration(
                                  //   borderRadius:
                                  // ),
                                  child: Stack(
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: UtilFunctions.getYoutubeThumbnail(element.youtubeUrl),
                                        fit: BoxFit.cover,
                                        height: 128.vdp(),
                                        width: 208.hdp(),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.play_circle_outline,
                                          size: 50.vdp(),
                                          color: AppTheme.appColors.blurredGrayTitleTextColor,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
