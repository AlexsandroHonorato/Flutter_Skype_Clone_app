import 'package:flutter/material.dart';
import 'package:skype_clone/screens/home_screen.dart';
import 'package:skype_clone/screens/login_screen.dart';
import 'package:skype_clone/screens/pageviews/chat_list_screen.dart';
import 'package:skype_clone/screens/search_screen.dart';

class RouteGenerator {
  static const String ROUTER = "/";
  static const String ROUTER_HOME_SCREEN = "/home_screen";
  static const String ROUTER_LOGIN_SCREEN = "/login_screen";
  static const String ROUTER_CHAT_LIST_SCREEN = "/chat_list_screen";
  static const String ROUTER_SEARCH_SCREEN = "/search_screen";

  static Route<dynamic> generatorRouter(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case ROUTER:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case ROUTER_HOME_SCREEN:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case ROUTER_LOGIN_SCREEN:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case ROUTER_CHAT_LIST_SCREEN:
        return MaterialPageRoute(builder: (_) => ChatListScreen());

      case ROUTER_SEARCH_SCREEN:
        return MaterialPageRoute(builder: (_) => SearchScreen());

      default:
        _errorRota();
    }
  }

  static Route<dynamic> _errorRota() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Tela não encontrada"),
        ),
        body: Center(
          child: Text("Tela não encontrada"),
        ),
      );
    });
  }
}
