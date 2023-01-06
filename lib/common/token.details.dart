import 'package:jwt_decode/jwt_decode.dart';

class TokenDetails {
  String _token;

  TokenDetails(this._token);

  int associatedId() => Jwt.parseJwt(_token)['id'];

  String expiryDate() => Jwt.getExpiryDate(_token).toString();

  bool isExpired() => Jwt.isExpired(_token);
}
