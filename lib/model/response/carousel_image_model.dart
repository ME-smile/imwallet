class CarouselImageModel {
  String? id;
  String? imageUrl;
  String? projectLogo;
  String? projectName;

  CarouselImageModel.fromJson(Map json) {
    id = json['id'];
    imageUrl = json['imageAddress'];
    projectLogo = json['projectLogo'];
    projectName = json['projectName'];
  }
}
