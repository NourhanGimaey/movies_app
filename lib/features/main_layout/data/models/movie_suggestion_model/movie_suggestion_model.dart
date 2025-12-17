import 'package:json_annotation/json_annotation.dart';

part 'movie_suggestion_model.g.dart';

@JsonSerializable()
class MovieSuggestionModel {
  @JsonKey(name: 'status')
  final String status;
  @JsonKey(name: 'status_message')
  final String statusMessage;
  @JsonKey(name: 'data')
  final Data data;
  @JsonKey(name: '@meta')
  final Meta meta;

  MovieSuggestionModel({
    required this.status,
    required this.statusMessage,
    required this.data,
    required this.meta,
  });

  factory MovieSuggestionModel.fromJson(Map<String, dynamic> json) => _$MovieSuggestionModelFromJson(json);
  Map<String, dynamic> toJson() => _$MovieSuggestionModelToJson(this);
}

@JsonSerializable()
class Meta {
  @JsonKey(name: 'server_time')
  final int serverTime;
  @JsonKey(name: 'server_timezone')
  final String serverTimezone;
  @JsonKey(name: 'api_version')
  final int apiVersion;
  @JsonKey(name: 'execution_time')
  final String executionTime;

  Meta({
    required this.serverTime,
    required this.serverTimezone,
    required this.apiVersion,
    required this.executionTime,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
  Map<String, dynamic> toJson() => _$MetaToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: 'movie_count')
  final int movieCount;
  @JsonKey(name: 'movies')
  final List<Movies> movies;

  Data({
    required this.movieCount,
    required this.movies,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Movies {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'url')
  final String url;
  @JsonKey(name: 'imdb_code')
  final String imdbCode;
  @JsonKey(name: 'title')
  final dynamic title;
  @JsonKey(name: 'title_english')
  final dynamic titleEnglish;
  @JsonKey(name: 'title_long')
  final String titleLong;
  @JsonKey(name: 'slug')
  final dynamic slug;
  @JsonKey(name: 'year')
  final int year;
  @JsonKey(name: 'rating')
  final int rating;
  @JsonKey(name: 'runtime')
  final int runtime;
  @JsonKey(name: 'genres')
  final List<String> genres;
  @JsonKey(name: 'summary')
  final dynamic summary;
  @JsonKey(name: 'description_full')
  final dynamic descriptionFull;
  @JsonKey(name: 'synopsis')
  final dynamic synopsis;
  @JsonKey(name: 'yt_trailer_code')
  final dynamic ytTrailerCode;
  @JsonKey(name: 'language')
  final dynamic language;
  @JsonKey(name: 'mpa_rating')
  final dynamic mpaRating;
  @JsonKey(name: 'state')
  final String state;

  Movies({
    required this.id,
    required this.url,
    required this.imdbCode,
    required this.title,
    required this.titleEnglish,
    required this.titleLong,
    required this.slug,
    required this.year,
    required this.rating,
    required this.runtime,
    required this.genres,
    required this.summary,
    required this.descriptionFull,
    required this.synopsis,
    required this.ytTrailerCode,
    required this.language,
    required this.mpaRating,
    required this.state,
  });

  factory Movies.fromJson(Map<String, dynamic> json) => _$MoviesFromJson(json);
  Map<String, dynamic> toJson() => _$MoviesToJson(this);
}