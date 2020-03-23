



class News {

  String title;
  String description;
  String image;

  News(this.title, this.description, this.image);

 factory News.fromJson(Map<String,dynamic> json){

    return News(
        json['title'],
        json['description'],
        json['urlToImage'],
    );
  }


}
