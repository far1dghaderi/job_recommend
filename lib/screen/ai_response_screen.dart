import 'package:flutter/material.dart';
import 'package:job_recommender/model/job_recommadn_model.dart';
import 'package:job_recommender/utils/size_extension.dart';
import 'package:job_recommender/widgets/one_row_widget.dart';

class AiResponseScreen extends StatelessWidget {
  final List<JobRecommendationModel> jobRecommendations;
  final bool isFromHistory;
  const AiResponseScreen({super.key, required this.jobRecommendations, required this.isFromHistory});

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
                      child: InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Icon(Icons.navigate_before, color: Colors.white, size: 27,)
                        ),
                      ),
                    ),
                    Row(
                      spacing: 8,
                      children: [
                        Icon(Icons.info_outline_rounded, color: Colors.grey.shade200,),
                        Text('مشاغل پیشنهادی', style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white, fontWeight: FontWeight.w500,fontSize: 26),),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: context.height * 0.12),
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if(!isFromHistory)
                        Text(
                          'شغل های پیشنهادی برای شما : ',
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      SizedBox(height: 20),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: jobRecommendations.length,
                        separatorBuilder: (context, index) => Container(
                          margin: EdgeInsets.symmetric(vertical: 15),
                          height: 2,
                          color: Colors.grey.shade200,
                        ),
                        itemBuilder: (context, index) {
                          final job = jobRecommendations[index];
                          return JobRecommendationCard(
                            jobModel: job,
                            jobNumber: index + 1,
                            isFromHistory: isFromHistory,
                          );
                        },
                      ),
                    ],
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

class JobRecommendationCard extends StatelessWidget {
  final JobRecommendationModel jobModel;
  final int jobNumber;
  final bool isFromHistory;
  
  const JobRecommendationCard({
    super.key,
    required this.jobModel,
    required this.jobNumber,
    required this.isFromHistory,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: isFromHistory ? EdgeInsets.zero : EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isFromHistory ? Colors.transparent : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: 
        isFromHistory 
          ? []
          : [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
          ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(!isFromHistory)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'گزینه $jobNumber',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
          if(!isFromHistory) SizedBox(height: 12),
          OneRowDataWidget(
            title: 'شغل پیشنهادی',
            des: jobModel.recommendedJob,
            isList: false,
          ),
          OneRowDataWidget(
            title: 'چرا این شغل مناسب شماست؟',
            des: jobModel.reason,
            isList: false,
          ),
          OneRowDataWidget(
            title: 'مهارت های لازم',
            des: jobModel.requiredSkills,
            isList: true,
          ),
          OneRowDataWidget(
            title: 'زمان تخمینی یادگیری مهارت ها',
            des: jobModel.estimatedLearningTime,
            isList: false,
          ),
          OneRowDataWidget(
            title: 'درآمد تخمینی ماهانه',
            des: jobModel.potentialIncome,
            isList: false,
          ),
          OneRowDataWidget(
            title: 'تقاضای بازار',
            des: jobModel.marketDemand,
            isList: false,
          ),
        ],
      ),
    );
  }
}
