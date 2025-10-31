import 'package:collab/member/lheng.dart';
import 'package:collab/member/mheang.dart';
import 'package:collab/member/rtnea.dart';
import 'package:collab/member/sha.dart';
import 'package:collab/member/sphoeurt.dart';
import 'package:collab/member/vlang.dart';
import 'package:flutter/material.dart';
import 'detail_member.dart';

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
            onTap: () {
              memberList[index].description == ""
                  ? ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Row(
                          children: [
                            Icon(
                              Icons.info_outline,
                              color: Colors.white,
                              size: 24,
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                'Not enough data to display details.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        backgroundColor: Color(0xFF005086),
                        duration: const Duration(seconds: 3),
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: const EdgeInsets.all(16),
                        elevation: 8,
                      ),
                    )
                  : Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailMember(member: memberList[index]),
                      ),
                    );
            },
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
  final String name, imageUrl, description, major, degree, year, job;
  Member(
    this.name,
    this.imageUrl,
    this.description,
    this.major,
    this.degree,
    this.year,
    this.job,
  );
}

List<Member> memberList = [
  Member(
    vlangName,
    vlangUrl,
    vlangDesc,
    vlangMajor,
    vlangDegree,
    vlangYear,
    vlangJob,
  ),
  Member(
    mheangName,
    mheangUrl,
    mheangDesc,
    mheangMajor,
    mheangDegree,
    mheangYear,
    mheangJob,
  ),
  Member(
    sphoeutName,
    sphoeutUrl,
    sphoeutDesc,
    sphoeutMajor,
    sphoeutDegree,
    sphoeutYear,
    sphoeutJob,
  ),
  Member(
    lhengName,
    lhengUrl,
    lhengDesc,
    lhengMajor,
    lhengDegree,
    lhengYear,
    lhengJob,
  ),
  Member(shaName, shaUrl, shaDesc, shaMajor, shaDegree, shaYear, shaJob),
  Member(
    rtneaName,
    rtneaUrl,
    rtneaDesc,
    rtneaMajor,
    rtneaDegree,
    rtneaYear,
    rtneaJob,
  ),
];
