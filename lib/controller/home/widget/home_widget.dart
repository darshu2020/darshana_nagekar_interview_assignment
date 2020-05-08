import 'package:flutter/material.dart';
import 'package:interview_test_darshana_nagekar/controller/post_detail/post_detail.dart';
import 'package:interview_test_darshana_nagekar/model/post_provider.dart';
import 'package:interview_test_darshana_nagekar/style/text_style.dart';
import 'package:interview_test_darshana_nagekar/view/id_widget.dart';

class HomeWidget {
  static Widget buildPostListView(Map value, BuildContext context) {
    if (value["statusCode"] == 201)
      return Center(
        child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.white)),
      );
    if (value["statusCode"] == 200)
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "All Posts",
              style: AppTextStyle.montserratSemibold,
            ),
          ),
          value["posts"].length > 0
              ? Expanded(
                  child: ListView.builder(
                    itemCount: value["posts"].length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          postProvider.resetSinglePost();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PostDetail(
                                        postId: value["posts"][index].id,
                                      )));
                        },
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 10.0),
                                    child: IdWidgetClass.buildIdConatiner(
                                        value["posts"][index].id.toString(),
                                        context),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 4.0),
                                    child: Text(
                                      value["posts"][index].title,
                                      style: AppTextStyle
                                          .montserratSemiBoldWithBlackText,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 5.0, bottom: 20.0),
                                    child: Text(
                                        value["posts"][index]
                                            .body
                                            .replaceAll("\n", " "),
                                        overflow: TextOverflow.ellipsis,
                                        style: AppTextStyle.montserratRegular),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              : Container(
                  child: Center(
                    child: Text(
                      "No Post Found",
                      style: AppTextStyle.montserratBold,
                    ),
                  ),
                ),
        ],
      );
    else
      return Container(
        child: Center(
          child: Text(
            "It was an issue while fetching data",
            style: AppTextStyle.montserratBold,
          ),
        ),
      );
  }
}
