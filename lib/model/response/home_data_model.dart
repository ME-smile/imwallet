import 'package:dc_flutter_cli/model/response/carousel_image_model.dart';
import 'package:dc_flutter_cli/model/response/profit_brief_model.dart';
import 'package:dc_flutter_cli/model/response/transaction_record_model.dart';
import 'package:dc_flutter_cli/model/response/user_profile_model.dart';

class HomeDataModel {
  List<CarouselImageModel>? carousels;
  List<TransactionRecordModel>? transactionRecords;
  ProfitBriefModel? profitBrief;
  UserProfileModel? user;

  HomeDataModel({
    this.carousels,
    this.transactionRecords,
    this.profitBrief,
    this.user,
  });

  HomeDataModel copyWith({
    List<CarouselImageModel>? carousels,
    List<TransactionRecordModel>? transactionRecords,
    ProfitBriefModel? profitBrief,
    UserProfileModel? user,
  }) {
    return HomeDataModel(
      carousels: carousels ?? this.carousels,
      transactionRecords: transactionRecords ?? this.transactionRecords,
      profitBrief: profitBrief ?? this.profitBrief,
      user: user ?? this.user,
    );
  }
}
