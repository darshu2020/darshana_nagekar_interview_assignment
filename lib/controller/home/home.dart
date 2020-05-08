import 'dart:io';

import 'package:flutter/material.dart';
import 'package:interview_test_darshana_nagekar/controller/home/widget/home_widget.dart';
import 'package:interview_test_darshana_nagekar/controller/post_form/post_form.dart';
import 'package:interview_test_darshana_nagekar/model/post_provider.dart';
import 'package:interview_test_darshana_nagekar/network_manager/post_repository.dart';
import 'package:interview_test_darshana_nagekar/style/color.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  void initState() {
    //postProvider.resetSinglePost();
    getAllPost();
    
    super.initState();
  }

  void getAllPost() async {
    Map postMap = await PostRepository.fetchPost();
    postProvider.add(postMap);
  }

  @override
  void dispose() {
    postNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        exit(0);
        return true;
      },
          child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PostForm(
                            isUpdate: false,
                          )));
            },
            child: Icon(Icons.note_add),
            backgroundColor: AppColors.primaryColor,
          ),
          backgroundColor: AppColors.primaryColor,
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            elevation: 0,
            automaticallyImplyLeading: false,
          ),
          body: ValueListenableBuilder<Map>(
              valueListenable: postNotifier,
              builder: (context, value, child) {
                return Padding(
                    padding: EdgeInsets.all(16.0),
                    child: HomeWidget.buildPostListView(value,context));
              })),
    );
  }
}
