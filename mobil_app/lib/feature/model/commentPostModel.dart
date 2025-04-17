class CommentPostModel {
  final String title;
  final String content;
  final int stockId;

  CommentPostModel({
    required this.title,
    required this.content,
    required this.stockId,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'stockId': stockId,
    };
  }
}
