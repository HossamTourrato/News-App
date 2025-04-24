import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/article.dart';

class ArticleWidget extends StatelessWidget {
  final ArticleEntity ? article;
  final void Function(ArticleEntity article) ? onArticlePressed;

  final List<ArticleEntity>? trendingArticles;
  const ArticleWidget({super.key, this.article, this.onArticlePressed, this.trendingArticles});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (){},
      child: Container(
        padding: const EdgeInsetsDirectional.only(start: 14, end: 14, bottom: 7, top: 7),
        height: MediaQuery.of(context).size.width / 2.2,
        child: Row(
          children: [
            buildImage(context),
            buildTitleAndDescription(),
          ],
        ),
      ),
    );
  }

  Widget buildImage(BuildContext context) {
    if (article?.urlToImage == null || article!.urlToImage!.isEmpty) {
      return  Padding(
        padding: const EdgeInsetsDirectional.only(end: 14),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            width: MediaQuery.of(context).size.width / 3,
            height: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.8),
            ),
            child: const Icon(Icons.error),
          ),
        ),
      );
    }
    return CachedNetworkImage(
        imageUrl: article!.urlToImage!,
        imageBuilder : (context, imageProvider) => Padding(
          padding: const EdgeInsetsDirectional.only(end: 14),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.8),
                  image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover
                  )
              ),
            ),
          ),
        ),
        progressIndicatorBuilder : (context, url, downloadProgress) => Padding(
          padding: const EdgeInsetsDirectional.only(end: 14),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              height: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.8),
              ),
              child: const CupertinoActivityIndicator(),
            ),
          ),
        ),
        errorWidget : (context, url, error) =>
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 14),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.8),
                  ),
                  child: const Icon(Icons.error),
                ),
              ),
            )
    );
  }

  Widget buildTitleAndDescription() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              article!.title?? '',
              maxLines : 3,
              overflow : TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 18,
                color: Colors.black87,
              ),
            ),

            // Description
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  article!.description ?? '',
                  overflow: TextOverflow.ellipsis,
                  maxLines : 1,
                ),
              ),
            ),

            // Datetime
            Row(
              children: [
                const Icon(Icons.timeline_outlined, size: 16),
                const SizedBox(width: 4),
                Text(
                  article!.publishedAt ?? '',
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}

