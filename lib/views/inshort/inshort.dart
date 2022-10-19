// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import 'NewsCards.dart';
import 'NewsDummy.dart';
import 'NewsModal.dart';

// ignore: use_key_in_widget_constructors
class InShort extends StatefulWidget {

  @override
  // ignore: library_private_types_in_public_api
  _InShortState createState() => _InShortState();
}

class _InShortState extends State<InShort> {
  int index = 0;
  late NewsModal newsModal;

  @override
  void initState() {
    fetchData();
    setupLastIndex();
    super.initState();
  }

  fetchData() {
    newsModal = NewsModal.fromJson(newsDummy);
  }

  void updateIndex(newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  void setupLastIndex() async {}

  void updateContent(direction) {
    if (index <= 0 && direction == DismissDirection.down) {
      index = newsModal.result.length - 1;
    } else if (index == newsModal.result.length - 1 &&
        direction == DismissDirection.up) {
      index = 0;
    } else if (direction == DismissDirection.up) {
      index++;
    } else {
      index--;
    }
    updateIndex(index);
  }

  String getShareText() {
    return "${newsModal.result[index].title}\n${newsModal.result[index].url}";
  }

  Widget newsCard(int index) {
    return NewsCard(
      imgUrl: newsModal.result[index].urlToImage,
      primaryText: newsModal.result[index].title,
      secondaryText: newsModal.result[index].description,
      sourceName: newsModal.result[index].sourceName,
      author: newsModal.result[index].author,
      publishedAt: newsModal.result[index].publishedAt,
      url: newsModal.result[index].url,
    );
  }

  @override
  Widget build(BuildContext context) {
    int prevIndex = index <= 0 ? 0 : index - 1;
    int nextIndex = index == newsModal.result.length - 1 ? 0 : index + 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text('News.ly'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            onPressed: fetchData,
          ),
          IconButton(
            icon: const Icon(
              Icons.share,
              color: Colors.white,
            ),
            onPressed: () {
              Share.share(getShareText());
            },
          )
        ],
      ),
      body: Center(
        child: Dismissible(
          background: newsCard(prevIndex),
          secondaryBackground: newsCard(nextIndex),
          resizeDuration: const Duration(milliseconds: 10),
          key: Key(index.toString()),
          direction: DismissDirection.vertical,
          onDismissed: (direction) {
            updateContent(direction);
          },
          child: newsCard(index),
        ),
      ),
    );
  }
}
