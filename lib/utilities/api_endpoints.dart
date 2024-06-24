class ApiEndpoints {
  ApiEndpoints._();

  static String token = '';

  static var headers = {
    'x-api-key': 'XYSVDVSVSDCX2VD5533VPPTIOIOPQWDEMNI8876110Z',
    'Content-Type': 'application/json',
    'Authorization': token,
  };

  static String baseUrl = 'http://khaledecho-005-site5.htempurl.com/v1/';

  static String login = '${baseUrl}users/login';

  static String signup = '${baseUrl}users';
  static String course = '${baseUrl}courses';
  static String recommendation =
      'https://id-department.onrender.com/department';

  static Map<String, String> getHeadersWithUserId(String userId) {
    return {
      ...headers,
      'StudentID': userId,
    };
  }
}
