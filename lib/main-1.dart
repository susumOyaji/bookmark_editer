import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Bookmark {
  String title;
  String url;

  Bookmark(this.title, this.url);
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Bookmark> bookmarks = []; // ブックマークリスト

  // ブックマークを追加する関数
  void addBookmark(String title, String url) {
    setState(() {
      bookmarks.add(Bookmark(title, url));
    });
  }

  // ブックマークを編集する関数
  void editBookmark(int index, String title, String url) {
    setState(() {
      bookmarks[index] = Bookmark(title, url);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ブックマークエディタ'),
        ),
        body: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // ブックマークを追加するダイアログを表示
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('ブックマークを追加'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TextField(
                            decoration: InputDecoration(labelText: 'タイトル'),
                            onChanged: (value) {
                              // タイトルを入力
                            },
                          ),
                          TextField(
                            decoration: InputDecoration(labelText: 'URL'),
                            onChanged: (value) {
                              // URLを入力
                            },
                          ),
                        ],
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('キャンセル'),
                        ),
                        TextButton(
                          onPressed: () {
                            // ブックマークを追加
                            addBookmark('タイトル', 'URL');
                            Navigator.of(context).pop();
                          },
                          child: Text('追加'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('ブックマークを追加'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: bookmarks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(bookmarks[index].title),
                    subtitle: Text(bookmarks[index].url),
                    onTap: () {
                      // ブックマークを編集するダイアログを表示
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('ブックマークを編集'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                TextField(
                                  controller: TextEditingController(text: bookmarks[index].title),
                                  decoration: InputDecoration(labelText: 'タイトル'),
                                  onChanged: (value) {
                                    // タイトルを編集
                                  },
                                ),
                                TextField(
                                  controller: TextEditingController(text: bookmarks[index].url),
                                  decoration: InputDecoration(labelText: 'URL'),
                                  onChanged: (value) {
                                    // URLを編集
                                  },
                                ),
                              ],
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('キャンセル'),
                              ),
                              TextButton(
                                onPressed: () {
                                  // ブックマークを編集
                                  editBookmark(index, 'タイトル', 'URL');
                                  Navigator.of(context).pop();
                                },
                                child: Text('保存'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
