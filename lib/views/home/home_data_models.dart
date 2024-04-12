import 'dart:convert';

CompetitionDataClass competitionDataClassFromJson(String str) =>
    CompetitionDataClass.fromJson(json.decode(str));

String competitionDataClassToJson(CompetitionDataClass data) =>
    json.encode(data.toJson());

class CompetitionDataClass {
  CompetitionDataClass({
    String? name,
    List<Schedule>? schedule,
  }) {
    _name = name;
    _schedule = schedule;
  }

  CompetitionDataClass.fromJson(dynamic json) {
    _name = json['name'];
    _schedule = (json['schedule'] as List<dynamic>?)
        ?.map((item) => Schedule.fromJson(item))
        .toList();
  }

  String? _name;
  List<Schedule>? _schedule;

  CompetitionDataClass copyWith({
    String? name,
    List<Schedule>? schedule,
  }) =>
      CompetitionDataClass(
        name: name ?? _name,
        schedule: schedule ?? _schedule,
      );

  String? get name => _name;

  List<Schedule>? get schedule => _schedule;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    if (_schedule != null) {
      map['schedule'] = _schedule?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  @override
  String toString() {
    return 'CompetitionDataClass{name: $_name, schedule: $_schedule}';
  }
}

Schedule scheduleFromJson(String str) => Schedule.fromJson(json.decode(str));
String scheduleToJson(Schedule data) => json.encode(data.toJson());

class Schedule {
  Schedule({
    String? date,
    List<Matches>? matches,
  }) {
    _date = date;
    _matches = matches;


  }

  Schedule.fromJson(dynamic json) {
    _date = json['date'];
    _matches = (json['matches'] as List<dynamic>?)
        ?.map((item) => Matches.fromJson(item))
        .toList();
  }

  String? _date;
  List<Matches>? _matches;

  Schedule copyWith({
    String? date,
    List<Matches>? matches,
  }) =>
      Schedule(
        date: date ?? _date,
        matches: matches ?? _matches,
      );

  String? get date => _date;

  List<Matches>? get matches => _matches;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = _date;
    if (_matches != null) {
      map['matches'] = _matches?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  @override
  String toString() {
    return 'CompetitionDataClass{date: $_date, matches: $_matches}';
  }
}

Matches matchesFromJson(String str) => Matches.fromJson(json.decode(str));

String matchesToJson(Matches data) => json.encode(data.toJson());

class Matches {
  Matches({
    String? homeTeam,
    String? awayTeam,
    num? homeTeamStrengthIndicator,
    num? awayTeamStrengthIndicator,
    String? predictedResult,
    num? actualWin,
  }) {
    _homeTeam = homeTeam;
    _awayTeam = awayTeam;
    _homeTeamStrengthIndicator = homeTeamStrengthIndicator;
    _awayTeamStrengthIndicator = awayTeamStrengthIndicator;
    _predictedResult = predictedResult;
    _actualWin = actualWin;
  }

  Matches.fromJson(dynamic json) {
    _homeTeam = json['homeTeam'];
    _awayTeam = json['awayTeam'];
    _homeTeamStrengthIndicator = json['homeTeamStrengthIndicator'];
    _awayTeamStrengthIndicator = json['awayTeamStrengthIndicator'];
    _predictedResult = json['predictedResult'];
    _actualWin = json['actualWin'];
  }

  String? _homeTeam;
  String? _awayTeam;
  num? _homeTeamStrengthIndicator;
  num? _awayTeamStrengthIndicator;
  String? _predictedResult;
  num? _actualWin;

  Matches copyWith({
    String? homeTeam,
    String? awayTeam,
    num? homeTeamStrengthIndicator,
    num? awayTeamStrengthIndicator,
    String? predictedResult,
    num? actualWin,
  }) =>
      Matches(
        homeTeam: homeTeam ?? _homeTeam,
        awayTeam: awayTeam ?? _awayTeam,
        homeTeamStrengthIndicator:
            homeTeamStrengthIndicator ?? _homeTeamStrengthIndicator,
        awayTeamStrengthIndicator:
            awayTeamStrengthIndicator ?? _awayTeamStrengthIndicator,
        predictedResult: predictedResult ?? _predictedResult,
        actualWin: actualWin ?? _actualWin,
      );

  String? get homeTeam => _homeTeam;

  String? get awayTeam => _awayTeam;

  num? get homeTeamStrengthIndicator => _homeTeamStrengthIndicator;

  num? get awayTeamStrengthIndicator => _awayTeamStrengthIndicator;

  String? get predictedResult => _predictedResult;

  num? get actualWin => _actualWin;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['homeTeam'] = _homeTeam;
    map['awayTeam'] = _awayTeam;
    map['homeTeamStrengthIndicator'] = _homeTeamStrengthIndicator;
    map['awayTeamStrengthIndicator'] = _awayTeamStrengthIndicator;
    map['predictedResult'] = _predictedResult;
    map['actualWin'] = _actualWin;
    return map;
  }

  @override
  String toString() {
    return 'Matches{homeTeam: $_homeTeam, awayTeam: $_awayTeam, homeTeamStrengthIndicator: $_homeTeamStrengthIndicator, awayTeamStrengthIndicator: $_awayTeamStrengthIndicator, predictedResult: $_predictedResult, actualWin: $_actualWin}';
  }
}
