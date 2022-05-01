import 'package:time_tracker/services/firestore_service.dart';
import 'package:time_tracker/app/home/models/job.dart';
import 'package:time_tracker/services/api_path.dart';

abstract class Database {
  void createJob(Job job);
  Stream<List<Job>> jobsStream();
}

class FirestoreDatabase implements Database {
  FirestoreDatabase({required this.uid});

  final String uid;

  final _service = FireStoreService.instance;

  @override
  void createJob(Job job) => _service.setData(
        path: APIPath.job(uid, "job_abc"),
        data: job.toMap(),
      );

  @override
  Stream<List<Job>> jobsStream() => _service.collectionStream(
        path: APIPath.jobs(uid),
        builder: (data) => Job.fromMap(data),
      );
}
