/// 댓글 DTO
class Comment {
  /// PK
  final String id;

  /// 작성자 id
  final String uid;

  /// 작성자 name
  final String name;

  /// 작성내용
  final String text;

  /// 작성일시
  final String date;

  /// 좋아요 수
  final int like;

  Comment({
    required this.id,
    required this.uid,
    required this.name,
    required this.text,
    required this.date,
    required this.like,
  });
}
