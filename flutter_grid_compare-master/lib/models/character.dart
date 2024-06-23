import 'package:equatable/equatable.dart';

class Character extends Equatable {
  final String name;
  final String gender;
  final String image;
  final String house;

  const Character(this.name, this.gender, this.image, this.house);

  @override
  List<Object> get props => [name, gender, image, house];

  Character copyWith({
    String? name,
    String? gender,
    String? image,
    String? house,
  }) {
    return Character(
      name ?? this.name,
      gender ?? this.gender,
      image ?? this.image,
      house ?? this.house,
    );
  }

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
        json['name'] ?? '',
        json['gender'] ?? '',
        json['image'] ?? 'https://dummyimage.com/600x400/000/fff',
        json['house'] ?? '');
  }

  @override
  String toString() => 'Character(name: $name, gender: $gender, image: $image)';
}
