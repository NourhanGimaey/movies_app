class AuthApiEndpoint {
  static const String baseUrl = "https://route-movie-apis.vercel.app/";
  static const String registerApi = "auth/register";
  static const String loginApi = "auth/login";
  static const String resetPasswordApi = "auth/reset-password";
}

class MoviesApiEndpoint {
  static const String baseUrl = "https://yts.lt/api/";
  static const String listMoviesApi = "v2/list_movies.json";
  static const String movieDetailsApi = "v2/movie_details.json";
  static const String movieSuggestionApi = "v2/movie_suggestions.json";
}
