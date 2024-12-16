import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:permission_handler/permission_handler.dart';

// 연락처를 불러와서 뿌려줘야하니까 stateful
class ContextsPage extends StatefulWidget {
  const ContextsPage({super.key});

  @override
  State<ContextsPage> createState() => _ContextsPageState();
}

class _ContextsPageState extends State<ContextsPage> {
  // 연락처를 저장할 리스트
  List<Contact> _contacts = [];

  // 위젯이 호출되고 제일 먼저 실행될 메소드 (이 위젯이 활성화될 때 가장 먼저 실행)
  @override
  void initState() {
    super.initState(); // 제대로 실행시키기 위해 부모의 init 을 실행시켜야 한다.
    _checkPermissionAndFetchContacts();
  }

  // 권한 체크 및 연락처 가져오는 메소드
  // flutter 에서 async await (비동기함수)를 사용하려면 반환타입을 futuer 로 반드시 해야함!
  Future<void> _checkPermissionAndFetchContacts() async {
    // 연락처 접근 권한 요청
    PermissionStatus permission = await Permission.contacts.request(); // 비동기
    // 우리가 권한을 답해줄 때 까지 기다린다.

    // 권한 허용 여부 체크
    if (permission.isGranted) {
      _getContacts();
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("연락처 권한이 필요합니다")));
    }
  }

  // 연락처를 실제로 가져오는 메소드
  Future<void> _getContacts() async {
    try {
      /*
      * 연락처 가져 오기
      * var contacts = await FlutterContacts.getContacts();
      * - 그런데 연락처에 저장된 썸네일 이미지나 다른 정보들까지 다 가져오몀
      * 너무 느리기 때문에 이름과 전화번호 같은 properties 만 가졍오게 설정함.
      *
      * */
      final contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: false);

      setState(() {
        _contacts = contacts; // 가져온 연락처 데이터를 저장함.
        // .
      });
    } catch (e) {
      print("연락처를 가져오는 중 오류 발생 : $e");
    }
  }

  // 연락처 추가를 위한 다이얼로그 메소드
  void _showAddContactDialog() {
    String name = ''; // 새 연락처 이름
    String phone = ''; // 새 연락처 전화번호

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("새 연락처 추가"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: "이름"),
                  onChanged: (value) {
                    name = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: "전화번호 "),
                  keyboardType: TextInputType.phone, // 전화번호 입력 모드
                  onChanged: (value) {
                    phone = value;
                  },
                )
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("취소")),
              TextButton(
                  onPressed: () {
                    if (name.isNotEmpty && phone.isNotEmpty) {
                      _addContact(name, phone);
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("이름과 전화번호를 모두 입력해주세요. "),
                      ));
                    }
                  },
                  child: Text("등록"))
            ],
          );
        });
  }

  Future<void> _addContact(String name, String phone) async {
    // 연락처 저장 권한 확인
    if (await FlutterContacts.requestPermission()) {
      // 그냥 여기 우리가 가지고 온 값 넣어줄라고 불러온거다.
      final newContact = Contact() // Contact 안에 속성들을 ..으로 불러오는것
        ..name.first = name
        ..phones = [
          Phone(phone)
        ]; // phones 의 자료형은 기본적으로 list 기 때문에 리스트 맹글어서 넣어줌
      await newContact.insert();

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("새 연락처가 저장되었습니다."),
      ));
      _getContacts(); // 연락처 조회
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("저장권한이 필요합니다.")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 연락처 목록 표시 영역
        Expanded(
          child: ListView.builder(
            itemCount: _contacts.length,
            itemBuilder: (context, i) {
              var contact = _contacts[i];
              return ListTile(
                title: Text(contact.displayName), // displayName -> 그냥 한꺼번에 보여줌
                subtitle: Text(contact.phones.isNotEmpty
                    ? contact.phones.first.number
                    : "전화번호 없음"),
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: ElevatedButton(
              onPressed: () {
                _showAddContactDialog();
              },
              child: Text("연락처 추가")),
        )
      ],
    );
  }
}
