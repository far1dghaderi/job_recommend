import 'package:objectbox/objectbox.dart';

@Entity()
class JobRecommendationModel {
  @Id()
  int id = 0;

  final String recommendedJob;
  final String reason;
  final List<String> requiredSkills;
  final String estimatedLearningTime;
  final String potentialIncome;
  final String marketDemand;

  JobRecommendationModel({
    required this.recommendedJob,
    required this.reason,
    required this.requiredSkills,
    required this.estimatedLearningTime,
    required this.potentialIncome,
    required this.marketDemand,
  });

  factory JobRecommendationModel.fromJson(Map<String, dynamic> json) {
    return JobRecommendationModel(
      recommendedJob: json['recommendedJob'],
      reason: json['reason'],
      requiredSkills: List<String>.from(json['requiredSkills']),
      estimatedLearningTime: json['estimatedLearningTime'],
      potentialIncome: json['potentialIncome'],
      marketDemand: json['marketDemand'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'recommendedJob': recommendedJob,
      'reason': reason,
      'requiredSkills': requiredSkills,
      'estimatedLearningTime': estimatedLearningTime,
      'potentialIncome': potentialIncome,
      'marketDemand': marketDemand,
    };
  }
}