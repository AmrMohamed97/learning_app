class SubCraftModel {
  int? id;
  dynamic parentId;
  String? type;
  String? sector;
  int? ord;
  String? name;
  String? img;
  String? imgThumbnail;
  String? details;
  int? isActive;
  DateTime? createdAt;
  dynamic link;
  String? title;

  SubCraftModel({
    this.id,
    this.parentId,
    this.type,
    this.sector,
    this.ord,
    this.name,
    this.img,
    this.imgThumbnail,
    this.details,
    this.isActive,
    this.createdAt,
    this.link,
    this.title,
  });

  factory SubCraftModel.fromJson(Map<String, dynamic> json) => SubCraftModel(
    id: json['id'] as int?,
    parentId: json['parent_id'] as dynamic,
    type: json['type'] as String?,
    sector: json['sector'] as String?,
    ord: json['ord'] as int?,
    name: json['name'] as String?,
    img: json['img'] as String?,
    imgThumbnail: json['img_thumbnail'] as String?,
    details: json['details'] as String?,
    isActive: json['is_active'] as int?,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    link: json['link'] as dynamic,
    title: json['title'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'parent_id': parentId,
    'type': type,
    'sector': sector,
    'ord': ord,
    'name': name,
    'img': img,
    'img_thumbnail': imgThumbnail,
    'details': details,
    'is_active': isActive,
    'created_at': createdAt?.toIso8601String(),
    'link': link,
    'title': title,
  };
}
