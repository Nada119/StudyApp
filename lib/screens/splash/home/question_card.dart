import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/configs/themes/custom_text_styles.dart';
import 'package:flutter_application_2/configs/themes/ui_parameters.dart';
import 'package:flutter_application_2/models/question_paper_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_application_2/widgets/app_icon_text.dart';
import 'package:get/get.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({Key? key, required this.model}) : super(key: key);

  final QuestionPaperModel model;

  @override
  Widget build(BuildContext context) {
    const double _padding = 10.0;
    return Padding(
      padding: const EdgeInsets.all(_padding),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ColoredBox(
                  //more effecient than container
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  child: SizedBox(
                    height: Get.width * 0.15,
                    width: Get.width * 0.15,
                    child: CachedNetworkImage(
                      imageUrl: model.imageUrl!,
                      placeholder: (context, url) => Container(
                        alignment: Alignment.center,
                        child: const CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) =>
                          Image.asset("assets/images/app_splash_logo.png"),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.title,
                      style: cardTitles(context),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 15),
                      child: Text(
                        model.description,
                      ),
                    ),
                    Row(
                      children: [
                        AppIconText(
                          icon: Icon(
                            Icons.help_outline_sharp,
                            color: Get.isDarkMode
                                ? Colors.white
                                : Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.3),
                          ),
                          text: Text(
                            '${model.questionCount}) questions',
                            style: detailText.copyWith(
                              color: Get.isDarkMode
                                  ? Colors.white
                                  : Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.3),
                            ),
                          ),
                        ), //const eb3t ; asmo w b3d kda copywith  ),
                        const SizedBox(
                          width: 15,
                        ),
                        AppIconText(
                          icon: Icon(
                            Icons.timer,
                            color: Get.isDarkMode
                                ? Colors.white
                                : Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.3),
                          ),
                          text: Text(
                            model.timeInMinits(),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}