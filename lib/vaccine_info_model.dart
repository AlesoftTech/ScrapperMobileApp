// To parse this JSON data, do
//
//     final vaccineInfoModel = vaccineInfoModelFromMap(jsonString);

import 'dart:convert';

class VaccineInfoModel {
  VaccineInfoModel({
    this.id,
    this.name,
    this.viccinesInfo,
  });

  String id;
  String name;
  List<ViccinesInfo> viccinesInfo;

  factory VaccineInfoModel.fromJson(String str) => VaccineInfoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VaccineInfoModel.fromMap(Map<String, dynamic> json) => VaccineInfoModel(
    id: json["id"],
    name: json["name"],
    viccinesInfo: List<ViccinesInfo>.from(json["viccines_info"].map((x) => ViccinesInfo.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "viccines_info": List<dynamic>.from(viccinesInfo.map((x) => x.toMap())),
  };
}

class ViccinesInfo {
  ViccinesInfo({
    this.healthEntityFristDose,
    this.vaccineFirstDose,
    this.vaccineFirstDoseBatch,
    this.vaccineFirstDoseCountry,
    this.vaccineFirstDoseDate,
    this.healthEntitySecondDose,
    this.vaccineSecondDose,
    this.vaccineSecondDoseBatch,
    this.vaccineSecondDoseCountry,
  });

  String healthEntityFristDose;
  String vaccineFirstDose;
  String vaccineFirstDoseBatch;
  String vaccineFirstDoseCountry;
  DateTime vaccineFirstDoseDate;
  String healthEntitySecondDose;
  String vaccineSecondDose;
  String vaccineSecondDoseBatch;
  String vaccineSecondDoseCountry;

  factory ViccinesInfo.fromJson(String str) => ViccinesInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ViccinesInfo.fromMap(Map<String, dynamic> json) => ViccinesInfo(
    healthEntityFristDose: json["health_entity_frist_dose"] == null ? 'sin primera dosis' : json["health_entity_frist_dose"],
    vaccineFirstDose: json["vaccine_first_dose"] == null ? 'sin primera dosis' : json["vaccine_first_dose"],
    vaccineFirstDoseBatch: json["vaccine_first_dose_batch"] == null ? 'sin primera dosis' : json["vaccine_first_dose_batch"],
    vaccineFirstDoseCountry: json["vaccine_first_dose_country"] == null ? 'sin primera dosis' : json["vaccine_first_dose_country"],
    vaccineFirstDoseDate: DateTime.parse(json["vaccine_first_dose_date"]),
    healthEntitySecondDose: json["health_entity_second_dose"] == null ? 'sin segunda dosis' : json["health_entity_second_dose"],
    vaccineSecondDose: json["vaccine_second_dose"] == null ? 'sin segunda dosis' : json["vaccine_second_dose"],
    vaccineSecondDoseBatch: json["vaccine_second_dose_batch"] == null ? 'sin segunda dosis'  : json["vaccine_second_dose_batch"],
    vaccineSecondDoseCountry: json["vaccine_second_dose_country"] == null ? 'sin segunda dosis'  : json["vaccine_second_dose_country"],
  );

  Map<String, dynamic> toMap() => {
    "health_entity_frist_dose": healthEntityFristDose == null ? null : healthEntityFristDose,
    "vaccine_first_dose": vaccineFirstDose == null ? null : vaccineFirstDose,
    "vaccine_first_dose_batch": vaccineFirstDoseBatch == null ? null : vaccineFirstDoseBatch,
    "vaccine_first_dose_country": vaccineFirstDoseCountry == null ? null : vaccineFirstDoseCountry,
    "vaccine_first_dose_date": "${vaccineFirstDoseDate.year.toString().padLeft(4, '0')}-${vaccineFirstDoseDate.month.toString().padLeft(2, '0')}-${vaccineFirstDoseDate.day.toString().padLeft(2, '0')}",
    "health_entity_second_dose": healthEntitySecondDose == null ? null : healthEntitySecondDose,
    "vaccine_second_dose": vaccineSecondDose == null ? null : vaccineSecondDose,
    "vaccine_second_dose_batch": vaccineSecondDoseBatch == null ? null : vaccineSecondDoseBatch,
    "vaccine_second_dose_country": vaccineSecondDoseCountry == null ? null : vaccineSecondDoseCountry,
  };
}
