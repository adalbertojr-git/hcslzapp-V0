import 'package:jwt_decoder/jwt_decoder.dart';

class TokenDetails {
  String _token;

  TokenDetails(this._token);

  int associatedId() {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(_token);
    return decodedToken['id'];
  }

  String expiryDate() => JwtDecoder.getExpirationDate(_token).toString();

  bool isExpired() => JwtDecoder.isExpired(_token);
}
