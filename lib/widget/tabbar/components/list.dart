import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_demo/widget/tabbar/detail.dart';

class NewList extends StatefulWidget {
  @override
  _NewListState createState() => new _NewListState();
}

String horseUrl = 'https://i.stack.imgur.com/Dw6f7.png';

class _NewListState extends State<NewList> {
  List data;
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    /**
     * ListView 类提供构建器itemBuilder
     * itemBuilder 有两个参数 BuildContext 和 行迭代器index
     * index 迭代器从0开始，在每次调用该函数时递增
     */
    return _buildList();
  }

  Widget _buildList() {
    return ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: _buildRow(data[index]),
          );
        });
  }

  Widget _buildRow(dataItem) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(horseUrl)),
      title: Text(dataItem['title']),
      subtitle: Text(dataItem["body"]),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () => _onTap(dataItem['id'].toString()),
    );
  }

  void _onTap(String id) {
    Navigator.of(context).push(new PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 500),
        pageBuilder: (BuildContext context, Animation animation,
            Animation secondaryAnimation) {
          return new FadeTransition(
            opacity: animation,
            child: new Detail(id),
          );
        }));
  }

  getData() async {
    String url = 'http://jsonplaceholder.typicode.com/posts';
    var result;

    try {
      // 创建一个HttpClient
      HttpClient httpClient = new HttpClient();
      // 打开http连接
      HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
      //使用iPhone的UA
      request.headers.add("user-agent",
          "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1");
      // 等待连接服务器
      HttpClientResponse response = await request.close();

      // 读取响应内容
      if (response.statusCode == 200) {
        var jsonStr = await response.transform(utf8.decoder).join();
        result = json.decode(jsonStr);
      } else {
        result =
            "Error gettting JSON Data:\nHttp Status ${response.statusCode}";
      }
    } catch (e) {
      result = 'Failed getting JSON Data';
    }

    setState(() {
      data = result;
    });
  }
}
