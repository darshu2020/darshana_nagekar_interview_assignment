import 'package:flutter/material.dart';
import 'package:interview_test_darshana_nagekar/controller/home/home.dart';
import 'package:interview_test_darshana_nagekar/network_manager/post_repository.dart';
import 'package:interview_test_darshana_nagekar/style/color.dart';
import 'package:interview_test_darshana_nagekar/style/text_style.dart';
import 'package:interview_test_darshana_nagekar/view/custom_button.dart';
import 'alert_dialog.dart' as CustomDialog;


deletePostAlert(context,int postId) {
  showDialog(
      context: context,
      
      builder: (BuildContext context) {
        return CustomDialog.Dialog(
          verticalPadding: 180,
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          child: Column(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left:16.0,top: 12.0,bottom: 4),
                            child: Text('Delete Post?',style: AppTextStyle.montserratSemiboldBlackText,),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:16.0,bottom: 4,right: 16.0),
                        child: Text(
                            'Once deleted, this post will be deleted Permanently',style: AppTextStyle.montserratLigthGreyText),
                      ),
                    ],
                  )),
              Padding(
                padding: EdgeInsets.only(top: 12.0,left: 8,right: 8),
                child: 
                CustomButton(color:Colors.red ,text:"Delete Post",onTap: ()  {

                  PostRepository.deletePostById(postId);

                 Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                         
                },
                style: AppTextStyle.montserratRegularRedText
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 8.0,bottom: 20,left: 8,right: 8),
                  child: CustomButton(color:AppColors.cancelColor ,text:"Cancel",onTap: ()  {
                   
                   Navigator.pop(context);
                         
                  },style:AppTextStyle.montserratRegularCancelText ,
                  ),
                ),
            ],
          ),
        );
      }
      );
}

updateAndCreatePostAlert(context, String title,String message,{int postId,Function onTap}) {
  showDialog(
    
      context: context,
      
      builder: (BuildContext context) {
        return CustomDialog.Dialog(
          verticalPadding: 210,
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          child: Column(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top:16.0,left: 12.0),
                        child: Row(
                          children: <Widget>[
                            Text(title,style: AppTextStyle.montserratSemiBoldWithBlackText,),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left:12.0,top: 8),
                        child: Row(
                          children: <Widget>[
                            Text(
                                message,style: AppTextStyle.montserratLigthGreyText),
                          ],
                        ),
                      ),
                    ],
                  )),
             
              Padding(
                  padding: EdgeInsets.all( 16.0,),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    child: FlatButton(
                      textColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                          side:
              BorderSide(color: AppColors.primaryColor, width: 2),
                          borderRadius: BorderRadius.circular(4.0)),
                      onPressed: onTap == null ? () { Navigator.pop(context);}:onTap,
                      child: Text(
                        "Ok",
                        style: AppTextStyle.montserratRegularBlueText,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      }
      );
}

