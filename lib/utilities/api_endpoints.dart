class ApiEndpoints {
  ApiEndpoints._();

  static String token = '';

  static var headers = {
    'x-api-key': 'XYSVDVSVSDCX2VD5533VPPTIOIOPQWDEMNI8876110Z',
    'Content-Type': 'application/json',
    'Authorization': token,
  };

  dynamic get header => {
        'Authorization':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjE2IiwibmJmIjoxNzE5MTc1MTY0LCJleHAiOjE3MTkyNjE1NjQsImlhdCI6MTcxOTE3NTE2NH0.lzmDQ609P-6smqLz5d4d4awE74MGS1ISx8qFLhs4YOo',
        'x-api-key': 'XYSVDVSVSDCX2VD5533VPPTIOIOPQWDEMNI8876110Z',
        'Content-Type': 'application/json'
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
