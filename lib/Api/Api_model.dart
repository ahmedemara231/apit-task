class ApiModel
{
  int? id;
  String anime;
  String character;
  String quote;
  ApiModel({
    this.id,
    required this.anime,
    required this.character,
    required this.quote,
});
  factory ApiModel.fromJson(dynamic map)
  {
    return ApiModel(
        id: map['id'],
        anime: map['anime'],
        character: map['character'],
        quote: map ['quote']
    );
  }
}