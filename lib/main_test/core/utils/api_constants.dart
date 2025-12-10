class ApiConstants {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  static const String postsEndpoint = '/posts';

  static String get postsUrl => '$baseUrl$postsEndpoint';
}
