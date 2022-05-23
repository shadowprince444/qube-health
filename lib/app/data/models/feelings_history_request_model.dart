class FeelingsHistoryRequestModel {
  FeelingsHistoryRequestModel({
    required this.userId,
    required this.feelingDate,
  });
  late final int userId;
  late final String feelingDate;

  FeelingsHistoryRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    feelingDate = json['feeling_date'];
  }

  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    data['user_id'] = userId;
    data['feeling_date'] = feelingDate;
    return data;
  }
}
