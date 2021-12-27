class CharacterModel {
    CharacterModel({
        this.code,
        this.status,
        this.copyright,
        this.attributionText,
        this.attributionHtml,
        this.etag,
       required this.data,
    });

    int? code;
    String? status;
    String? copyright;
    String? attributionText;
    String? attributionHtml;
    String? etag;
     Data data;

    factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        code: json["code"],
        status: json["status"],
        copyright: json["copyright"],
        attributionText: json["attributionText"],
        attributionHtml: json["attributionHTML"],
        etag: json["etag"],
        data: Data.fromJson(json["data"]),
    );


}

class Data {
    Data({
        this.offset,
        this.limit,
        this.total,
        this.count,
      required this.characters,
    });

    int? offset;
    int? limit;
    int? total;
    int? count;
    List<Character> characters;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        offset: json["offset"],
        limit: json["limit"],
        total: json["total"],
        count: json["count"],
        characters: List<Character>.from(json["results"].map((x) => Character.fromJson(x))),
    );

   
}

class Character {
    Character({
        this.id,
        this.name,
        this.description,
        this.modified,
        this.thumbnail,
        this.resourceUri,
        
    });

    int? id;
    String? name;
    String? description;
    String? modified;
    Thumbnail? thumbnail;
    String? resourceUri;

    factory Character.fromJson(Map<String, dynamic> json) => Character(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        modified: json["modified"],
        thumbnail: Thumbnail.fromJson(json["thumbnail"]),
        resourceUri: json["resourceURI"],
    );

}





class Thumbnail {
    Thumbnail({
        this.path,
        this.extension,
    });

    String? path;
    String? extension;

    factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        path: json["path"],
        extension: json["extension"],
    );

    Map<String, dynamic> toJson() => {
        "path": path,
        "extension": extension,
    };
}
