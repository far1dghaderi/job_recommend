import 'package:flutter/material.dart';

Future showErrorDialog(BuildContext context, String? error, {bool needShowTitle = true})async{
  return await showDialog(
    context: context, 
    builder: (context) => AlertDialog(
      contentPadding: EdgeInsets.all(30),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, color: Colors.red, size: 60,),
          SizedBox(height: 14,),
          if(needShowTitle!) Text('درخواست شما با مشکل مواجه شد', style: TextStyle(fontSize: 16,  color: Colors.black,fontWeight: FontWeight.w500),),
          SizedBox(height: 6,),
          Text(error ?? 'لطفاً دوباره تلاش کنید.', style: TextStyle(fontSize: 14),),
          SizedBox(height: 14,)
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: Navigator.of(context).pop, 
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            minimumSize: Size(double.infinity,40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text('بازگشت', style: TextStyle(color: Colors.white, fontSize: 12),)
        ),
      ],
      
  ),);
}