import 'character_model.dart';

class ComicModel {
  ComicModel({
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

  factory ComicModel.fromJson(Map<String, dynamic> json) => ComicModel(
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
    required this.comic,
  });

  int? offset;
  int? limit;
  int? total;
  int? count;
  List<Comic> comic;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        offset: json["offset"],
        limit: json["limit"],
        total: json["total"],
        count: json["count"],
        comic: List<Comic>.from(json["results"].map((x) => Comic.fromJson(x))),
      );
}

class Comic {
  Comic({
    this.id,
    this.digitalId,
    this.title,
    this.issueNumber,
    this.variantDescription,
    this.description,
    this.modified,
    this.isbn,
    this.upc,
    this.diamondCode,
    this.ean,
    this.issn,
    this.format,
    this.pageCount,
    this.textObjects,
    this.resourceUri,
    this.thumbnail,
    this.images,
  });

  int? id;
  int? digitalId;
  String? title;
  int? issueNumber;
  String? variantDescription;
  dynamic? description;
  String? modified;
  String? isbn;
  String? upc;
  String? diamondCode;
  String? ean;
  String? issn;
  String? format;
  int? pageCount;
  List<dynamic>? textObjects;
  String? resourceUri;
  Thumbnail? thumbnail;
  List<Thumbnail>? images;

  factory Comic.fromJson(Map<String, dynamic> json) => Comic(
        id: json["id"],
        digitalId: json["digitalId"],
        title: json["title"],
        issueNumber: json["issueNumber"],
        variantDescription: json["variantDescription"],
        description: json["description"],
        modified: json["modified"],
        isbn: json["isbn"],
        upc: json["upc"],
        diamondCode: json["diamondCode"],
        ean: json["ean"],
        issn: json["issn"],
        format: json["format"],
        pageCount: json["pageCount"],
        textObjects: List<dynamic>.from(json["textObjects"].map((x) => x)),
        resourceUri: json["resourceURI"],
        thumbnail: Thumbnail.fromJson(json["thumbnail"]),
        images: List<Thumbnail>.from(
            json["images"].map((x) => Thumbnail.fromJson(x))),
      );
}
