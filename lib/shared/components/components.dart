import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/web_view/web_view_screen.dart';

Widget buildArticleItem(article, context) => InkWell(
  onTap: ()
  {
      navigateTo(context, WebViewScreen(article['url']));
  },
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children:
      [
        Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: NetworkImage(
                  "${article['urlToImage'] ?? "https://firebasestorage.googleapis.com/v0/b/courseflutter-2d8c3.appspot.com/o/Images%2Fblack_Pic.PNG?alt=media&token=09e445c5-7cb8-4d99-9e13-f99ead7a8844"}"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Container(
            height: 120.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                Expanded(
                  child: Text(
                    '${article['title']}',
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '${article['publishedAt']}',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ),
);

Widget mySeparator() => Padding(
padding: const EdgeInsetsDirectional.only(start: 20.0),
child: Container(
width: double.infinity,
height: 1.0,
color: Colors.grey[300],
),
);

Widget articleBuilder(list, context, {isSearch = false}) => ConditionalBuilder(
  condition: list.length > 0,
  builder: (context) => ListView.separated(
    physics: const BouncingScrollPhysics(),
    itemBuilder: (context, index) => buildArticleItem(list[index], context),
    separatorBuilder: (context, index) => mySeparator(),
    itemCount: list.length,
  ),
  fallback: (context) => isSearch ? Container() : const Center(child: CircularProgressIndicator()),
);

Widget defaultFormField({
  required TextEditingController controller,
  TextInputType? type,
  bool isPassword = false,
  VoidCallback? onTap,
  void Function(String)? onChange,
  final FormFieldValidator<String>? validate,
  required String labelText,
  required IconData? prefixIcon,
  IconData? suffixIcon,
}) => TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: Icon(suffixIcon),
      ),
    );

void navigateTo(context, widget)
{
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget)
);
}