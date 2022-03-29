import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_test/models/movies.dart';

mixin MoviePageMixin {
  final Uri trendingNowUri = Uri.parse(
      'https://api.themoviedb.org/3/trending/all/day?api_key=af63d81073ce3bfd8e3775ea82b0fb86');

  final Uri upComingUri = Uri.parse(
      'https://api.themoviedb.org/3/movie/upcoming?api_key=af63d81073ce3bfd8e3775ea82b0fb86&language=en-US&page=1');

  Future<UpComingMovies> loadUpComing() async {
    try {
      http.Response response = await http.get(upComingUri);
      if (response.statusCode == 200) {
        //print('\n\n\nUPCOMING MOVIES\n ${response.body}');
        return UpComingMovies.fromJSON(json.decode(response.body));
      } else {
        return UpComingMovies.fromJSON(
          {
            'results': [
              {'original_title': "Network Error!!!"}
            ]
          },
        );
      }
    } catch (e) {
      return UpComingMovies.fromJSON(
        {
          'results': [
            {'original_title': "Network Error!!!"}
          ]
        },
      );
    }
  }

  Future<TrendingMovies> loadTrending() async {
    try {
      http.Response response = await http.get(trendingNowUri);
      if (response.statusCode == 200) {
        //print('\n\n\nTRENDING MOVIES\n ${response.body}');
        return TrendingMovies.fromJSON(json.decode(response.body));
      } else {
        return TrendingMovies.fromJSON(
          {
            'results': [
              {'original_title': "Network Error!!!"}
            ]
          },
        );
      }
    } catch (e) {
      return TrendingMovies.fromJSON(
        {
          'results': [
            {'original_title': "Network Error!!!"}
          ]
        },
      );
    }
  }
}
