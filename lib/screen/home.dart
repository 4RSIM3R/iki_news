import 'package:flutter/material.dart';
import 'package:iki_news/bloc/news_bloc.dart';
import 'package:iki_news/model/news_api_response.dart';
import 'package:iki_news/widget/header_news.dart';
import 'package:shimmer/shimmer.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  NewsBloc bloc = NewsBloc();

  @override
  void initState() {
    super.initState();
    bloc.getAmericanNews().then((val) {
      print('Datane ${val[0].author}');
    }).catchError((e) {
      print('Error Pak ${e.toString()}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(right: 18.0, left: 18.0, top: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              HeaderNews(
                title: 'Us Politic',
                prefix: 'Tes',
                onTap: () {},
              ),
              StreamBuilder<List<NewsApiResponse>>(
                  stream: bloc.americanNewResponse,
                  builder: (context, AsyncSnapshot<List<NewsApiResponse>> snapshot) {
                    if (snapshot.hasError) {
                      return Container(
                        child: Center(
                          child: Text(snapshot.error.toString()),
                        ),
                      );
                    } else {
                      return Container(
                        height: 250.0,
                        margin: EdgeInsets.only(top: 18.0, bottom: 18.0, right: 8.0),
                        child: ListView.builder(
                          itemCount: snapshot.data != null ? snapshot.data.length : 0,
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 250.0,
                              width: 250.0,
                              margin: EdgeInsets.only(right: 12.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.0),
                                  image:
                                      DecorationImage(image: NetworkImage(snapshot.data[index].urlToImage))),
                            );
                          },
                        ),
                      );
                    }
                  }),
              SizedBox(
                height: 18.0,
              ),
              HeaderNews(
                title: '+62 News',
                prefix: 'res',
                onTap: () {},
              ),
              SizedBox(
                height: 18.0,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300],
                      highlightColor: Colors.grey[100],
                      enabled: true,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: ListTile(
                          leading: Container(
                            height: 50.0,
                            width: 50.0,
                          ),
                          title: Text('Tes'),
                          subtitle: Text('Tes'),
                          onTap: () {},
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
