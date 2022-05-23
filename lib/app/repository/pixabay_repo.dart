import 'dart:convert';

import 'package:qubehealth/app/data/models/api_response_model.dart';
import 'package:qubehealth/app/data/models/feeling_response_model.dart';
import 'package:qubehealth/app/data/models/feelings_history_request_model.dart';
import 'package:qubehealth/app/interface/i_pixabay_repo.dart';
import 'package:qubehealth/app/services/dio_client.dart';

///concrete implementation for the [FeelingsHistoryRepo] (repository)using the [IFeelingsHistoryRepo] (interface) definition

class FeelingsHistoryRepo implements IFeelingsHistoryRepo {
  final _dioClient = DioClient();

  @override
  Future<ApiResponse<FeelingsResponseModel>> getFeelingHistory(int userId, String date) async {
    try {
      final response = await _dioClient.request(
        uri: ApiUrls.baseUrl + ApiUrls.fetchFeelingHistory,
        method: ApiMethod.post,
        params: json.encode(
          FeelingsHistoryRequestModel(
            userId: userId,
            feelingDate: date,
          ).toJson(),
        ),
      );
      var decodedResponse = json.decode(response.data);
      var feelingsResponseModel = FeelingsResponseModel.fromJson(
        decodedResponse,
      );
      if (feelingsResponseModel.data != null) {
        return ApiResponse<FeelingsResponseModel>.completed(
          feelingsResponseModel,
        );
      } else {
        return ApiResponse<FeelingsResponseModel>.error(decodedResponse["data"].first);
      }
    } catch (e) {
      return ApiResponse<FeelingsResponseModel>.error(e.toString());
    }
  }
}
