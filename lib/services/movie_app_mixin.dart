import 'package:tmdb_api/tmdb_api.dart';

mixin MoviePageMixin {
  List trendingNow = [];
  final String apiKey = 'af63d81073ce3bfd8e3775ea82b0fb86';
  final String readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhZjYzZDgxMDczY2UzYmZkOGUzNzc1ZWE4MmIwZmI4NiIsInN1YiI6IjYyMzliNDUwZTI3MjYwMDA3MWRjMzIyYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.xIJjUSBuKCUHq9qT5h5stYIarHlEJiD206lzogeoJcw';

  loadMovies() async {
    //TMDB instance
    final tmdbWithCustomLogs = TMDB(
      ApiKeys(apiKey, readAccessToken),
      logConfig: const ConfigLogger(
        showLogs: true, //must be true than only all other logs will be shown
        showErrorLogs: true,
      ),
    );
    Map result = await tmdbWithCustomLogs.v3.trending
        .getTrending(mediaType: MediaType.all, timeWindow: TimeWindow.day);
    //ApiKeys instance with your keys,
    print('$result\n\n');
    Map result1 = await tmdbWithCustomLogs.v3.movies.getUpcoming();
    // .getTrending(mediaType: MediaType.all, timeWindow: TimeWindow.day);
    //ApiKeys instance with your keys,
    print(result1);
  }
}
