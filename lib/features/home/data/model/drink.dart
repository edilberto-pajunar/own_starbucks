import 'package:json_annotation/json_annotation.dart';

part 'drink.g.dart';

@JsonSerializable()
class Drink {
  final String id;
  final String name;
  final String description;
  final String image;
  final double price;
  final String category;
  final int calories;

  Drink({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.category,
    required this.calories,
  });

  factory Drink.fromJson(Map<String, dynamic> json) => _$DrinkFromJson(json);
  Map<String, dynamic> toJson() => _$DrinkToJson(this);

  static List<Drink> examples = [
    Drink(
      id: '1',
      name: 'Caffe Latte',
      description:
          'Rich espresso balanced with steamed milk and a light layer of foam',
      image:
          'https://images.unsplash.com/photo-1570968915860-54d5c301fa9f?w=400',
      price: 4.95,
      category: 'Hot Coffees',
      calories: 190,
    ),
    Drink(
      id: '2',
      name: 'Caramel Macchiato',
      description:
          'Freshly steamed milk with vanilla syrup, marked with espresso and caramel drizzle',
      image:
          'https://images.unsplash.com/photo-1599750256623-0b7c8e0c8e6e?w=400',
      price: 5.45,
      category: 'Hot Coffees',
      calories: 250,
    ),
    Drink(
      id: '3',
      name: 'Iced Caramel Macchiato',
      description:
          'Milk with vanilla syrup, marked with espresso and caramel drizzle, served over ice',
      image:
          'https://images.unsplash.com/photo-1517487881594-2787fef5ebf7?w=400',
      price: 5.45,
      category: 'Cold Coffees',
      calories: 250,
    ),
    Drink(
      id: '4',
      name: 'Cappuccino',
      description:
          'Dark, rich espresso with steamed milk and a deep layer of foam',
      image:
          'https://images.unsplash.com/photo-1572442388796-11668a67e53d?w=400',
      price: 4.45,
      category: 'Hot Coffees',
      calories: 140,
    ),
    Drink(
      id: '5',
      name: 'Iced White Chocolate Mocha',
      description:
          'White chocolate sauce and espresso over ice, topped with whipped cream',
      image:
          'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=400',
      price: 5.95,
      category: 'Cold Coffees',
      calories: 430,
    ),
    Drink(
      id: '6',
      name: 'Green Tea Latte',
      description:
          'Smooth and creamy matcha sweetened and served with steamed milk',
      image:
          'https://images.unsplash.com/photo-1563822249366-3a0fed4b7fc9?w=400',
      price: 4.95,
      category: 'Hot Teas',
      calories: 240,
    ),
  ];
}
