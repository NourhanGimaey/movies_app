import 'package:json_annotation/json_annotation.dart';

part 'movie_details_model.g.dart';

@JsonSerializable()
class MovieDetailsModel {
  @JsonKey(name: 'status')
  final String status;
  @JsonKey(name: 'status_message')
  final String statusMessage;
  @JsonKey(name: 'data')
  final Data data;
  @JsonKey(name: '@meta')
  final Meta meta;

  MovieDetailsModel({
    required this.status,
    required this.statusMessage,
    required this.data,
    required this.meta,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) => _$MovieDetailsModelFromJson(json);
  Map<String, dynamic> toJson() => _$MovieDetailsModelToJson(this);
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
  @JsonKey(name: 'movie')
  final Movie movie;

  Data({
    required this.movie,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Movie {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'url')
  final String url;
  @JsonKey(name: 'imdb_code')
  final String imdbCode;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'title_english')
  final String titleEnglish;
  @JsonKey(name: 'title_long')
  final String titleLong;
  @JsonKey(name: 'slug')
  final String slug;
  @JsonKey(name: 'year')
  final int year;
  @JsonKey(name: 'rating')
  final double rating;
  @JsonKey(name: 'runtime')
  final int runtime;
  @JsonKey(name: 'genres')
  final List<String> genres;
  @JsonKey(name: 'like_count')
  final int likeCount;
  @JsonKey(name: 'description_intro')
  final String descriptionIntro;
  @JsonKey(name: 'description_full')
  final String descriptionFull;
  @JsonKey(name: 'yt_trailer_code')
  final String ytTrailerCode;
  @JsonKey(name: 'language')
  final String language;
  @JsonKey(name: 'mpa_rating')
  final String mpaRating;
  @JsonKey(name: 'background_image')
  final String backgroundImage;
  @JsonKey(name: 'background_image_original')
  final String backgroundImageOriginal;
  @JsonKey(name: 'small_cover_image')
  final String smallCoverImage;
  @JsonKey(name: 'medium_cover_image')
  final String mediumCoverImage;
  @JsonKey(name: 'large_cover_image')
  final String largeCoverImage;
  @JsonKey(name: 'torrents')
  final List<Torrents> torrents;
  @JsonKey(name: 'date_uploaded')
  final String dateUploaded;
  @JsonKey(name: 'date_uploaded_unix')
  final int dateUploadedUnix;

  Movie({
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
    required this.likeCount,
    required this.descriptionIntro,
    required this.descriptionFull,
    required this.ytTrailerCode,
    required this.language,
    required this.mpaRating,
    required this.backgroundImage,
    required this.backgroundImageOriginal,
    required this.smallCoverImage,
    required this.mediumCoverImage,
    required this.largeCoverImage,
    required this.torrents,
    required this.dateUploaded,
    required this.dateUploadedUnix,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);
}

@JsonSerializable()
class Torrents {
  @JsonKey(name: 'url')
  final String url;
  @JsonKey(name: 'hash')
  final String hash;
  @JsonKey(name: 'quality')
  final String quality;
  @JsonKey(name: 'type')
  final String type;
  @JsonKey(name: 'is_repack')
  final String isRepack;
  @JsonKey(name: 'video_codec')
  final String videoCodec;
  @JsonKey(name: 'bit_depth')
  final String bitDepth;
  @JsonKey(name: 'audio_channels')
  final String audioChannels;
  @JsonKey(name: 'seeds')
  final int seeds;
  @JsonKey(name: 'peers')
  final int peers;
  @JsonKey(name: 'size')
  final String size;
  @JsonKey(name: 'size_bytes')
  final int sizeBytes;
  @JsonKey(name: 'date_uploaded')
  final String dateUploaded;
  @JsonKey(name: 'date_uploaded_unix')
  final int dateUploadedUnix;

  Torrents({
    required this.url,
    required this.hash,
    required this.quality,
    required this.type,
    required this.isRepack,
    required this.videoCodec,
    required this.bitDepth,
    required this.audioChannels,
    required this.seeds,
    required this.peers,
    required this.size,
    required this.sizeBytes,
    required this.dateUploaded,
    required this.dateUploadedUnix,
  });

  factory Torrents.fromJson(Map<String, dynamic> json) => _$TorrentsFromJson(json);
  Map<String, dynamic> toJson() => _$TorrentsToJson(this);
}