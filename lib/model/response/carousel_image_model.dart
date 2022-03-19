class CarouselImageModel {
  String? id;
  String? imageUrl;

  CarouselImageModel.fromJson(Map json) {
    id = json['id'];
    imageUrl = json['imageAddress'];
  }
}
