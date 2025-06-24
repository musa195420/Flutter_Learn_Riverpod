class Item {
  final String id;
  final String name;
  final bool favourite;
  Item({required this.favourite, required this.id, required this.name});

  Item copyWith({String? id, String? name, bool? favourite}) {
    return Item(
        favourite: favourite ?? this.favourite,
        id: id ?? this.id,
        name: name ?? this.name);
  }
}
