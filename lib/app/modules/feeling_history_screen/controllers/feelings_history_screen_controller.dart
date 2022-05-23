import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:qubehealth/app/controllers/internet_connectivity_controller.dart';
import 'package:qubehealth/app/data/models/api_response_model.dart';
import 'package:qubehealth/app/data/models/feeling_response_model.dart';
import 'package:qubehealth/app/repository/pixabay_repo.dart';
import 'package:qubehealth/app/utils/functions/util_functions.dart';
import 'package:qubehealth/app/utils/screen_utils/size_config.dart';
import 'package:qubehealth/app/utils/screen_utils/widgets/build_snack_bar_enum.dart';

class FeelingHistoryScreenViewController extends GetxController {
  final FeelingsHistoryRepo _feelingRepo = FeelingsHistoryRepo();
  final InternetConnectivityController scaffoldController = Get.find<InternetConnectivityController>();

  final ScrollController scrollController = ScrollController();

  var lastMonthsFeelingList = <FeelingDataModel>[].obs;

  late int userId;
  late Rx<DateTime> selectedDate, minDate, maxDate;
  int selectedVideoIndex = -1;

  FeelingsResponseModel? feelingHistoryModel;
  PageController pageController = PageController(
    viewportFraction: .70,
  );

  RxString? getVideoDescriptionByIndex(int index) => feelingHistoryModel?.data?.videoArr[index].description.obs;

  RxString? getVideoTitleByIndex(int index) => feelingHistoryModel?.data?.videoArr[index].title.obs;

  RxString? getVideoURLByIndex(int index) => feelingHistoryModel?.data?.videoArr[index].youtubeUrl.obs;

  @override
  void onInit() {
    super.onInit();
    userId = int.parse(Get.parameters["userId"] ?? "0");

    selectedDate = DateTime(2022, 4, 15).obs;
    minDate = selectedDate.value
        .subtract(const Duration(
          days: 30,
        ))
        .obs;
    maxDate = DateTime.now().obs;
    selectedDate.value = maxDate.value;

    fetchFeelingsHistory();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    scrollController.dispose();
    pageController.dispose();
  }

  fetchFeelingsHistory() async {
    final res = await _feelingRepo.getFeelingHistory(
      userId,
      DateFormat(
        'dd-MM-yyyy',
      ).format(
        selectedDate.value,
      ),
    );
    if (res.status == ApiResponseStatus.completed) {
      feelingHistoryModel = res.data;
      lastMonthsFeelingList.value = convertToList(res.data!.data!.feelingPercentage.toJson());
      if (feelingHistoryModel!.data!.videoArr.isNotEmpty) {
        selectedVideoIndex = 0;
      }
      update();
    } else {
      buildSnackBar("${res.message}", "Something went wrong");
    }

    if (maxDate.value.difference(selectedDate.value).inDays < 1) {
      scrollController.animateTo(
        40.hdp() * selectedDate.value.difference(minDate.value).inDays,
        duration: const Duration(seconds: 1),
        curve: Curves.bounceOut,
      );
    }
  }

  launchYoutubeUrl(String url) async {
    try {
      UtilFunctions.launchYoutubeURL(url);
    } catch (e) {
      buildSnackBar(e.toString(), "Something went wrong");
    }
  }

  void changeSelectedDate(DateTime date) async {
    scaffoldController.setLoading();
    selectedDate.value = date;
    await fetchFeelingsHistory();
    scaffoldController.setUnloading();
  }

  onVideoChanged(int index) {
    selectedVideoIndex = index;
    update();
  }

  List<FeelingDataModel> convertToList(Map<String, dynamic> map) {
    List<FeelingDataModel> tempList = [];
    for (String feelingType in map.keys) {
      tempList.add(
        FeelingDataModel(
          feelingName: feelingType,
          feelingPercentage: map[feelingType],
          iconUrl: UtilFunctions.getIconUrlFromFeelingName(
            feelingType,
          ),
        ),
      );
    }
    return tempList;
  }
}
