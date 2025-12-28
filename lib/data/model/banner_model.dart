// To parse this JSON data, do
//
//     final bannerModel = bannerModelFromJson(jsonString);

import 'dart:convert';

BannerModel bannerModelFromJson(String str) =>
    BannerModel.fromJson(json.decode(str));

String bannerModelToJson(BannerModel data) => json.encode(data.toJson());

class BannerModel {
  bool status;
  List<Banner> banner;

  BannerModel({
    required this.status,
    required this.banner,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        status: json["status"],
        banner:
            List<Banner>.from(json["banner"].map((x) => Banner.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "banner": List<dynamic>.from(banner.map((x) => x.toJson())),
      };
}

class Banner {
  int id;
  String image;
  final String? link;

  Banner({
    required this.id,
    required this.image,
    this.link,
  });

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
      id: json["id"],
      image: json["banner_image_url"],
      link: json["link"] ?? "");

  Map<String, dynamic> toJson() => {
        "id": id,
        "banner_image_url": image,
        "link": link,
      };
}
