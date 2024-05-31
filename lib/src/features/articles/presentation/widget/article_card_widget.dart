
import 'package:flutter/material.dart';

import '../../domain/models/article_model.dart';

class ArticleCardWidget extends StatefulWidget {
  final ArticleModel nyTimesModel;

  const ArticleCardWidget({Key? key, required this.nyTimesModel})
      : super(key: key);

  @override
  State<ArticleCardWidget> createState() => _ArticleCardWidgetState();
}

class _ArticleCardWidgetState extends State<ArticleCardWidget> {
  String? smallImageUrl;
  String? bigImageUrl;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   
    if (widget.nyTimesModel.media != null &&
        widget.nyTimesModel.media!.isNotEmpty) {
      if (widget.nyTimesModel.media!.first.mediaMetadata != null &&
          widget.nyTimesModel.media!.first.mediaMetadata!.isNotEmpty) {
        smallImageUrl =
            widget.nyTimesModel.media!.first.mediaMetadata!.first.url;
      }
    }

  
    if (widget.nyTimesModel.media != null &&
        widget.nyTimesModel.media!.isNotEmpty) {
      if (widget.nyTimesModel.media!.last.mediaMetadata != null &&
          widget.nyTimesModel.media!.last.mediaMetadata!.isNotEmpty) {
        bigImageUrl = widget.nyTimesModel.media!.last.mediaMetadata!.last.url;
      }
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Circle Avatar
          if (smallImageUrl != null) ...{
            Hero(
              tag: bigImageUrl!,
              child: GestureDetector(
                onTap: () {
                  
                },
          
              ),
            )
          } else ...{
            SizedBox(
              width: 70,
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 40,
              ),
            )
          },

          // Space
          SizedBox(
            width: 70,
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Title
                Text(
                  widget.nyTimesModel.title ?? "defaultStr",
                  style: TextStyle(
        fontSize: 10,
        color: Colors.grey[300],
      ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),

                // Space
                SizedBox(
                  height: 200,
                ),

                Text(
                  widget.nyTimesModel.articleModelAbstract ?? "defaultStr",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.grey),
                ),

                // Space
                SizedBox(
                  height: 5,
                ),

                // Published date
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 15,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      child: Text(
                        widget.nyTimesModel.publishedDate.toString() ?? "defaultStr",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Colors.grey),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

    
        ],
      ),
    );
  }
}
