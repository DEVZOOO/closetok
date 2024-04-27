import 'package:closetok/src/constants/gaps.dart';
import 'package:closetok/src/constants/sizes.dart';
import 'package:closetok/src/features/videos/models/comment_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// 댓글화면
class Comments extends StatefulWidget {
  const Comments({super.key});

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  final TextEditingController _controller = TextEditingController();

  final List<Comment> commentsList = [
    Comment(
      id: '0',
      uid: 'ramdon',
      name: 'Judy',
      text: '엄청엄ㅊ어엄청 엄청엄ㅊ어엄청 엄청엄ㅊ어엄청 엄청엄ㅊ어엄청 엄청엄ㅊ어엄청 긴 댓글이다!',
      date: '2024-04-26',
      like: 10,
    ),
    Comment(
      id: '0',
      uid: 'ramdon',
      name: 'Judy',
      text: '엄청엄ㅊ어엄청 엄청엄ㅊ어엄청 엄청엄ㅊ어엄청 엄청엄ㅊ어엄청 엄청엄ㅊ어엄청 긴 댓글이다!',
      date: '2024-04-26',
      like: 10,
    ),
    Comment(
      id: '0',
      uid: 'ramdon',
      name: 'Judy',
      text: '엄청엄ㅊ어엄청 엄청엄ㅊ어엄청 엄청엄ㅊ어엄청 엄청엄ㅊ어엄청 엄청엄ㅊ어엄청 긴 댓글이다!',
      date: '2024-04-26',
      like: 10,
    ),
    Comment(
      id: '0',
      uid: 'ramdon',
      name: 'Judy',
      text: '엄청엄ㅊ어엄청 엄청엄ㅊ어엄청 엄청엄ㅊ어엄청 엄청엄ㅊ어엄청 엄청엄ㅊ어엄청 긴 댓글이다!',
      date: '2024-04-26',
      like: 10,
    ),
    Comment(
      id: '0',
      uid: 'ramdon',
      name: 'Judy',
      text: '엄청엄ㅊ어엄청 엄청엄ㅊ어엄청 엄청엄ㅊ어엄청 엄청엄ㅊ어엄청 엄청엄ㅊ어엄청 긴 댓글이다!',
      date: '2024-04-26',
      like: 10,
    ),
    Comment(
      id: '0',
      uid: 'ramdon',
      name: 'Judy',
      text: '엄청엄ㅊ어엄청 엄청엄ㅊ어엄청 엄청엄ㅊ어엄청 엄청엄ㅊ어엄청 엄청엄ㅊ어엄청 긴 댓글이다!',
      date: '2024-04-26',
      like: 10,
    ),
    Comment(
      id: '0',
      uid: 'ramdon',
      name: 'Judy',
      text: '엄청엄ㅊ어엄청 엄청엄ㅊ어엄청 엄청엄ㅊ어엄청 엄청엄ㅊ어엄청 엄청엄ㅊ어엄청 긴 댓글이다!',
      date: '2024-04-26',
      like: 10,
    ),
    Comment(
      id: '0',
      uid: 'ramdon',
      name: 'Judy',
      text: '엄청엄ㅊ어엄청 엄청엄ㅊ어엄청 엄청엄ㅊ어엄청 엄청엄ㅊ어엄청 엄청엄ㅊ어엄청 긴 댓글이다!',
      date: '2024-04-26',
      like: 10,
    ),
    Comment(
      id: '0',
      uid: 'ramdon',
      name: 'Judy',
      text: '엄청엄ㅊ어엄청 엄청엄ㅊ어엄청 엄청엄ㅊ어엄청 엄청엄ㅊ어엄청 엄청엄ㅊ어엄청 긴 댓글이다!',
      date: '2024-04-26',
      like: 10,
    ),
  ];

  bool _isWriting = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _isWriting = _controller.text != "";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      clipBehavior: Clip.hardEdge,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * .8,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Sizes.size12),
          topRight: Radius.circular(Sizes.size12),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '${commentsList.length} comments',
            style: TextStyle(
              fontSize: theme.textTheme.titleMedium?.fontSize,
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: const [CloseButton()],
          backgroundColor: theme.dividerColor,
          scrolledUnderElevation: 0, // 스크롤시 색상 변경하지 않음
        ),
        backgroundColor: theme.dividerColor,
        body: Scrollbar(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size12),
            itemCount: commentsList.length,
            itemBuilder: (context, index) {
              final comment = commentsList[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: Sizes.size12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 프사
                          CircleAvatar(
                            radius: Sizes.size20,
                            // dummy image
                            foregroundImage: const NetworkImage(
                                "https://avatars.githubusercontent.com/u/104175767?v=4"),
                            backgroundColor: theme.primaryColor,
                            child: Text(
                              comment.name,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),

                          Gaps.h10,

                          // 댓글정보
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // 닉네임
                                Text(
                                  comment.name,
                                  style: theme.textTheme.labelLarge?.copyWith(
                                    color: theme.secondaryHeaderColor,
                                  ),
                                ),

                                // 내용
                                Text('$index ${comment.text}'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Gaps.h10,

                    // 좋아요
                    Column(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.heart,
                          size: Sizes.size20,
                          color: theme.secondaryHeaderColor,
                        ),
                        Text(
                          '${comment.like}',
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: theme.secondaryHeaderColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => Gaps.v6,
          ),
        ),

        // 댓글입력
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(
            top: Sizes.size12,
            left: Sizes.size12,
            right: Sizes.size12,
            bottom: Sizes.size12 + MediaQuery.of(context).viewInsets.bottom,
          ),
          color: theme.colorScheme.background,
          child: Row(
            children: [
              // 프사
              CircleAvatar(
                radius: Sizes.size24,
                // dummy image
                foregroundImage: const NetworkImage(
                    "https://avatars.githubusercontent.com/u/104175767?v=4"),
                backgroundColor: theme.primaryColor,
                child: Text(
                  "Judy",
                  style: theme.textTheme.bodyMedium,
                ),
              ),

              Gaps.h8,

              // text
              Expanded(
                child: SizedBox(
                  height: 48,
                  child: TextField(
                    controller: _controller,
                    cursorColor: theme.primaryColor,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Sizes.size10),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: theme.dividerColor,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: Sizes.size12),
                      hintText: 'Add comment...',
                      hintStyle: TextStyle(
                        color: theme.secondaryHeaderColor,
                        fontWeight: FontWeight.normal,
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: Sizes.size12),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.faceSmile,
                              color: theme.primaryColor,
                              size: Sizes.size20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    expands: true,
                    minLines: null,
                    maxLines: null,
                  ),
                ),
              ),

              Gaps.h8,

              // send
              Container(
                decoration: BoxDecoration(
                  color: _isWriting ? theme.primaryColor : theme.disabledColor,
                  borderRadius: BorderRadius.circular(Sizes.size52),
                ),
                padding: const EdgeInsets.all(Sizes.size9),
                child: FaIcon(
                  FontAwesomeIcons.paperPlane,
                  size: Sizes.size20,
                  color: _isWriting ? Colors.white : theme.dividerColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
