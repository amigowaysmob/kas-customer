import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ExpandableHtmlWidget extends HookWidget {
  final String? htmlContent;

  ExpandableHtmlWidget({required this.htmlContent});

  @override
  Widget build(BuildContext context) {
    final isExpanded = useState(false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Html(
          data: htmlContent,
          style: {
            "body": Style(
              
              maxLines: isExpanded.value ? null : 3, // Limit lines when collapsed
              textOverflow: isExpanded.value ? null : TextOverflow.ellipsis,
              fontSize: FontSize.medium,
            ),
          },
        ),
        GestureDetector(
          onTap: () {
            isExpanded.value = !isExpanded.value; // Toggle between expanded and collapsed
          },
          child: Text(
            isExpanded.value ? "View Less" : "View More",
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
