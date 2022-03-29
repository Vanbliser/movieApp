class Movie {
  String? title, description, posterPath, banner;
  String? rated;
  int? id;
  String? avgRating;

  Movie();

  Movie.fromMap(Map<String, dynamic> movie)
      : id = movie['id'],
        title = movie['title'],
        description = movie['description'],
        posterPath = movie['posterPath'],
        banner = movie['banner'],
        rated = movie['rated'],
        avgRating = movie['avgRating'];

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'posterPath': posterPath,
      'banner': banner,
      'rated': rated,
      'avgRating': avgRating
    };
  }
}

class TrendingMovies extends Movie {
  List<Map<String, dynamic>> trendingMovieslist = [];
  List<Movie> trendingMoviesMovie = [];
  String? error;
  TrendingMovies.fromJSON(Map<String, dynamic> result)
      : trendingMovieslist = cleanUpListMap(result['results']),
        trendingMoviesMovie = cleanUpListMovie(result['results']);

  void errorMsg(Object message) {
    error = message.toString();
  }

  List<Map<String, dynamic>> get list {
    return trendingMovieslist;
  }

  List<Movie> get movielist {
    return trendingMoviesMovie;
  }

  int get length {
    return trendingMoviesMovie.length;
  }
}

class UpComingMovies extends Movie {
  List<Map<String, dynamic>> upcomingMovieslist = [];
  List<Movie> upcomingMoviesMovie;
  String? error;
  UpComingMovies.fromJSON(Map<String, dynamic> result)
      : upcomingMovieslist = cleanUpListMap(result['results']),
        upcomingMoviesMovie = cleanUpListMovie(result['results']);

  void errorMsg(Object message) {
    error = message.toString();
  }

  List<Map<String, dynamic>> get list {
    return upcomingMovieslist;
  }

  List<Movie> get movielist {
    return upcomingMoviesMovie;
  }

  int get length {
    return upcomingMoviesMovie.length;
  }
}

Movie mapToMovie(Map<String, dynamic> map) {
  return Movie.fromMap(map);
}

List<Map<String, dynamic>> cleanUpListMap(List unclean) {
  List<Map<String, dynamic>> clean = [];
  for (var i = 0; i < unclean.length; i++) {
    Map<String, dynamic> initMap = {
      'title': getTitle(unclean[i]),
      'description': unclean[i]['overview'],
      'posterPath': unclean[i]['poster_path'],
      'banner': unclean[i]['backdrop_path'],
      'rated': getRated(unclean[i]['adult']),
      'avgRating': unclean[i]['vote_average'].toString()
    };
    if ((initMap['title'] != null) &&
        (initMap['description'] != null) &&
        (initMap['posterPath'] != null) &&
        (initMap['banner'] != null) &&
        (initMap['rated'] != null) &&
        (initMap['avgRating'] != null)) {
      clean.add(initMap);
    }
  }
  return clean;
}

List<Movie> cleanUpListMovie(List unclean) {
  List<Movie> cleanUpMovie = [];
  for (var i = 0; i < unclean.length - 1; i++) {
    Map<String, dynamic> initMap = {
      'title': getTitle(unclean[i]),
      'description': unclean[i]['overview'],
      'posterPath': unclean[i]['poster_path'],
      'banner': unclean[i]['backdrop_path'],
      'rated': getRated(unclean[i]['adult']),
      'avgRating': unclean[i]['vote_average'].toString()
    };
    if ((initMap['title'] != null) &&
        (initMap['description'] != null) &&
        (initMap['posterPath'] != null) &&
        (initMap['banner'] != null) &&
        (initMap['rated'] != null) &&
        (initMap['avgRating'] != null)) {
      cleanUpMovie.add(mapToMovie(initMap));
    }
  }
  return cleanUpMovie;
}

String? getTitle(Map<String, dynamic> result) {
  if (result['title'] != null) {
    return result['title'];
  } else if (result['name'] != null) {
    return result['name'];
  } else if (result['original_title'] != null) {
    return result['original_title'];
  } else if (result['original_name'] != null) {
    return result['original_name'];
  } else {
    return null;
  }
}

String getRated(bool? result) {
  if (result == true) {
    return '18 +';
  } else {
    return '13 +';
  }
}
