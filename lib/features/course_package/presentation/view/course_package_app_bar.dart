import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:talamiz_arina/features/teacher_profile/presentation/view/video_viewer.dart';

class CoursePackageAppBar extends StatefulWidget {
  const CoursePackageAppBar({
    super.key,
    required this.video,
    required this.onFavorite,
  });
  final String video;
  final void Function() onFavorite;

  @override
  State<CoursePackageAppBar> createState() => _CoursePackageAppBarState();
}

class _CoursePackageAppBarState extends State<CoursePackageAppBar> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(
        context,
      ).colorScheme.onSecondary, // Color(0xffF7F7F7),
      automaticallyImplyLeading: false,
      leading: Padding(
        padding: const EdgeInsetsDirectional.only(start: 8.0),
        child: AppBarItem(
          onPressed: () {
            context.pop();
          },
          child: const Icon(
            Icons.arrow_back_ios_sharp,
            size: 22,
            color: Colors.white,
          ),
        ),
      ),
      actions: [
        CupertinoButton(
          padding: EdgeInsets.zero,
          minimumSize: Size.zero,
          onPressed: () {
            setState(() {
              isFavorite = !isFavorite;
            });
            widget.onFavorite();
          },
          child: AppBarItem(
            child: Icon(
              Icons.favorite,
              color: isFavorite ? Colors.red : Colors.white,
              size: 22,
            ),
          ),
        ),
        CupertinoButton(
          onPressed: () async {
            // final result =
            await SharePlus.instance.share(ShareParams(text: widget.video));

            // if (result.status == ShareResultStatus.success) {
            //   if (context.mounted) {
            //     UiHelper.showSnakBar(
            //       context: context,
            //       message: AppLocalizations.of(context)!.shareSuccess,
            //       type: MotionToastType.success,
            //     );
            //   }
            // }
          },
          padding: EdgeInsets.zero,
          minimumSize: Size.zero,
          child: const AppBarItem(
            child: Icon(Icons.share, color: Colors.white, size: 25),
          ),
        ),
      ],
      pinned: true,
      elevation: 0,
      expandedHeight: MediaQuery.of(context).size.height * 0.35, //230,
      stretch: true,
      toolbarHeight: 55,
      flexibleSpace: FlexibleSpaceBar(
        // titlePadding: const EdgeInsetsDirectional.only(start: 16, bottom: 12),
        background: SafeArea(
          bottom: false,
          child: UniversalVideoViewer(videoUrl: widget.video),
          // Container(
          //   color: Theme.of(
          //     context,
          //   ).colorScheme.onSecondary, // Color(0xffF7F7F7),
          //   child: Image.asset(
          //     Assets.assetsImagesPngProfileVideo,
          //     fit: BoxFit.cover,
          //   ),
          // ),
        ),
        // title: const SizedBox(),
        stretchModes: const [
          StretchMode.fadeTitle,
          StretchMode.blurBackground,
          StretchMode.zoomBackground,
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(25),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, -2),
                blurRadius: 5,
                color: Theme.of(context).colorScheme.shadow,
                spreadRadius: -5,
              ),
            ],
            color: Colors.white,
            borderRadius: const BorderRadiusDirectional.only(
              topEnd: Radius.circular(26),
              topStart: Radius.circular(26),
            ),
          ),
          height: 25,
        ),
      ),
    );
  }
}

class AppBarItem extends StatelessWidget {
  const AppBarItem({super.key, this.child, this.onPressed});
  final Widget? child;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      minimumSize: Size.zero,
      padding: const EdgeInsetsDirectional.only(end: 10),
      onPressed: onPressed,
      child: Center(
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: .35),
            shape: BoxShape.circle,
          ),
          child: child,
        ),
      ),
    );
  }
}
