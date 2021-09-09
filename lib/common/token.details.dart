import 'package:jwt_decode/jwt_decode.dart';

class TokenDetails {
  String _token;

  TokenDetails(this._token);

  int associatedId() => Jwt.parseJwt(_token)['id'];

//   To get expiry date
  String expiryDate() => Jwt.getExpiryDate(_token).toString();

  // To check if token is expired
  bool isExpired() => Jwt.isExpired(_token);
}
