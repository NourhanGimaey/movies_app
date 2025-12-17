// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_suggestion_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieSuggestionModel _$MovieSuggestionModelFromJson(
        Map<String, dynamic> json) =>
    MovieSuggestionModel(
      status: json['status'] as String,
      statusMessage: json['status_message'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
      meta: Meta.fromJson(json['@meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovieSuggestionModelToJson(
        MovieSuggestionModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'status_message': instance.statusMessage,
      'data': instance.data,
      '@meta': instance.meta,
    };

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      serverTime: (json['server_time'] as num).toInt(),
      serverTimezone: json['server_timezone'] as String,
      apiVersion: (json['api_version'] as num).toInt(),
      executionTime: json['execution_time'] as String,
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'server_time': instance.serverTime,
      'server_timezone': instance.serverTimezone,
      'api_version': instance.apiVersion,
      'execution_time': instance.executionTime,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      movieCount: (json['movie_count'] as num).toInt(),
      movies: (json['movies'] as List<dynamic>)
          .map((e) => Movies.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'movie_count': instance.movieCount,
      'movies': instance.movies,
    };

Movies _$MoviesFromJson(Map<String, dynamic> json) => Movies(
      id: (json['id'] as num).toInt(),
      url: json['url'] as String,
      imdbCode: json['imdb_code'] as String,
      title: json['title'],
      titleEnglish: json['title_english'],
      titleLong: json['title_long'] as String,
      slug: json['slug'],
      year: (json['year'] as num).toInt(),
      rating: (json['rating'] as num).toInt(),
      runtime: (json['runtime'] as num).toInt(),
      genres:
          (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
      summary: json['summary'],
      descriptionFull: json['description_full'],
      synopsis: json['synopsis'],
      ytTrailerCode: json['yt_trailer_code'],
      language: json['language'],
      mpaRating: json['mpa_rating'],
      state: json['state'] as String,
    );

Map<String, dynamic> _$MoviesToJson(Movies instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'imdb_code': instance.imdbCode,
      'title': instance.title,
      'title_english': instance.titleEnglish,
      'title_long': instance.titleLong,
      'slug': instance.slug,
      'year': instance.year,
      'rating': instance.rating,
      'runtime': instance.runtime,
      'genres': instance.genres,
      'summary': instance.summary,
      'description_full': instance.descriptionFull,
      'synopsis': instance.synopsis,
      'yt_trailer_code': instance.ytTrailerCode,
      'language': instance.language,
      'mpa_rating': instance.mpaRating,
      'state': instance.state,
    };
