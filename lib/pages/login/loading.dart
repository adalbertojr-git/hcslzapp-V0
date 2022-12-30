import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:hcslzapp/http/http.exception.dart';
import '../../common/injection.dart';
import '../../common/messages.dart';
import '../../common/token.details.dart';
import '../../components/centered.message.dart';
import '../../components/degradee.background.dart';
import '../../controllers/login.controller.dart';
import '../dashboard/dashboard.page.dart';

class Loading extends StatefulWidget {
  final String user;
  final String psw;

  Loading(this.user, this.psw);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  final LoginController _controller = LoginController();
  final String _pathFlareActor = 'assets/anims/splash.flr';

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _callDashboard();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => DegradeBackground(
        FlareActor(
          _pathFlareActor,
          isPaused: false,
          animation: 'animation-hc',
        ),
      );

  _callDashboard() async {
    try {
      final value = await _controller.authenticate(
        widget.user,
        widget.psw,
      );
      debugPrint(value.token);
      loadTokenSingleton(value);
      TokenDetails _tokenDetails = TokenDetails(value.token);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => DashboardPage(
            _tokenDetails.associatedId(),
          ),
        ),
      );
    } on HttpException catch (e) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CenteredMessage(
            title: WARNING,
            message: e.message.toString(),
          ),
        ),
      );
    } catch (e) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CenteredMessage(
            title: ERROR,
            message: e.toString(),
          ),
        ),
      );
    }
  }
}
