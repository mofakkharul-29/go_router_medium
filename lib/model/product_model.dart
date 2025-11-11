class ProductModel {
  final String id;
  final String name;
  final String details;
  final String photoUrl;
  final double priceOld;
  final double priceNew;

  ProductModel({
    required this.id,
    required this.name,
    required this.details,
    required this.photoUrl,
    required this.priceOld,
    required this.priceNew,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? '1',
      name:
          json['name'] ??
          '', // fallback to empty string if null
      details: json['details'] ?? 'No details available',
      photoUrl:
          json['photo'] ?? 'https://picsum.photos/150',
      priceOld:
          (json['previousPrice'] as num?)?.toDouble() ??
          0.0,
      priceNew:
          (json['recentPrice'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'details': details,
      'photoUrl': photoUrl,
      'previousPrice': priceOld,
      'recentPrice': priceNew,
    };
  }
}
