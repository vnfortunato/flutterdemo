import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutterdemo/screens/homepage.dart';
import 'package:flutterdemo/widgets/appbar.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:oauth2_client/oauth2_client.dart';
import 'package:oauth2_client/oauth2_helper.dart';
import 'package:oauth2_client/access_token_response.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late OAuth2Client client;
  late OAuth2Helper oauth2Helper;
  final storage = FlutterSecureStorage();

  String? accessToken;
  String message = "";
  late Map<String, dynamic> decodedToken;

  @override
  void initState() {

    storage.deleteAll();
    super.initState();

    client = OAuth2Client(
      authorizeUrl: "http://10.0.2.2:5267/connect/authorize",
      tokenUrl: "http://10.0.2.2:5267/connect/token",
      redirectUri: "my.test.app:/oauth2redirect",
      customUriScheme: "my.test.app",
    );

    oauth2Helper = OAuth2Helper(
      client,
      clientId: "flutter-client",
      scopes: ["openid", "profile", "email"],
      enablePKCE: true,
    );
      _login();
  }

  void _login() async {
    final alreadyLogged = await storage.read(key: "userName");

    if (alreadyLogged == null) {
      try {
        AccessTokenResponse? token = await oauth2Helper.getToken();
        if (token != null && token.accessToken != null) {
          setState(() async {
            accessToken = token.accessToken;
            decodedToken = JwtDecoder.decode(accessToken!);

            await storage.write(key: "userName", value: decodedToken["name"]);

            Navigator.push(
              context,
              MaterialPageRoute<void>(builder: (context) => MyApp()),
            );
          });
        }
      } catch (e) {
        await Future.delayed(Duration(seconds: 2));
        _login();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAAppBar(),
      body: Center(
      ),
    );
  }
}
