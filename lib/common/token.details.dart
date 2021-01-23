import 'package:jwt_decode/jwt_decode.dart';

class TokenDetails {
  String _token;
  String _firstName;
  String _email;
  String _expiryDate;
  bool _isExpired;

  TokenDetails(this._token);

  String firstName() => _firstName = Jwt.parseJwt(_token)['firstName'];

  String email() => _email = Jwt.parseJwt(_token)['email'];

  // Print one of its property(example: email):
  //print(payload['email']);

//   To get expiry date
  String expiryDate() => _expiryDate = Jwt.getExpiryDate(_token).toString();

  // To check if token is expired
  bool isExpired() => _isExpired = Jwt.isExpired(_token);
}
