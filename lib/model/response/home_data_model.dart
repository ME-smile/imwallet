import 'package:dc_flutter_cli/model/response/carousel_image_model.dart';
import 'package:dc_flutter_cli/model/response/notification_message_model.dart';
import 'package:dc_flutter_cli/model/response/profit_brief_model.dart';
import 'package:dc_flutter_cli/model/response/user_profile_model.dart';

class HomeDataModel {
  ProfitBriefModel? profitBrief;
  UserProfileModel? user;

  HomeDataModel({
    this.profitBrief,
    this.user,
  });

  HomeDataModel copyWith({
    ProfitBriefModel? profitBrief,
    UserProfileModel? user,
  }) {
    return HomeDataModel(
      profitBrief: profitBrief ?? this.profitBrief,
      user: user ?? this.user,
    );
  }
}
