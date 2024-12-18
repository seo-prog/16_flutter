import 'package:chap10_spring_to_flutter/models/menu_model.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  final MenuModel _menuModel = MenuModel(); // 요청
  List<dynamic> _menus = []; // 메뉴 목록 담을 list
  dynamic _selectMenu;


  // 메뉴 목록을 불러오는 함수
  void _loadMenus() async {
    List<dynamic> menuData = await _menuModel.searchMenu();// 전체 엔티티가 통째로 담김
    setState(() {
      _menus = menuData;
    });
  }

  // 메뉴 목록을 불러오는 함수
  @override
  void initState() {
    super.initState();
    _loadMenus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(
       children: [
         ListView.builder(
           itemCount:_menus.length,
           itemBuilder: (context, i){
             final menu = _menus[i];
             return ListTile(
               title: Text(menu[i]['menuName']),
               subtitle: Text(menu[i]['menuPrice'].toString()),
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(
                    builder:
                        (context) =>
                        DetailPage(menuName: menu[i]['menuName']!,
                            menuPrice : menu[i]['menuPrice']!,
                          category : menu[i]['categoryCode']!,
                          orderable : menu[i]['orderableStatus']!
                          )
                 ));
               },
             );
           },
         )
       ],
     ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final dynamic menuName;
  final dynamic menuPrice;
  final dynamic category;
  final dynamic orderable;

  const DetailPage({
    super.key,
    required this.menuName,
    required this.menuPrice,
    required this.category,
    required this.orderable
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(menuName),
      ),
      body: Column(
        children: [
          Text(menuPrice),
          Text(category),
          Text(orderable),
        ],
      ),
    );
  }
}



