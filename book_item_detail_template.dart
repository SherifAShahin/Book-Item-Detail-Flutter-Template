import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ionicons/ionicons.dart';

Widget booksItemDetailBuilder({
  required BookModel model,
  required Function()? heartIconOnPressed,
  required Function()? archiveIconOnPressed,
  required Function()? shareIconOnPressed,
  double iconSize = 50.0,
  double imageWidth = 233.0,
  double imageHeight = 308.3,
  double titleFontSize = 28.0,
  double textFontSize = 25.0,
  double headingFontSize = 25.0,
  double ratingIconSize = 25.0,
  double initialRating = 3,
  double minRating = 1,
  String iconHexColor = '#045255',
  String noDescriptionMessage = 'there is no description to show now. check later',
  String ratingIconHexColor = '#045255',
  IconData heartIcon = Ionicons.heart_outline,
  IconData archiveIcon = Ionicons.archive_outline,
  IconData shareIcon = Ionicons.share_social_outline,
  IconData ratingIcon = Icons.star,
  BoxFit imageBoxFit = BoxFit.fill,
  FontWeight titleFontWeight = FontWeight.w700,
  FontWeight headingFontWeight = FontWeight.w700,
  FontWeight textFontWeight = FontWeight.w400,
  Color textColor = Colors.black,
}) => SingleChildScrollView(
  child: Container(
    width: double.infinity,
    margin: EdgeInsets.symmetric(
      horizontal: 15.0,
      vertical: 25.0,
    ),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.5),
      borderRadius: BorderRadius.circular(
        15.0,
      ),
    ),
    child: Padding(
      padding: EdgeInsets.all(
        20.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Image.network(
                model.image,
                fit: imageBoxFit,
                width: imageWidth,
                height: imageHeight,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children:
                  [
                    IconButton(
                      onPressed: heartIconOnPressed,
                      icon: Icon(
                        heartIcon,
                        size: iconSize,
                        color: HexColor(
                          iconHexColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    IconButton(
                      onPressed: archiveIconOnPressed,
                      icon: Icon(
                        archiveIcon,
                        size: iconSize,
                        color: HexColor(
                          iconHexColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    IconButton(
                      onPressed: shareIconOnPressed,
                      icon: Icon(
                        shareIcon,
                        size: iconSize,
                        color: HexColor(
                          iconHexColor,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            model.title,
            style: TextStyle(
                fontWeight: titleFontWeight,
                fontSize: titleFontSize,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          RichText(
              text: TextSpan(
                  children:
                  [
                    TextSpan(
                      text: "Author: ",
                      style: TextStyle(
                        fontWeight: headingFontWeight,
                        color: textColor,
                        fontSize: headingFontSize,
                      ),
                    ),
                    TextSpan(
                      text: model.author,
                      style: TextStyle(
                        fontWeight: textFontWeight,
                        color: textColor,
                        fontSize: textFontSize,
                      ),
                    )
                  ]
              )
          ),
          SizedBox(
            height: 10.0,
          ),
          RichText(
              text: TextSpan(
                  children:
                  [
                    TextSpan(
                      text: "Genre: ",
                      style: TextStyle(
                        fontWeight: headingFontWeight,
                        color: textColor,
                        fontSize: headingFontSize,
                      ),
                    ),
                    TextSpan(
                      text: model.genre,
                      style: TextStyle(
                        fontWeight: textFontWeight,
                        color: textColor,
                        fontSize: textFontSize,
                      ),
                    )
                  ]
              )
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "Description: ",
            style: TextStyle(
              fontWeight: headingFontWeight,
              color: textColor,
              fontSize: headingFontSize,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          ConditionalBuilder(
            condition: model.description == null,
            builder: (context) => Text(
              noDescriptionMessage,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontWeight: textFontWeight,
                color: textColor,
                fontSize: textFontSize,
              ),
            ),
            fallback: (context) => Text(
              model.description.toString(),
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontWeight: textFontWeight,
                color: textColor,
                fontSize: textFontSize,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children:
            [
              Text(
                'Rating: ',
                style: TextStyle(
                  fontWeight: headingFontWeight,
                  color: textColor,
                  fontSize: headingFontSize,
                ),
              ),
              RatingBar.builder(
                itemSize: ratingIconSize,
                initialRating: initialRating,
                minRating: minRating,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemBuilder: (context, index) => Icon(
                  ratingIcon,
                  color: HexColor(
                    ratingIconHexColor,
                  ),
                ),
                onRatingUpdate: (rating)
                {
                  print(rating);
                },
              ),
            ],
          ),
        ],
      ),
    ),
  ),
);
