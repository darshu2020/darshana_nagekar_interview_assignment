import 'package:flutter/material.dart';
import 'package:interview_test_darshana_nagekar/controller/home/home.dart';
import 'package:interview_test_darshana_nagekar/controller/post_detail/widget/post_detail_widget.dart';
import 'package:interview_test_darshana_nagekar/model/post_provider.dart';
import 'package:interview_test_darshana_nagekar/network_manager/post_repository.dart';
import 'package:interview_test_darshana_nagekar/style/color.dart';
import 'package:interview_test_darshana_nagekar/style/text_style.dart';


class PostDetail extends StatefulWidget {
  final postId;

  const PostDetail({this.postId});

  @override
  _PostDetailState createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  @override
  void initState() {
    getPostDetail();
    super.initState();
  }

  void getPostDetail() async {
    Map post = await PostRepository.getPostById(widget.postId);
    postProvider.getSinglePost(post);
  }

  @override
  void dispose() {
    singlePostNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return WillPopScope(
        onWillPop: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> Home())),
          child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          title: Text("View Post",style: AppTextStyle.montserratRegularWhiteText),
        ),
        body: ValueListenableBuilder<Map>(
            valueListenable: singlePostNotifier,
            builder: (context, value, child) {
              return Padding(
                padding: EdgeInsets.only(top: 16.0, left: 12,right: 12),
                child: Container(
                    height: MediaQuery.of(context).size.height/1.5,
                    child: Card(
                        child:
                            PostDetailWidget.buildPostListView(value, context))),
              );
            }),
      ),
    );
  }
}
