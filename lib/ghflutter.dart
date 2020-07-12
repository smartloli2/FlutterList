import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'member.dart';
import 'strings.dart';

// Домашний виджет
class GHFlutter extends StatefulWidget {
  @override
  createState() => GHFlutterState();
}

// Состояние домашнего виджета
class GHFlutterState extends State<GHFlutter>
{
  // Тут будет лежать JSON массив Member-ов
  //var _members = [];
  var _members = <Member>[];

  // Ну большой шрифт
  final _biggerFont = const TextStyle(fontSize: 18.0);

  // Пишем запрос JSON массива
  _loadData() async
  {
    // Делаем запрос
    String dataURL = "https://api.github.com/orgs/raywenderlich/members";
    // Ждем ответа
    http.Response response = await http.get(dataURL);
    // Берем инфу из json'a
    setState(()
    {
      final membersJSON = json.decode(response.body);

      for (var memberJSON in membersJSON)
      {
        final member = Member(memberJSON["login"], memberJSON["avatar_url"]);
        _members.add(member);
      }
    });

    // Тоже самое но с массиво перебирающим методом map
    /*setState(()
    {
      _members = json.decode(response.body)
          .map<Member>
            (
              (memberJSON) =>
                Member(memberJSON["login"])
            ).toList();
    });*/
  }

  // Вызываем иницализацию состояния запросом выше
  @override
  void initState() {
    super.initState();

    _loadData();
  }

  // Фабрика ListTile-ов
  Widget _buildRow(int i) {

    return Padding
      (
        padding: const EdgeInsets.all(16.0),
        child: ListTile
          (
          title: Text("${_members[i].login}", style: _biggerFont),
          leading: CircleAvatar
            (
              backgroundColor: Colors.green,
              backgroundImage: NetworkImage(_members[i].avatarUrl)
            ),
          )
      );
  }

  // Строим виджет
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar
        (
          title: Text(Strings.appTitle)
      ),
      body: ListView.builder
        (
          itemCount: _members.length * 2,
          itemBuilder: (BuildContext context, int position)
          {
            if (position.isOdd) return Divider();
            final index = position ~/ 2;
            return _buildRow(index);
          }
      ),
    );
  }
}