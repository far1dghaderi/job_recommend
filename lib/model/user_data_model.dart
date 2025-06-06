class UserDataModel {
  final String age;
  final String city;
  final String weight;
  final String height;
  final String fatherJob;
  final String motherJob;
  final String currentIncome;
  final String freeTime;
  final String minTimeForLearning;
  final String workHistory;
  final String personalInterest;

  final String? gender;
  final String? maritalStatus;
  final String? financeStatus;
  final String? skillDifficultyLevel;
  final String? healthyStatus;
  final String? educationStatus;

  UserDataModel({
    required this.age,
    required this.city,
    required this.weight,
    required this.height,
    required this.fatherJob,
    required this.motherJob,
    required this.currentIncome,
    required this.freeTime,
    required this.minTimeForLearning,
    required this.workHistory,
    required this.personalInterest,
    this.gender,
    this.maritalStatus,
    this.financeStatus,
    this.skillDifficultyLevel,
    this.healthyStatus,
    this.educationStatus,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      age: json['age'] ?? '',
      city: json['city'] ?? '',
      weight: json['weight'] ?? '',
      height: json['height'] ?? '',
      fatherJob: json['fatherJob'] ?? '',
      motherJob: json['motherJob'] ?? '',
      currentIncome: json['currentIncome'] ?? '',
      freeTime: json['freeTime'] ?? '',
      minTimeForLearning: json['minTimeForLearning'] ?? '',
      workHistory: json['workHistory'] ?? '',
      personalInterest: json['personalInterest'] ?? '',
      gender: json['gender'],
      maritalStatus: json['maritalStatus'],
      financeStatus: json['financeStatus'],
      skillDifficultyLevel: json['skillDifficultyLevel'],
      healthyStatus: json['healthyStatus'],
      educationStatus: json['educationStatus'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'age': age,
      'city': city,
      'weight': weight,
      'height': height,
      'fatherJob': fatherJob,
      'motherJob': motherJob,
      'currentIncome': currentIncome,
      'freeTime': freeTime,
      'minTimeForLearning': minTimeForLearning,
      'workHistory': workHistory,
      'personalInterest': personalInterest,
      'gender': gender,
      'maritalStatus': maritalStatus,
      'financeStatus': financeStatus,
      'skillDifficultyLevel': skillDifficultyLevel,
      'healthyStatus': healthyStatus,
      'educationStatus': educationStatus,
    };
  }
}
