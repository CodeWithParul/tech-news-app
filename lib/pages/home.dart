import 'package:flutter/material.dart';
import 'package:newsio/backend/functions.dart';
import 'package:newsio/components/appbar.dart';
import 'package:newsio/components/newsbox.dart';
import 'package:newsio/components/searchbar.dart';
import 'package:newsio/utils/colors.dart';

import '../utils/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List> news;

  @override
  void initState() {
    super.initState();
    news = fetchnews();
  }

  void setValue() {
    if (NewsBox.open == true) {
      Navigator.pop(context);
      setState(() {
        NewsBox.open = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: setValue,
      child: Scaffold(
          backgroundColor: AppColors.black,
          appBar: appbar(),
          body: Column(
            children: [
              SearchBar(),
              Expanded(
                child: Container(
                    width: w,
                    child: FutureBuilder<List>(
                      future: fetchnews(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return NewsBox(
                                  url: snapshot.data![index]['url'],
                                  imageurl: snapshot.data![index]
                                              ['urlToImage'] !=
                                          null
                                      ? snapshot.data![index]['urlToImage']
                                      : Constants.imageurl,
                                  title: snapshot.data![index]['title'],
                                  time: snapshot.data![index]['publishedAt'],
                                  description: snapshot.data![index]
                                          ['description']
                                      .toString(),
                                );
                              });
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }

                        // By default, show a loading spinner.
                        return Center(
                            child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ));
                      },
                    )),
              ),
            ],
          )),
    );
  }
}
