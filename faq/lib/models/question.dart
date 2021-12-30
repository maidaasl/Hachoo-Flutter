import 'package:faq/faq.dart';
import 'package:flutter/cupertino.dart';

class Question{
  String model;
  int pk;
  Fields? fields;

  Question({required this.model, required this.pk, required this.fields});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      model: json['model'],
      pk: json['pk'],
      fields : json['fields'] != null ? new Fields.fromJson(json['fields']) : null,
    );

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['model'] = this.model;
    data['pk'] = this.pk;
    if (this.fields != null) {
      data['fields'] = this.fields?.toJson();
    }
    return data;
  }
}

class Fields {
  String pertanyaan;
  String jawaban;
  bool status;

  Fields({required this.pertanyaan,required this.jawaban,required this.status});

  factory Fields.fromJson(Map<String, dynamic> json) {
    return Fields(
      pertanyaan: json['pertanyaan'],
      jawaban: json['jawaban'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pertanyaan'] = this.pertanyaan;
    data['jawaban'] = this.jawaban;
    data['status'] = this.status;
    return data;
  }
}
