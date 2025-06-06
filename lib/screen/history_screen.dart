import 'package:flutter/material.dart';
import 'package:job_recommender/controller/ai_response_database_controller.dart';
import 'package:job_recommender/model/job_recommadn_model.dart';
import 'package:job_recommender/screen/ai_response_screen.dart';
import 'package:job_recommender/utils/size_extension.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {

  bool isLoading = false;
  List<JobRecommendationModel> data = [];
  AiResponseDatabaseController  aiResponseDatabaseController = AiResponseDatabaseController();


  getLocalData()async{
    setState(()=> isLoading = true);
    data = aiResponseDatabaseController.getAllJobRecommendations();
    setState(()=> isLoading = false);
  }
  

  @override
  void initState() {
    getLocalData();
    super.initState();
  }
  
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                height: context.height * 0.15,
                width: double.infinity,
                color: Theme.of(context).primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                        children: [
                          InkWell(
                            onTap: () => Navigator.of(context).pop(),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Icon(Icons.navigate_before, color: Colors.white, size: 27,)
                            ),
                          ),
                          InkWell(
                            onTap: ()async {
                              aiResponseDatabaseController.deleteAllJobRecommendations();
                              getLocalData();
                            },
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Icon(Icons.delete_outline, color: Colors.white, size: 27,)
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      spacing: 8,
                      children: [
                        Icon(Icons.history_toggle_off, color: Colors.grey.shade200,),
                        Text('تاریخچه درخواست ها', style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white, fontWeight: FontWeight.w500,fontSize: 26),),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: context.height * 0.12),
                width: double.infinity,
                padding: const  EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                decoration:  BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )
                ),
                child: isLoading 
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                  : data.isEmpty 
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('هیچ داده ای وجود ندارد', style: TextStyle(color: Colors.black, fontSize: 14, ),)
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) => Container(
                          padding: EdgeInsets.symmetric(vertical: 13, horizontal: 15),
                          margin: EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: InkWell(
                            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => AiResponseScreen(jobRecommendations: [data[index]],isFromHistory: true,),)),
                            child: Row(
                              children: [
                                Column(
                                  spacing: 4,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(data[index].recommendedJob,style: TextStyle(color: Colors.black, fontSize: 14, fontFamily: 'vazirmatn'),),
                                    Text(data[index].reason.length > 20 ? '${data[index].reason.substring(0, 20)}...' : data[index].reason,style: TextStyle(color: Colors.grey, fontSize: 10, fontFamily: 'vazirmatn'),),
                                  ],
                                ),
                                Spacer(),
                                Icon(Icons.arrow_forward_ios, color: Theme.of(context).primaryColor,size: 17,),
                              ],
                            ),
                          ),
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}