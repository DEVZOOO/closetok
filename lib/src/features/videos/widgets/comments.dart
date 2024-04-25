import 'package:closetok/src/constants/gaps.dart';
import 'package:closetok/src/constants/sizes.dart';
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * .7, // 전체화면의 70%까지만
      ),
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Sizes.size12),
          topRight: Radius.circular(Sizes.size12),
        ),
      ),
      child: Stack(
        children: [
          const Positioned(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [],
            ),
          ),

          // input
          Positioned(
            bottom: 0,
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: theme.dividerColor,
                  ),
                ),
              ),
              child: Row(
                children: [
                  // text
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Sizes.size10),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: theme.dividerColor,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: Sizes.size12),
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

                  Gaps.h12,

                  // send
                  Container(
                    decoration: BoxDecoration(
                      color: theme.disabledColor,
                      borderRadius: BorderRadius.circular(Sizes.size52),
                    ),
                    padding: const EdgeInsets.all(Sizes.size5),
                    child: FaIcon(
                      FontAwesomeIcons.plane,
                      size: Sizes.size20,
                      color: theme.dividerColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // child: Scaffold(
      //   resizeToAvoidBottomInset: false,
      //   // backgroundColor: theme.dividerColor,
      //   appBar: AppBar(
      //     title: Text(
      //       '22796 comments',
      //       style: theme.textTheme.titleMedium,
      //     ),
      //     centerTitle: true,
      //     automaticallyImplyLeading: false,
      //     actions: const [CloseButton()],
      //   ),
      //   body: ,
      // ),
    );
  }
}
