class Category {
  String? id;
  String? name;
  String? imageBucketPath;
  String? imageDisplayUrl;
  String? userId;

  Category(
      {this.id,
      this.userId,
      this.name,
      this.imageBucketPath,
      this.imageDisplayUrl});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userId = json['user_id'];
    imageBucketPath = json['imageBucketPath'];
    imageDisplayUrl = json['imageDisplayUrl'];
  }
}
