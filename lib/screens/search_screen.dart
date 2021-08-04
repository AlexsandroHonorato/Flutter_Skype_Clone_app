import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skype_clone/models/user_model.dart';
import 'package:skype_clone/resources/firebase_repository.dart';
import 'package:skype_clone/widgets/gradiend_appbar.dart';
import 'package:skype_clone/utils/universal_variables.dart';
import 'package:skype_clone/widgets/custom_title.dart';

import 'chatscreens/chat_screens.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  FirebaseRepository _repository = FirebaseRepository();

  List<UserModel> userList;
  String query = "";
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _repository.getCurrentUser().then((User user) {
      _repository.fetchAllUsers(user).then((List<UserModel> list) {
        setState(() {
          userList = list;
        });
      });
    });
  }

  buildSuggestions(String query) {
    final List<UserModel> suggestionList = query.isEmpty
        ? []
        : userList.where((UserModel user) {
            String _getUsername = user.username.toLowerCase();
            String _query = query.toLowerCase();
            String _getName = user.name.toLowerCase();
            bool matchesUsername = _getUsername.contains(_query);
            bool matchesName = _getName.contains(_query);

            return (matchesUsername || matchesName);
          }).toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: ((context, index) {
        UserModel searchedUser = UserModel(
            uid: suggestionList[index].uid,
            profilePhoto: suggestionList[index].profilePhoto,
            name: suggestionList[index].name,
            username: suggestionList[index].username);

        return CustomTile(
          mini: false,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChatScreen(receiver: searchedUser)));
          },
          leading: CircleAvatar(
            backgroundImage: NetworkImage(searchedUser.profilePhoto),
            backgroundColor: Colors.grey,
          ),
          title: Text(
            searchedUser.username,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            searchedUser.name,
            style: TextStyle(color: UniversalVariables.greyColor),
          ),
        );
      }),
    );
  }

  searchAppBar(BuildContext context) {
    return CustomScrollView(slivers: <Widget>[]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UniversalVariables.blackColor,
      appBar: GradiendAppBar(
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () => Navigator.pop(context)),
        ),
        bottom: TextField(
          controller: searchController,
          onChanged: (val) {
            setState(() {
              query = val;
            });
          },
          cursorColor: UniversalVariables.blackColor,
          autofocus: true,
          style: Theme.of(context).textTheme.subtitle2.copyWith(
              color: Colors.white.withOpacity(0.8),
              fontWeight: FontWeight.bold,
              fontSize: 35),
          decoration: InputDecoration(
              suffixIcon: InkWell(
                child: Icon(
                  Icons.clear,
                  color: Colors.white,
                ),
                onTap: () {
                  searchController.clear();
                  setState(() {
                    query = "";
                  });
                },
              ),
              border: InputBorder.none,
              hintText: 'Pesquisar...',
              hintStyle: Theme.of(context).textTheme.subtitle1.copyWith(
                  color: Color(0x88ffffff).withOpacity(0.8),
                  fontWeight: FontWeight.bold,
                  fontSize: 35)),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: buildSuggestions(query),
      ),
    );
  }
}
