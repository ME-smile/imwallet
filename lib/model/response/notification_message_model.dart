import 'package:date_format/date_format.dart';

class NotificatioMesssageModel {
  String? title;
  String? noticeId;
  String? id;
  late String _createTime;
  // String updateTime;
  String? content;
  int? read;
  bool hasRead = false;
  NotificatioMesssageModel({required this.title});
  NotificatioMesssageModel.fromJson(Map json) {
    title = json['title'];
    noticeId = json['noticeId'];
    id = json['id'];
    _createTime = json['createTime'];
    // updateTime = json['updateTime'];
    content = json['content'];
    read = json['isRead'];
    hasRead = read == 1;
  }
  String get createTime => '${formatDate(DateTime.parse(_createTime), [
            yyyy,
            '-',
            mm,
            '-',
            dd,
            ' ',
            HH,
            ':',
            nn,
            ':',
            ss
          ])}';
}
