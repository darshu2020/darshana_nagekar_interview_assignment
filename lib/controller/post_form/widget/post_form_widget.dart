import 'package:flutter/material.dart';
import 'package:interview_test_darshana_nagekar/model/post.dart';
import 'package:interview_test_darshana_nagekar/style/color.dart';
import 'package:interview_test_darshana_nagekar/style/text_style.dart';
import 'package:interview_test_darshana_nagekar/view/custom_textField.dart';

class PostFormWidget extends StatefulWidget {
  final bool isUpdate;
  final Post updatePost;
  final Function onTitleChanged;
  final Function onBodyChanged;
  final Key formKey;

  PostFormWidget(
      {this.isUpdate,
      this.onBodyChanged,
      this.onTitleChanged,
      this.updatePost,
      this.formKey});
  @override
  _State createState() => _State();
}

class _State extends State<PostFormWidget> {

  @override
  void dispose() {
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          Container(
            color: AppColors.primaryColor,
            height: 50,
          ),
          Expanded(
            flex: 1,
            child: Form(
              key: widget.formKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: _buildContainer(context, "TITLE"),
                  ),
                  Expanded(
                    child: CustomTextField(
                      style: AppTextStyle.montserratRegularBlackText,
                      onChange: widget.onTitleChanged,
                      hintText:
                          widget.isUpdate ? widget.updatePost.title : "Title",
                      validator: widget.isUpdate
                          ? null
                          : (value) {
                              if (value.isEmpty) {
                                return 'Please enter title';
                              }
                              return null;
                            },
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: <Widget>[
                        _buildContainer(context, "BODY"),
                        Expanded(
                          child: CustomTextField(
                            style: AppTextStyle.montserratLigthBlackText,
                            onChange: widget.onBodyChanged,
                            hintText: widget.isUpdate
                                ? widget.updatePost.body
                                : "Body",
                            validator: widget.isUpdate
                                ? null
                                : (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter body';
                                    }
                                    return null;
                                  },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildContainer(BuildContext context, String text) {
  return Container(
    width: MediaQuery.of(context).size.width,
    color: AppColors.lighterGreyColor,
    height: 32,
    child: Padding(
      padding: EdgeInsets.only(left: 12.0, top: 4),
      child: Text(
        text,
        style: AppTextStyle.montserratRegularGreyText,
      ),
    ),
  );
}
