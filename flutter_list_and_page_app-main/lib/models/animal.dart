import 'package:equatable/equatable.dart';

class Animal extends Equatable {
  final String name;
  final String imageLink;

  const Animal({required this.name, required this.imageLink});

  @override
  List<Object?> get props => [name, imageLink];

  factory Animal.fromJson(Map<String, dynamic> map) {
    return Animal(name: map['name'], imageLink: map['image_link']);
  }
}
