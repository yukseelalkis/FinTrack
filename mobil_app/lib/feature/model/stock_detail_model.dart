class StockDetailModel {
  int? id;
  String? symbol;
  String? companyName;
  double? purchase;
  double? lastDiv;
  String? industry;
  int? marketCap;
  List<Comments>? comments;

  StockDetailModel({
    this.id,
    this.symbol,
    this.companyName,
    this.purchase,
    this.lastDiv,
    this.industry,
    this.marketCap,
    this.comments,
  });

  factory StockDetailModel.fromJson(Map<String, dynamic> json) {
    return StockDetailModel(
      id: json['id'],
      symbol: json['symbol'],
      companyName: json['companyName'],
      purchase: double.tryParse(json['purchase'].toString()),
      lastDiv: double.tryParse(json['lastDiv'].toString()),
      industry: json['industry'],
      marketCap: int.tryParse(json['marketCap'].toString()),
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => Comments.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'symbol': symbol,
      'companyName': companyName,
      'purchase': purchase,
      'lastDiv': lastDiv,
      'industry': industry,
      'marketCap': marketCap,
      'comments': comments?.map((e) => e.toJson()).toList(),
    };
  }
}

class Comments {
  int? id;
  String? title;
  String? content;
  String? createOn;
  int? stockId;
  String? appUserId;
  Appuser? appuser;

  Comments({
    this.id,
    this.title,
    this.content,
    this.createOn,
    this.stockId,
    this.appUserId,
    this.appuser,
  });

  factory Comments.fromJson(Map<String, dynamic> json) {
    return Comments(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      createOn: json['createOn'],
      stockId: json['stockId'],
      appUserId: json['appUserId'],
      appuser:
          json['appuser'] != null ? Appuser.fromJson(json['appuser']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'createOn': createOn,
      'stockId': stockId,
      'appUserId': appUserId,
      'appuser': appuser?.toJson(),
    };
  }
}

class Appuser {
  String? id;
  String? userName;
  String? email;

  Appuser({
    this.id,
    this.userName,
    this.email,
  });

  factory Appuser.fromJson(Map<String, dynamic> json) {
    return Appuser(
      id: json['id'],
      userName: json['userName'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'email': email,
    };
  }
}
