import 'package:flutter/material.dart';
import 'package:news_app/modules/webview/webview.dart';

Widget defaultFormField(
    {required controller,
    required label,
    required keyType,
    required validate,
    required prefix,
    isPassword = false,
    suffix,
    function,
    onsubmit,
    onchange,
    readOnly = false,
    onTap}) {
  return TextFormField(
    onTap: onTap,
    readOnly: readOnly,
    onFieldSubmitted: onsubmit,
    onChanged: onchange,
    keyboardType: keyType,
    controller: controller,
    decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        prefixIcon: Icon(prefix),
        suffixIcon: suffix == null
            ? null
            : IconButton(
                onPressed: function,
                icon: Icon(suffix),
              )),
    validator: validate,
    obscureText: isPassword,
  );
}

Widget buildArticleItem({required article, required context}) {
  return InkWell(
    onTap: () {
      navigateTo(context, WebViewScreen(article['url']));
    },
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: article['urlToImage'] != null
                        ? NetworkImage('${article['urlToImage']}')
                        : const NetworkImage(
                            'https://thumbs.dreamstime.com/b/transparent-photoshop-psd-png-seamless-grid-pattern-background-transparent-photoshop-psd-png-seamless-grid-pattern-background-grey-175598426.jpg'),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${article['title']}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 14),
                      textAlign: TextAlign.end,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '${article['publishedAt']}',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[400],
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildSeparator() {
  return Container(
    color: Colors.grey,
    width: double.infinity,
    height: 1,
  );
}

void navigateTo(context, widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

Widget articleBuilder(list, context, [isSearch = false]) {
  return list.length != 0
      ? ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return buildArticleItem(article: list[index], context: context);
          },
          separatorBuilder: (context, index) {
            return buildSeparator();
          },
          itemCount: list.length)
      : isSearch == false
          ? const Center(child: CircularProgressIndicator())
          : Container();
}
