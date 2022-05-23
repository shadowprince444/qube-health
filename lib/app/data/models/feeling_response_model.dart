class FeelingsResponseModel {
  FeelingsResponseModel({
    required this.status,
    required this.data,
  });

  late final String status;
  late final Data? data;

  FeelingsResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (status == "200") {
      data = Data.fromJson(json['data']);
    } else {
      data = null;
    }
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['data'] = data?.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.feelingPercentage,
    required this.feelingList,
    required this.videoArr,
  });

  late final FeelingPercentage feelingPercentage;
  late final List<FeelingList> feelingList;
  late final List<VideoArr> videoArr;

  Data.fromJson(Map<String, dynamic> json) {
    feelingPercentage = FeelingPercentage.fromJson(json['feeling_percentage']);
    feelingList = List.from(json['feeling_list']).map((e) => FeelingList.fromJson(e)).toList();
    videoArr = List.from(json['video_arr']).map((e) => VideoArr.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['feeling_percentage'] = feelingPercentage.toJson();
    _data['feeling_list'] = feelingList.map((e) => e.toJson()).toList();
    _data['video_arr'] = videoArr.map((e) => e.toJson()).toList();
    return _data;
  }
}

class FeelingPercentage {
  FeelingPercentage({
    required this.happy,
    required this.sad,
    required this.energetic,
    required this.calm,
    required this.angry,
    required this.bored,
  });

  late final String happy;
  late final String sad;
  late final String energetic;
  late final String calm;
  late final String angry;
  late final String bored;

  FeelingPercentage.fromJson(Map<String, dynamic> json) {
    happy = json['Happy'];
    sad = json['Sad'];
    energetic = json['Energetic'];
    calm = json['Calm'];
    angry = json['Angry'];
    bored = json['Bored'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Happy'] = happy;
    _data['Sad'] = sad;
    _data['Energetic'] = energetic;
    _data['Calm'] = calm;
    _data['Angry'] = angry;
    _data['Bored'] = bored;
    return _data;
  }
}

class FeelingList {
  FeelingList({
    required this.userFeelingId,
    required this.feelingId,
    required this.feelingName,
    required this.submitTime,
  });

  late final String userFeelingId;
  late final String feelingId;
  late final String feelingName;
  late final String submitTime;

  FeelingList.fromJson(Map<String, dynamic> json) {
    userFeelingId = json['user_feeling_id'];
    feelingId = json['feeling_id'];
    feelingName = json['feeling_name'];
    submitTime = json['submit_time'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user_feeling_id'] = userFeelingId;
    _data['feeling_id'] = feelingId;
    _data['feeling_name'] = feelingName;
    _data['submit_time'] = submitTime;
    return _data;
  }
}

class VideoArr {
  VideoArr({
    required this.title,
    required this.description,
    required this.youtubeUrl,
  });

  late final String title;
  late final String description;
  late final String youtubeUrl;

  VideoArr.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    youtubeUrl = json['youtube_url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['description'] = description;
    _data['youtube_url'] = youtubeUrl;
    return _data;
  }
}

class FeelingDataModel {
  late final String feelingName, iconUrl;
  late final String? feelingPercentage;

  FeelingDataModel({
    required this.feelingName,
    required this.feelingPercentage,
    required this.iconUrl,
  });
}
