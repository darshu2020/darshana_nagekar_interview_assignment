import 'package:flutter/material.dart';
import 'package:interview_test_darshana_nagekar/controller/post_form/post_form.dart';
import 'package:interview_test_darshana_nagekar/style/color.dart';
import 'package:interview_test_darshana_nagekar/style/text_style.dart';
import 'package:interview_test_darshana_nagekar/view/custom_alert_dialog.dart';
import 'package:interview_test_darshana_nagekar/view/custom_button.dart';
import 'package:interview_test_darshana_nagekar/view/id_widget.dart';

class PostDetailWidget {
  static Widget buildPostListView(
    Map value,
    BuildContext context,
  ) {
    if (value["statusCode"] == 200)
      return Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 8.0,left: 4.0),
              child: IdWidgetClass.buildIdConatiner(
                  value["post"].id.toString(), context),
            ),
            Padding(
              padding: EdgeInsets.only(top:8.0,left:4),
              child: Text(
                value["post"].title,
                style: AppTextStyle.montserratSemiBoldWithBlackText,
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(top: 4.0),
                child: Text(value["post"].body.replaceAll("\n", " "),
                    style: AppTextStyle.montserratRegular),
              ),
            ),
            Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: CustomButton(
                      color: AppColors.primaryColor,
                      text: "Update Post",
                      style: AppTextStyle.montserratRegularBlueText ,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PostForm(
                                      isUpdate: true,
                                      post: value["post"],
                                    )));
                      },
                    )),
                    
                Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: CustomButton(
                      color: Colors.red,
                      text: "Delete Post",
                      style: AppTextStyle.montserratRegularRedText,
                      onTap: () {
                        deletePostAlert(context, value["post"].id);
                      },
                    )),
              ],
            ),
          ],
        ),
      );
     if (value["statusCode"] == 201)
      return Center(
        child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(AppColors.primaryColor)
            ),
      );
    else
      return Center(
        child: Text("Failed to fetch"),
      );
  }
}
