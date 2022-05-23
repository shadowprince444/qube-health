import 'package:flutter/material.dart';
import 'package:qubehealth/app/data/models/feeling_response_model.dart';
import 'package:qubehealth/app/modules/homescreen/views/widgets/feeling_icon_widget.dart';
import 'package:qubehealth/app/utils/screen_utils/size_config.dart';
import 'package:qubehealth/app/utils/screen_utils/widgets/spacing_widgets.dart';
import 'package:qubehealth/app/utils/theme/app_theme.dart';

class MonthlyFeelingPercentageIndicationWidget extends StatelessWidget {
  final FeelingDataModel feelingDataModel;

  const MonthlyFeelingPercentageIndicationWidget({
    Key? key,
    required this.feelingDataModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: feelingDataModel.feelingPercentage == null ? .5 : 1,
      child: Column(
        children: [
          Container(
            height: 80.vdp(),
            width: 40.vdp(),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                20.vdp(),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.appColors.primaryTextColor.withOpacity(.1),
                  offset: Offset(
                    4.hdp(),
                    4.vdp(),
                  ),
                  blurRadius: 8.vdp(),
                ),
              ],
              color: AppTheme.appColors.blurredGrayTitleTextColor,
            ),
            child: Column(children: [
              const VSpace(16),
              Visibility(
                visible: feelingDataModel.feelingPercentage != null,
                child: Text(
                  "${feelingDataModel.feelingPercentage}%",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.textThemes.subtitle2.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
              const Expanded(
                child: SizedBox(),
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.appColors.appPrimaryColorGreen,
                ),
                height: 40.vdp(),
                width: 40.vdp(),
                padding: EdgeInsets.all(10.vdp()),
                child: FeelingIconWidget(
                  iconUrl: feelingDataModel.iconUrl,
                  radius: 20,
                ),
              ),
            ]),
          ),
          const VSpace(4),
          Text(
            feelingDataModel.feelingName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTheme.textThemes.subtitle2.copyWith(
              height: 1,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
