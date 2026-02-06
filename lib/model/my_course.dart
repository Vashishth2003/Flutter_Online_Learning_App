import 'course.dart';

class MyCourse {
  final Course _course;

  int _progress = 0;
  bool _isDownloaded = false;
  bool _isArchived = false;

  MyCourse(this._course);

  int get progress => _progress;

  Course get course => _course;

  bool get isDownloaded => _isDownloaded;

  set isDownloaded(bool value) {
    _isDownloaded = value;
  }

  bool get isArchived => _isArchived;

  set isArchived(bool value) {
    _isArchived = value;
  }

  set progress(int value) {
    _progress = value;
  }
}
