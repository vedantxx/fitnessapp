class RecipeModel{
  final String label;
  final String image;
  final String source;
  final String url;
  RecipeModel({this.url,this.source,this.image,this.label});
  factory RecipeModel.fromMap(Map<String,dynamic> parsedJson){
    return  RecipeModel(
      url: parsedJson["url"],
      source: parsedJson["source"],
      image: parsedJson["image"],
      label: parsedJson["label"],
    );
  }
}