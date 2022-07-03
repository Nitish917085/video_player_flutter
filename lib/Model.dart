import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';
import 'VideoPlayer.dart';

class Model extends StatelessWidget {
  Object? newData;
  Model(this.newData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = json.decode(newData.toString());
    var _size = MediaQuery
        .of(context)
        .size;
    return Container(
      color: Color.fromARGB(44, 99, 55, 44),
     child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          InViewNotifierList(
            scrollDirection: Axis.vertical,
            isInViewPortCondition: (double deltaTop, double deltaBottom,
                double viewPortDimension) {
              return deltaTop < (0.5 * viewPortDimension) &&
                  deltaBottom > (0.5 * viewPortDimension);
            },

            itemCount: data == null ? 0 : data.length,
            builder: (BuildContext context, int index) {
              return Container(
                width: double.infinity,
                height: _size.height / 2.8,
                alignment: Alignment.center,
                padding: const EdgeInsets.only(left: 0, right: 0),
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return InViewNotifierWidget(
                      id: '$index',
                      builder:
                          (BuildContext context, bool isInView, Widget? child) {
                        return isInView
                            ?
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Container(
                            width: _size.width,
                            height: _size.height / 3.6,
                            decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.black26,
                            ),
                            child: VideoWidget(
                              play: isInView,
                              url: data[index]['videoUrl']

                            ),
                           ),

                            Row(
                            children:[
                              IconButton(
                                icon: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    data[index]['coverPicture'],
                                  ),
                                  radius: 13,
                                ),
                                onPressed: () {},
                              ),


                              SizedBox.fromSize(
                              child: Text(
                                    data[index]['title'],
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15),
                              )
                              ,
                            )
                              ]
                            )
                          ]
                        )
                            : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Container(
                        decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius:
                        BorderRadius.circular(10)),
                        height: _size.height / 3.6,
                        child: Image.network(
                        data[index]['coverPicture'],
                        fit: BoxFit.fill,
                        ),
                        ),
                          Row(
                              children:[
                                IconButton(
                                  icon: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      data[index]['coverPicture'],
                                    ),
                                    radius: 13,
                                  ),
                                  onPressed: () {},
                                ),

                                SizedBox.fromSize(
                                  child: Text(
                                    data[index]['title'],
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15),
                                  ),
                                )

                              ]
                          )
                        ]

                        );

                      },

                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}