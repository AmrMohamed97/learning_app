import 'package:flutter/material.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';

class ExpandableText extends StatefulWidget {
  const ExpandableText({
    super.key,
    required this.text,
    this.maxWords = 25,
    this.textStyle,
    this.linkStyle,
  });

  final String text;
  final int maxWords;
  final TextStyle? textStyle;
  final TextStyle? linkStyle;

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;

  // تقسيم النص إلى كلمات
  List<String> _getWords() {
    return widget.text.trim().split(RegExp(r'\s+'));
  }

  // التحقق من أن النص يحتاج للاختصار
  bool _needsTruncation() {
    return _getWords().length > widget.maxWords;
  }

  // الحصول على النص المختصر
  String _getTruncatedText() {
    if (!_needsTruncation()) return widget.text;

    final words = _getWords();
    final truncatedWords = words.take(widget.maxWords).toList();
    return '${truncatedWords.join(' ')}...';
  }

  @override
  Widget build(BuildContext context) {
    final needsTruncation = _needsTruncation();

    if (!needsTruncation) {
      return Text(
        widget.text,
        style:
            widget.textStyle ??
            AppTextStyle.font14Regular.copyWith(
              color: Colors.grey.shade700,
              height: 1.6,
            ),
      );
    }

    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: RichText(
        text: TextSpan(
          style:
              widget.textStyle ??
              AppTextStyle.font14Regular.copyWith(
                color: Colors.grey.shade700,
                height: 1.6,
              ),
          children: [
            TextSpan(text: _isExpanded ? widget.text : _getTruncatedText()),
            const TextSpan(text: ' '),
            WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                child: Text(
                  _isExpanded ? 'عرض أقل' : 'عرض المزيد',
                  style:
                      widget.linkStyle ??
                      AppTextStyle.font14Regular.copyWith(
                        color: MyColors.purpleNormal,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget للكارد الكامل مثل الصورة
class DescriptionCard extends StatelessWidget {
  const DescriptionCard({
    super.key,
    required this.title,
    required this.description,
    this.maxWords = 25,
  });

  final String title;
  final String description;
  final int maxWords;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyle.font16Regular.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 3),
          ExpandableText(text: description, maxWords: maxWords),
        ],
      ),
    );
  }
}

// مثال على الاستخدام:

// 1. استخدام ExpandableText مباشرة:
// ExpandableText(
//   text: 'نصك الطويل هنا...',
//   maxWords: 25,
// )

// 2. استخدام DescriptionCard الكامل:
// DescriptionCard(
//   title: 'وصف المادة',
//   description: 'ابدأ رحلتك في تصميم واجهات وتجربة المستخدم (UI/UX) باستخدام Figma من الأساسيات وحتى تنفيذ مشاريع واقعية خطوة بخطوة...',
//   maxWords: 25,
// )
