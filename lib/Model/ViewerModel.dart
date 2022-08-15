import 'dart:convert';

ViewerModel viewerModelJson(String str) =>
    ViewerModel.fromJson(json.decode(str));

String viewerModelToJson(ViewerModel data) => json.encode(data.toJson());

class ViewerModel{

  int vIdx;
  String vId;
  String vPw;

  ViewerModel({required this.vIdx,required this.vId,required this.vPw});

  factory ViewerModel.fromJson(Map<String,dynamic> json)=> ViewerModel(
    vIdx: json["vidx"],
    vId: json["vid"],
    vPw: json["vpw"]
  );

  Map<String,dynamic> toJson() =>{
    "vidx":vIdx,
    "vid":vId,
    "vpw":vPw,
  };

  String get vid => vId;
  String get vpw => vPw;


}