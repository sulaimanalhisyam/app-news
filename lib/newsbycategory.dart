import 'package:flutter/material.dart';
import 'package:news_app/helper/data_request.dart';
import 'package:news_app/helper/widget.dart';
import 'package:news_app/models/ResponseNews.dart';
import 'package:news_app/newsitem.dart';

class NewsByCategories extends StatefulWidget {
  final String newscategory;

  NewsByCategories({this.newscategory});

  @override
  _NewsByCategoriesState createState() => _NewsByCategoriesState(newscategory);
}

class _NewsByCategoriesState extends State<NewsByCategories> {
  NewsByCategory newsByCategories = NewsByCategory();
  String newsCategory;

  _NewsByCategoriesState(this.newsCategory);

  @override
  void iniState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: myAppBar(),
      body: FutureBuilder(
          future: newsByCategories.getNewsByCategory(newsCategory),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListNewsCategory(snapshot.data);
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return Center(child: Text('Data Tidak Ditemukan'));
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}

class ListNewsCategory extends StatelessWidget {
  ResponseNews responseNews;

  ListNewsCategory(this.responseNews);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 16),
        child: ListView.builder(
            itemCount: responseNews.articles.length,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              return NewsItem(
                imgUrl: responseNews.articles[index].urlToImage ?? '',
                title: responseNews.articles[index].title ?? '',
                desc: responseNews.articles[index].description ?? '',
                content: responseNews.articles[index].content ?? '',
                posturl: responseNews.articles[index].url ?? '',
                name: responseNews.articles[index].source.name ?? '',
              );
            }),
      ),
    );
  }
}
