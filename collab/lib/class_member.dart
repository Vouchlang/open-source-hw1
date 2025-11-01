import 'member/lheng.dart';
import 'member/mheang.dart';
import 'member/rtnea.dart';
import 'member/sha.dart';
import 'member/sphoeurt.dart';
import 'member/vlang.dart';

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
