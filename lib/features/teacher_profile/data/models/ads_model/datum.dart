class Datum {
  int? id;
  String? type;
  int? ord;
  String? name;
  String? img;
  String? imgThumbnail;
  dynamic details;
  int? isActive;
  DateTime? createdAt;

  Datum({
    this.id,
    this.type,
    this.ord,
    this.name,
    this.img,
    this.imgThumbnail,
    this.details,
    this.isActive,
    this.createdAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json['id'] as int?,
    type: json['type'] as String?,
    ord: json['ord'] as int?,
    name: json['name'] as String?,
    img: json['img'] as String?,
    imgThumbnail: json['img_thumbnail'] as String?,
    details: json['details'] as dynamic,
    isActive: json['is_active'] as int?,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'ord': ord,
    'name': name,
    'img': img,
    'img_thumbnail': imgThumbnail,
    'details': details,
    'is_active': isActive,
    'created_at': createdAt?.toIso8601String(),
  };
}
