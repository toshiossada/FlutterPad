abstract class EntityBase {
  final String id;
  const EntityBase({
    required this.id,
  });

  Map<String, dynamic> toMap();
}
