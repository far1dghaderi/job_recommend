import 'package:objectbox/objectbox.dart';

@Entity()
class ResponseEntity {
  @Id()
  int id = 0;

  String name;

  @Property(type: PropertyType.date)
  DateTime createdAt;

  ResponseEntity({
    required this.name,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();
  
}