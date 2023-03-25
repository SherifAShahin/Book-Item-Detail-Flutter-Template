import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ionicons/ionicons.dart';

Widget bookItemBuilder({
  required BookModel model,
  double margin = 15.0,
  double opacity = 0.5,
  double radius = 15.0,
  double titleFontSize = 25.0,
  double authorFontSize = 20.0,
  double bookGenreFontSize = 20.0,
  double iconSize = 25.0,
  double initialRating = 3,
  double minRating = 1,
  String hexColor = '#045255',
  Color fontColor = Colors.white,
  Color iconColor = Colors.amber,
  FontWeight fontWeight = FontWeight.w300,
  IconData icon = Icons.star,
}) => Padding(
  padding: const EdgeInsets.only(
    top: 27.0,
  ),
  child: Container(
    height: 202.0,
    width: double.infinity,
    padding: EdgeInsetsDirectional.all(
      20.0,
    ),
    margin: EdgeInsetsDirectional.symmetric(
      horizontal: margin,
    ),
    decoration: BoxDecoration(
      color: HexColor(
        hexColor,
      ).withOpacity(opacity),
      borderRadius: BorderRadius.circular(
        radius,
      ),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
      [
        Image.network(
          model.image,
          fit: BoxFit.fill,
          width: 115.6,
        ),
        SizedBox(
          width: 21.4,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: TextStyle(
                  color: fontColor,
                  fontWeight: fontWeight,
                  fontSize: titleFontSize,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 5.0,
                ),
                child: Text(
                  model.author,
                  style: TextStyle(
                    color: fontColor,
                    fontWeight: fontWeight,
                    fontSize: authorFontSize,
                  ),
                ),
              ),
              SizedBox(
                height: 2.0,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 5.0,
                ),
                child: Text(
                  model.genre,
                  style: TextStyle(
                    color: fontColor,
                    fontWeight: fontWeight,
                    fontSize: bookGenreFontSize,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: RatingBar.builder(
                    itemSize: iconSize,
                    initialRating: initialRating,
                    minRating: minRating,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemBuilder: (context, index) => Icon(
                      icon,
                      color: iconColor,
                    ),
                    onRatingUpdate: (rating)
                    {
                      print(rating);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  ),
);

Widget bookItemListBuilder({
  required List<BookModel> model,
  double margin = 15.0,
  double opacity = 0.5,
  double radius = 15.0,
  double titleFontSize = 25.0,
  double authorFontSize = 20.0,
  double bookGenreFontSize = 20.0,
  double iconSize = 25.0,
  double initialRating = 3,
  double minRating = 1,
  String hexColor = '#045255',
  Color fontColor = Colors.white,
  Color iconColor = Colors.amber,
  FontWeight fontWeight = FontWeight.w300,
  IconData icon = Icons.star,
}) => ListView.builder(
  itemBuilder: (context, index) => MaterialButton(
    padding: EdgeInsetsDirectional.all(
      0.0,
    ),
    onPressed: ()
    {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GitHubScreen2(model[index]),
        ),
      );
    },
    child: bookItemBuilder(
      model: model[index],
      minRating: minRating,
      titleFontSize: titleFontSize,
      radius: radius,
      opacity: opacity,
      initialRating: initialRating,
      iconColor: iconColor,
      fontColor: fontColor,
      bookGenreFontSize: bookGenreFontSize,
      authorFontSize: authorFontSize,
      icon: icon,
      fontWeight: fontWeight,
      iconSize: iconSize,
      hexColor: hexColor,
      margin: margin,
    ),
  ),
  itemCount: model.length,
);

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
