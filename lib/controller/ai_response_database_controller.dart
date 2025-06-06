import 'package:objectbox/objectbox.dart';
import 'package:get_it/get_it.dart';
import 'package:job_recommender/model/job_recommadn_model.dart';
import 'package:job_recommender/controller/data_source/local/local_database_service.dart';

class AiResponseDatabaseController {
  late final Box<JobRecommendationModel> _jobBox;
  final LocalDatabaseService _databaseService;

  AiResponseDatabaseController({LocalDatabaseService? databaseService}) 
    : _databaseService = databaseService ?? GetIt.instance<LocalDatabaseService>() {
    _jobBox = _databaseService.store.box<JobRecommendationModel>();
  }

  Future<int> saveJobRecommendation(JobRecommendationModel jobRecommendation) async {
    try {
      final int id = _jobBox.put(jobRecommendation);
      return id;
    } catch (e) {
      rethrow;
    }
  }

  List<JobRecommendationModel> getAllJobRecommendations() {
    return _jobBox.getAll();
  }

  bool deleteJobRecommendation(int id) {
    return _jobBox.remove(id);
  }

  void deleteAllJobRecommendations() {
    _jobBox.removeAll();
  }
  
}