import 'package:flutter/material.dart';
import 'package:interview_test_darshana_nagekar/controller/home/home.dart';
import 'package:interview_test_darshana_nagekar/controller/post_detail/post_detail.dart';
import 'package:interview_test_darshana_nagekar/controller/post_form/widget/post_form_widget.dart';
import 'package:interview_test_darshana_nagekar/model/post.dart';
import 'package:interview_test_darshana_nagekar/network_manager/post_repository.dart';
import 'package:interview_test_darshana_nagekar/style/color.dart';
import 'package:interview_test_darshana_nagekar/style/text_style.dart';
import 'package:interview_test_darshana_nagekar/view/custom_alert_dialog.dart';

class PostForm extends StatefulWidget {
  final bool isUpdate;
  final Post post;

  const PostForm({@required this.isUpdate, this.post});

  @override
  _PostFormState createState() => _PostFormState();
}

class _PostFormState extends State<PostForm> {
  final _formKey = GlobalKey<FormState>();
  String title;
  String body;
  bool isLoading = false;
  Post post = new Post();

@override
  void dispose() {
  
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(widget.isUpdate ? "Update Post" : "Create Post",
            style: AppTextStyle.montserratRegularWhiteText),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
      ),
      body: PostFormWidget(
        isUpdate: widget.isUpdate,
        updatePost: widget.post,
        formKey: _formKey,
        onBodyChanged: widget.isUpdate
            ? (String str) {
                setState(() {
                  body = str;
                  widget.post.body = str;
                });
              }
            : (String str) {
                setState(() {
                  post.body = str;
                });
              },
        onTitleChanged: widget.isUpdate
            ? (String str) {
                setState(() {
                  title = str;
                  widget.post.title = str;
                });
              }
            : (String str) {
                setState(() {
                  post.title = str;
                });
              },
      ),
      bottomNavigationBar: Container(
          height: 60,
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
                blurRadius: 4,
                offset: Offset(4, -4),
                color: Colors.grey[300],
                spreadRadius: 0.1)
          ]),
          padding: EdgeInsets.only(right: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: 20,
              ),
              FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  onPressed: widget.isUpdate
                      ? title == null && body == null
                          ? () {} 
                          : () async {
                              
                              startOrStopLoader(true);
                              int status = await PostRepository.updatePostById(
                                  widget.post.id, postToJson(widget.post));

                              if (status == 200) {
                                startOrStopLoader(false);
                                updateAndCreatePostAlert(
                                  context,
                                  "Updated Successfully!",
                                  "Your post has been updated",
                                  postId: widget.post.id, onTap: () =>Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PostDetail(postId: widget.post.id,)))
                                );
                              } else {
                                startOrStopLoader(false);
                                updateAndCreatePostAlert(context, "Sorry!",
                                    "Failed to update your post");
                              }
                            }
                      : () async {
                          if (_formKey.currentState.validate()) {
                            startOrStopLoader(true);
                            int status = await PostRepository.createPost(
                                postToJson(post));
                            if (status == 201) {
                              startOrStopLoader(false);
                              print("created");
                              updateAndCreatePostAlert(
                                  context,
                                  "Created Successfully!",
                                  "Your post has been created",
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Home())));
                            } else {
                              startOrStopLoader(false);

                              updateAndCreatePostAlert(context, "Sorry!",
                                  "Failed to create your post");
                            }
                          }
                        },
                  color: AppColors.primaryColor,
                  textColor: Colors.white,
                  child: isLoading
                      ? Container(
                          width: 10,
                          height: 10,
                          child: Center(
                            child: CircularProgressIndicator(
                                valueColor: new AlwaysStoppedAnimation<Color>(
                                    Colors.white)),
                          ),
                        )
                      : Text(widget.isUpdate ? "Update" : "Create",
                          style: AppTextStyle.montserratBold)),
            ],
          )),
    );
  }

  void startOrStopLoader(bool isLoaded) {
    setState(() {
      isLoading = isLoaded;
    });
  }
}
