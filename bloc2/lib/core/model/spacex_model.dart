class SpaceXModelLinksPatch {

  String? small;
  String? large;

  SpaceXModelLinksPatch({
    this.small,
    this.large,
  });
  SpaceXModelLinksPatch.fromJson(dynamic json) {
    small = json['small']?.toString();
    large = json['large']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['small'] = small;
    data['large'] = large;
    return data;
  }
}

class SpaceXModelLinks {


  SpaceXModelLinksPatch? patch;
  String? presskit;
  String? webcast;
  String? youtubeId;
  String? article;
  String? wikipedia;

  SpaceXModelLinks({
    this.patch,
    this.presskit,
    this.webcast,
    this.youtubeId,
    this.article,
    this.wikipedia,
  });
  SpaceXModelLinks.fromJson(dynamic json) {
    patch = (json['patch'] != null)
        ? SpaceXModelLinksPatch.fromJson(json['patch'])
        : null;
    presskit = json['presskit']?.toString();
    webcast = json['webcast']?.toString();
    youtubeId = json['youtube_id']?.toString();
    article = json['article']?.toString();
    wikipedia = json['wikipedia']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (patch != null) {
      data['patch'] = patch!.toJson();
    }

    data['presskit'] = presskit;
    data['webcast'] = webcast;
    data['youtube_id'] = youtubeId;
    data['article'] = article;
    data['wikipedia'] = wikipedia;
    return data;
  }
}

class SpaceXModel {

  SpaceXModelLinks? links;
  String? staticFireDateUtc;
  int? staticFireDateUnix;
  bool? net;
  int? window;
  String? rocket;
  bool? success;
  String? details;
  List<String?>? payloads;
  String? launchpad;
  int? flightNumber;
  String? name;
  String? dateUtc;
  int? dateUnix;
  String? dateLocal;
  String? datePrecision;
  bool? upcoming;
  bool? autoUpdate;
  bool? tbd;
  String? launchLibraryId;
  String? id;

  SpaceXModel({
    this.links,
    this.staticFireDateUtc,
    this.staticFireDateUnix,
    this.net,
    this.window,
    this.rocket,
    this.success,
    this.details,
    this.payloads,
    this.launchpad,
    this.flightNumber,
    this.name,
    this.dateUtc,
    this.dateUnix,
    this.dateLocal,
    this.datePrecision,
    this.upcoming,
    this.autoUpdate,
    this.tbd,
    this.launchLibraryId,
    this.id,
  });
  SpaceXModel.fromJson(dynamic json) {
    links = (json['links'] != null)
        ? SpaceXModelLinks.fromJson(json['links'])
        : null;
    staticFireDateUtc = json['static_fire_date_utc']?.toString();
    staticFireDateUnix = json['static_fire_date_unix']?.toInt();
    net = json['net'];
    window = json['window']?.toInt();
    rocket = json['rocket']?.toString();
    success = json['success'];
    details = json['details']?.toString();

    if (json['payloads'] != null) {
      final v = json['payloads'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      payloads = arr0;
    }
    launchpad = json['launchpad']?.toString();
    flightNumber = json['flight_number']?.toInt();
    name = json['name']?.toString();
    dateUtc = json['date_utc']?.toString();
    dateUnix = json['date_unix']?.toInt();
    dateLocal = json['date_local']?.toString();
    datePrecision = json['date_precision']?.toString();
    upcoming = json['upcoming'];

    autoUpdate = json['auto_update'];
    tbd = json['tbd'];
    launchLibraryId = json['launch_library_id']?.toString();
    id = json['id']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    if (links != null) {
      data['links'] = links!.toJson();
    }
    data['static_fire_date_utc'] = staticFireDateUtc;
    data['static_fire_date_unix'] = staticFireDateUnix;
    data['net'] = net;
    data['window'] = window;
    data['rocket'] = rocket;
    data['success'] = success;

    data['details'] = details;

    if (payloads != null) {
      final v = payloads;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['payloads'] = arr0;
    }
    data['launchpad'] = launchpad;
    data['flight_number'] = flightNumber;
    data['name'] = name;
    data['date_utc'] = dateUtc;
    data['date_unix'] = dateUnix;
    data['date_local'] = dateLocal;
    data['date_precision'] = datePrecision;
    data['upcoming'] = upcoming;
    data['auto_update'] = autoUpdate;
    data['tbd'] = tbd;
    data['launch_library_id'] = launchLibraryId;
    data['id'] = id;
    return data;
  }
}
class SpaceException implements Exception{
  final String error;

  SpaceException({required this.error});

}