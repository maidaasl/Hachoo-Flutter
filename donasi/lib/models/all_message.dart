import 'dart:convert';

List<allMessage> allDonasiFromJson(String str) => List<allMessage>.from(json.decode(str).map((x) => allMessage.fromJson(x)));
String allMessageToJson(List<allMessage> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class allMessage {
  String model;
  int pk;
  Fields fields;

  allMessage({
    required this.model,
    required this.pk,
    required this.fields,
  });

  factory allMessage.fromJson(Map<String, dynamic> json) => allMessage(
    model: json["model"],
    pk: json["pk"],
    fields: Fields.fromJson(json["fields"]),
  );

  Map<String, dynamic> toJson() => {
    "model": model,
    "pk": pk,
    "fields": fields.toJson(),
  };

}

class Fields {

  String tittle;
  String message;

  Fields({
    required this.tittle,
    required this.message,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    tittle: json["tittle"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "tittle": tittle,
    "message": message,
  };
}