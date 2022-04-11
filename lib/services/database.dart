import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:time_tracker/app/home/models/job.dart';
import 'package:time_tracker/services/api_path.dart';

abstract class Database {
  void createJob(Job job);
}

class FirestoreDatabase implements Database {
  FirestoreDatabase({required this.uid});

  final String uid;

  @override
  void createJob(Job job) => _setData(
        path: APIPath.job(uid, "job_abc"),
        data: job.toMap(),
      );

  Future<void> _setData(
      {required String path, required Map<String, dynamic> data}) async {
    final reference = FirebaseFirestore.instance.doc(path);
    await reference.set(data);
  }
}
