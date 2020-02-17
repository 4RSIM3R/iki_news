import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'US Politics',
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    child: Container(
                      decoration:
                          BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(5.0)),
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          'Show All',
                          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                height: 250.0,
                margin: EdgeInsets.only(top: 18.0, bottom: 18.0, right: 8.0),
                child: ListView.builder(
                  itemCount: 5,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300],
                      highlightColor: Colors.grey[100],
                      enabled: true,
                      child: Container(
                        height: 250.0,
                        width: 250.0,
                        margin: EdgeInsets.only(right: 12.0),
                        decoration:
                            BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5.0)),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 18.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '+62 News',
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    child: Container(
                      decoration:
                          BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(5.0)),
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          'Show All',
                          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
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
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 60.0,
                              width: 60.0,
                              decoration: BoxDecoration(
                                  color: Colors.white, borderRadius: BorderRadius.circular(5.0)),
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                // TODO : Ganti Jadi Teks
                                Container(
                                  height: 18.0,
                                  width: 75.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white
                                  ),
                                ),
                                SizedBox(
                                  height: 4.0,
                                ),
                                Container(
                                  height: 14.0,
                                  width: 55.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white
                                  ),
                                ),
                              ],
                            ),
                            Spacer(
                              flex: 1,
                            ),
                            IconButton(
                              icon: Icon(Icons.bookmark_border),
                              onPressed: () {},
                              iconSize: 32.0,
                              color: Colors.white,
                            )
                          ],
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
