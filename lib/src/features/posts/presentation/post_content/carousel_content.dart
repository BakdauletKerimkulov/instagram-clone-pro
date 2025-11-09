// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:instagram_clone_pro/src/constants/app_colors.dart';
import 'package:instagram_clone_pro/src/constants/app_duration.dart';
import 'package:instagram_clone_pro/src/constants/app_sizes.dart';
import 'package:instagram_clone_pro/src/features/posts/presentation/post_content/photo_content.dart';

const int maxDots = 5;

class CarouselContent extends StatefulWidget {
  const CarouselContent({super.key, required this.mediaUrls});
  final List<String> mediaUrls;

  @override
  State<CarouselContent> createState() => _CarouselContentState();
}

class _CarouselContentState extends State<CarouselContent> {
  late PageController pageController;
  late ScrollController scrollController;
  int _current = 0;

  static const double dotSpacing = 8.0;
  static const double dotSize = 6.0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    pageController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void _animateIndicatorScroll(int index) {
    final total = widget.mediaUrls.length;
    if (total <= maxDots) return;

    // Начальный индекс видимого окна
    final start = (index - (maxDots ~/ 2)).clamp(0, total - maxDots);

    final double itemWidth = dotSize + dotSpacing;

    final double targetOffset = start * itemWidth;

    scrollController.animateTo(
      targetOffset,
      duration: AppDuration.ms300,
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final total = widget.mediaUrls.length;

    return Stack(
      fit: StackFit.expand,
      children: [
        PageView.builder(
          onPageChanged: (index) {
            setState(() {
              _current = index;
            });

            _animateIndicatorScroll(index);
          },
          itemCount: widget.mediaUrls.length,
          itemBuilder: (context, index) {
            final mediaUrl = widget.mediaUrls[index];
            return PhotoContent(mediaUrl: mediaUrl);
          },
        ),

        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: Sizes.p16),
            child: SizedBox(
              width:
                  maxDots *
                  (dotSize +
                      dotSpacing), //Примерная ширина для отображения 5 индикаторов
              child: SingleChildScrollView(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(total, (index) {
                    bool active = _current == index;
                    return AnimatedContainer(
                      duration: AppDuration.ms300,
                      width: active ? Sizes.p8 : Sizes.p6,
                      height: active ? Sizes.p8 : Sizes.p6,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: active
                            ? AppColors.carouselIndicatorActiveColor
                            : AppColors.carouselIndicatorDisabledColor,
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
