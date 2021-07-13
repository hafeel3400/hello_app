import 'package:flutter/material.dart';
import 'package:hello_app/models/newsinfo.dart';
import 'package:hello_app/services/api_manager.dart';
import 'package:hello_app/utils/utility.dart';
import 'package:hello_app/productbox.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<NewsModel> _newsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("News Listing")),
        body: Container(
            child: FutureBuilder<NewsModel>(
          future: _newsModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print("data");
              return ListView.builder(
                itemCount: snapshot.data!.articles.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var articles = snapshot.data!.articles[index];
                  return Container(
                    height: 150,
                    color: Colors.red,
                    child: GestureDetector(
                      child: ProductBox(item: articles),
                      onTap: () {
                        alertDialog(context, "Title", "Position $index");
                      },
                    ),
                  );
                },
              );
            } else
              print("failure");
            return Center(child: CircularProgressIndicator());
          },
        )));
  }

  @override
  void initState() {
    _newsModel = ApiManager().getNews();
    print(_newsModel.toString());
    super.initState();
  }
}
