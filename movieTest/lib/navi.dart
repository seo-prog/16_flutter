import 'package:flutter/material.dart';

// 영화 등록
class AddMovie extends StatefulWidget {
  const AddMovie(this.list, {
    super.key, required this.changeIndex,
  });

  final void Function(int index) changeIndex;
  final List<Map<String, String>> list;

  @override
  State<AddMovie> createState() => _AddMovieState();
}

class _AddMovieState extends State<AddMovie> {
  final inputTitle = TextEditingController();
  final inputMaker = TextEditingController();
  final inputDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('영화 등록'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: inputTitle,
              decoration: const InputDecoration(labelText: "영화 제목을 입력해주세요"),
            ),
            TextField(
              controller: inputMaker,
              decoration: const InputDecoration(labelText: "영화 감독을 입력해주세요"),
            ),
            TextField(
              controller: inputDescription,
              decoration: const InputDecoration(labelText: "설명을 입력해주세요"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (inputTitle.text.isEmpty ||
                    inputMaker.text.isEmpty ||
                    inputDescription.text.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("입력 오류"),
                        content: const Text("모든 필드를 입력해주세요."),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("확인"),
                          ),
                        ],
                      );
                    },
                  );
                  return;
                }

                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("등록하시겠습니까?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("취소"),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              // 영화 등록
                              widget.list.add({
                                'title': inputTitle.text,
                                'maker': inputMaker.text,
                                'description': inputDescription.text,
                              });

                              // 필드 초기화
                              inputTitle.clear();
                              inputMaker.clear();
                              inputDescription.clear();
                            });

                            Navigator.pop(context);
                            widget.changeIndex(0);  // 영화 리스트 페이지로 이동
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("영화가 등록되었습니다!"),
                              ),
                            );
                          },
                          child: const Text("등록"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text("등록"),
            ),
          ],
        ),
      ),
    );
  }
}


// 영화 검색

class FindMovie extends StatefulWidget {
  const FindMovie(this.list, {super.key});

  final List<Map<String, String>> list;

  @override
  State<FindMovie> createState() => _FindMovieState();
}

class _FindMovieState extends State<FindMovie> {
  final  _inputTitle = TextEditingController();
  List<Map<String, String>> _searchResults = [];

  void _onSearch(String query) {
    setState(() {
      _searchResults = widget.list
          .where((movie) =>
      movie['title'] != null && movie['title']!.contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _inputTitle,
          decoration: const InputDecoration(
            labelText: "영화 검색",
            hintText: "영화 제목을 입력하세요",
            border: OutlineInputBorder(),
          ),
          onSubmitted: _onSearch,
        ),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              _onSearch(_inputTitle.text); // 검색 버튼으로 검색
            },
            child: const Text("검색"),
          ),
          Expanded(
            child: _searchResults.isNotEmpty
                ? ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                final movie = _searchResults[index];
                return ListTile(
                  title: Text(movie['title'] ?? '제목 없음'),
                  subtitle: Text(movie['description'] ?? '설명 없음'),
                );
              },
            )
                : const Center(
              child: Text("검색 결과가 없습니다."),
            ),
          ),
        ],
      ),
    );
  }
}



// 영화 목록
class MovieList extends StatelessWidget {
  const MovieList(this.list, {super.key});

  final List<Map<String, String>> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        final movie = list[index];
        return ListTile(
          title: Text(movie['title'] ?? '제목 없음'),
          subtitle: Text(movie['maker'] ?? '감독 없음'),
        );
      },
    );
  }
}


// 목록 상세
class DetailPage extends StatelessWidget {

  final String title;
  final String description;

  const DetailPage({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Padding(padding: EdgeInsets.all(16),
          child: Text(
            description,
            style: TextStyle(fontSize: 20),
          ),
        ));
  }
}



