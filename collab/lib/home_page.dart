import 'package:collab/member/lheng.dart';
import 'package:collab/member/mheang.dart';
import 'package:collab/member/rtnea.dart';
import 'package:collab/member/sha.dart';
import 'package:collab/member/sphoeurt.dart';
import 'package:collab/member/vlang.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Group's Member")),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          mainAxisExtent: 225,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
        shrinkWrap: true,
        itemCount: memberList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onLongPress: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(memberList[index].name),
                    content: memberList[index].imageUrl == ''
                        ? Icon(Icons.image)
                        : ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(15),
                            child: Image.asset(memberList[index].imageUrl),
                          ),
                    actions: [
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(Colors.red),
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text(
                          'Close',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.all(Radius.circular(20)),
                side: BorderSide(color: Colors.black12, width: 0.5),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        child: memberList[index].imageUrl == ''
                            ? Icon(Icons.image)
                            : Image.asset(
                                memberList[index].imageUrl,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: Center(
                      child: Text(
                        memberList[index].name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Member {
  final String name, imageUrl;
  Member(this.name, this.imageUrl);
}

List<Member> memberList = [
  Member('VLang', vlangUrl),
  Member('MHeang', mheangUrl),
  Member('SPhoeurt', sphoeurtUrl),
  Member('LHeng', lhengUrl),
  Member('SHa', shaUrl),
  Member('RTNea', rtneaUrl),
];
