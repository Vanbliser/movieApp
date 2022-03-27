// List<Map<String, dynamic>> myMap = [
//   {
//     'adult': false,
//     'backdrop_path': "/tq3klWQevRK0Or0cGhsw0h3FDWQ.jpg",
//     'genre_ids': [12, 16, 35, 10751, 14],
//     'id': 676705,
//     'original_language': "fr",
//     'original_title': "Pil's Adventures",
//     'overview':
//         "Pil, a little vagabond girl, lives on the streets of the medieval city of Roc-en-Brume, along with her three tame weasels. She survives of food stolen from the castle of the sinister Regent Tristain. One day, to escape his guards, Pil disguises herself as a princess. Thus she embarks upon a mad, delirious adventure, together with Crobar, a big clumsy guard who thinks she's a noble, and Rigolin, a young crackpot jester. Pil is going to have to save Roland, rightful heir to the throne under the curse of a spell. This adventure will turn the entire kingdom upside down, and teach Pil that nobility can be found in all of us.",
//     'popularity': 2426.316,
//     'poster_path': "/xy6wQ09rMIN2FfWPHJXCWyRZ3P9.jpg",
//     'release_date': "2021-08-11",
//     'title': "Pil's Adventures",
//     'video': false,
//     'vote_average': 7.4,
//     'vote_count': 24
//   },
//   {
//     'adult': false,
//     'backdrop_path': "/fEe5fe82qHzjO4yej0o79etqsWV.jpg",
//     'genre_ids': [16, 35, 28, 10751, 80],
//     'id': 629542,
//     'original_language': "en",
//     'original_title': "The Bad Guys",
//     'overview':
//         "When the infamous Bad Guys are finally caught after years of countless heists and being the world’s most-wanted villains, Mr. Wolf brokers a deal to save them all from prison.",
//     'popularity': 1034.323,
//     'poster_path': "/1s0em1CVrM1e6fsafiNePXqh6Hv.jpg",
//     'release_date': "2022-03-17",
//     'title': "The Bad Guys",
//     'video': false,
//     'vote_average': 8.2,
//     'vote_count': 17
//   },
//   {
//     'adult': false,
//     'backdrop_path': "/lrP1TQf3stZveNEyviUUcSh8HLA.jpg",
//     'genre_ids': [28, 878, 35, 10751],
//     'id': 675353,
//     'original_language': "en",
//     'original_title': "Sonic the Hedgehog 2",
//     'overview':
//         "After settling in Green Hills, Sonic is eager to prove he has what it takes to be a true hero. His test comes when Dr. Robotnik returns, this time with a new partner, Knuckles, in search for an emerald that has the power to destroy civilizations. Sonic teams up with his own sidekick, Tails, and together they embark on a globe-trotting journey to find the emerald before it falls into the wrong hands.",
//     'popularity': 825.337,
//     'poster_path': "/1j6JtMRAhdO3RaXRtiWdPL5D3SW.jpg",
//     'releade_date': "2022-03-30",
//     'title': "Sonic the Hedgehog 2",
//     'video': false,
//     'vote_average': 0,
//     'vote_count': 0
//   }
// ];
// void main(List<String> args) {
//   print(cleanUpList(myMap));
// }

class Movie {
  String? title, description, posterPath, banner;
  String? rated;
  int? id;
  double? avgRating;

  Movie.fromMap(Map<String, dynamic> movie)
      : id = movie['id'],
        title = movie['title'],
        description = movie['overview'],
        posterPath = movie['posterPath'],
        banner = movie['banner'],
        rated = movie['rated'],
        avgRating = movie['avgRating'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'posterPath': posterPath,
      'banner': banner,
      'rated': rated,
      'avgRating': avgRating
    };
  }

  Map<String, dynamic> get movieToMap {
    return toMap();
  }
}

class TrendingMovies {
  List<Map<String, dynamic>> trendingMovieslist = [];
  TrendingMovies.fromMap(Map<String, dynamic> result)
      : trendingMovieslist = cleanUpList(result['results']);

  List<Map<String, dynamic>> get list {
    return trendingMovieslist;
  }
}

class UpComingMovies {
  List<Map<String, dynamic>> upcomingMovieslist = [];
  UpComingMovies.fromMap(Map<String, dynamic> result)
      : upcomingMovieslist = cleanUpList(result['results']);

  List<Map<String, dynamic>> get list {
    return upcomingMovieslist;
  }
}

List<Map<String, dynamic>> cleanUpList(List unclean) {
  List<Map<String, dynamic>> clean = [];
  for (var i = 0; i < unclean.length - 1; i++) {
    Map<String, dynamic> initMap = {
      'id': unclean[i]['id'],
      'title': getTitle(unclean[i]),
      'description': unclean[i]['overview'],
      'posterPath': unclean[i]['poster_path'],
      'banner': unclean[i]['backdrop_path'],
      'rated': getRated(unclean[i]['adult']),
      'avgRating': unclean[i]['vote_average']
    };
    if ((initMap['id'] != null) &&
        (initMap['title'] != null) &&
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
