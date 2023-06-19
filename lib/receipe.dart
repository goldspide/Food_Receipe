class Receipe {
   String id;
   String title;
   String user;
   String imageUrl;
   String description;
   bool isFavorite;
   int favoriteCount;
  Receipe(this.title, this.user, this.imageUrl,this.favoriteCount,this.description,this.isFavorite, this.id);

   Map<String, dynamic> toJson(){
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['title'] = title;
      data['user'] = user;
      data['imageUrl']= imageUrl;
      data['description']= description;
      data['isFavorite']= isFavorite;
      data['favoriteCount'] = favoriteCount;
      return data;
   }
   static Receipe fromMap(Map<String, dynamic> data ){
      final Receipe receipe = Receipe(
          data['title'],
          data['user'],
          data['imageUrl'],
         data['favoriteCount'],
         data['description'],
         data['isFavorite'],
         data['_id'],
      );
      return receipe;

   }
}
