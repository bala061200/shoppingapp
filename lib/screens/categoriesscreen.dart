import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoppingapp/screens/homescreen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        elevation: 4,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed:
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              ),
        ),
        title: Center(
          child: Column(
            children: [
              Text('랭킹 1위', style: TextStyle(fontSize: 10)),
              Text(
                '베스트 리뷰어',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              imageContainer(),
              Text('Name01', style: TextStyle(fontSize: 20.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(FontAwesomeIcons.crown, color: Colors.amber, size: 20),
                  Text('골드', style: TextStyle(color: Colors.amber)),
                ],
              ),

              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 236, 236, 236),
                  border: Border.all(
                    color: Colors.transparent,
                    width: 1,
                  ), 
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text('조립컴 업체를 운영하며 리뷰를 작성합니다.'),
              ),

              maincontainer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget imageContainer() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.transparent),
      ),
      child: ClipOval(
        child: Image.asset('assets/users/user1.jpg', fit: BoxFit.cover),
      ),
    );
  }

  Widget maincontainer() {
    return Column(
      children: [
        Divider(
          color: const Color.fromARGB(255, 178, 178, 178),
          thickness: 1,
          height: 20, 
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        '작성한 리뷰',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),

                      Text('총 35개', style: TextStyle(fontSize: 12)),
                    ],
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 236, 236, 236),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ), 
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text('최신순'),
                  ),
                ],
              ),
            ),
            Divider(
              color: const Color.fromARGB(255, 214, 214, 214),
              thickness: 1,
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  subcontainer(),
                  Divider(
                    color: const Color.fromARGB(255, 214, 214, 214),
                    thickness: 1, 
                    height: 20,
                  ),
                  userContainer(),
                  reviewheaderContainer(),
                  reviewmainContainer(),
                  commentContainer(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget subcontainer() {
    return Row(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Image.asset(
                height: 100,
                width: 100,
                'assets/images/category1.png',
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 200,
              child: Text(
                "AMD 라이젠 5 5600X 버미어정품 멀티팩",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14),
              ),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                starContainer(30.0),
                SizedBox(width: 5),
                Text(
                  '4.07',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget starContainer(size) {
    return Row(
      children: [
        Icon(Icons.star_outlined, color: Colors.amber, size: size),
        Icon(Icons.star_outlined, color: Colors.amber, size: size),
        Icon(Icons.star_outlined, color: Colors.amber, size: size),
        Icon(Icons.star_outlined, color: Colors.amber, size: size),
        Icon(Icons.star_outlined, color: Colors.grey, size: size),
      ],
    );
  }

  Widget userContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [imageContainer(), SizedBox(width: 10), nameContainer()]),
        Icon(Icons.bookmark_outline_sharp, size: 30, color: Colors.grey),
      ],
    );
  }

  Widget nameContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Name01',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        ),
        Row(
          children: [
            starContainer(18.0),
            Text('2022.12.09', style: TextStyle(color: Colors.grey[400])),
          ],
        ),
      ],
    );
  }

  Widget reviewheaderContainer() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Padding(padding: const EdgeInsets.all(8.0), child: Text('“가격 저렴해요”')),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('“CPU온도 고온”'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('“서멀작업 가능해요”'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('“게임 잘 돌아가요”'),
          ),

          Padding(padding: const EdgeInsets.all(8.0), child: Text('“발열이 적어요”')),
        ],
      ),
    );
  }

  Widget reviewmainContainer() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.bolt_rounded, color: Colors.indigo[900]),
              SizedBox(
                width: 260,
                child: Text(
                  '멀티 작업도 잘 되고 꽤 괜찮습니다. 저희 회사 고객님들에게도 추천 가능한 제품인 듯 합니다.',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Icon(Icons.bolt_rounded, color: Colors.grey),
              SizedBox(
                width: 260,
                child: Text(
                  '3600에서 바꾸니 체감이 살짝 되네요. 버라이어티한 느낌 까지는 아닙니다.',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              SizedBox(width: 30),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.transparent),
                ),
                child: Image.asset(
                  'assets/images/comment1.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.transparent),
                ),
                child: Image.asset(
                  'assets/images/comment2.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.transparent),
                ),
                child: Image.asset(
                  'assets/images/comment3.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Divider(
            color: const Color.fromARGB(255, 214, 214, 214),
            thickness: 1, 
            height: 20,  
          ),
        ],
      ),
    );
  }

  Widget commentContainer() {
    return Row(
      children: [
        Icon(Icons.insert_comment_outlined, color: Colors.grey[700]),
        SizedBox(width: 10),
        Text(
          '댓글 달기..',
          style: TextStyle(color: Colors.grey[700], fontSize: 10),
        ),
      ],
    );
  }
}
