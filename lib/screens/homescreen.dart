import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoppingapp/screens/categoriesscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<String> _bannerImages = [
    'assets/banners/banner1.jpg',
    'assets/banners/banner2.jpg',
    'assets/banners/banner3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 2,
              margin: EdgeInsets.zero,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey, width: 2),
                  ),
                ),
                child: const Text(
                  'LOGO',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF74FBDE), Color(0xFF3C41BF)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Container(
                  height: 40,
                  margin: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const TextField(
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintText: '검색어를 입력하세요',
                      suffixIcon: Icon(Icons.search),
                      suffixIconColor: Color(0xFF3C41BF),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ClipRRect(
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 180,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items:
                    _bannerImages.map((imagePath) {
                      return Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      );
                    }).toList(),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    _bannerImages.asMap().entries.map((entry) {
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 4.0,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              _currentIndex == entry.key
                                  ? const Color(0xFF3C41BF)
                                  : Colors.grey.shade400,
                        ),
                      );
                    }).toList(),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '제일 핫한 리뷰를 만나보세요',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        '리뷰️ 랭킹⭐ top 3',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
            contentContainer(),
            topViewersContaienr(),
          ],
        ),
      ),
    );
  }

  String formatDescription(Map<String, dynamic> item) {
    List<String> lines = [];

    if (item["description1"] != null) lines.add(item["description1"]);
    if (item["description2"] != null) lines.add(item["description2"]);

    List<String> formattedLines =
        lines.map((line) => '• $line').toList();
    return formattedLines.join('\n');  
  }

  Widget contentContainer() {
    final List<Map<String, dynamic>> reviewList = [
      {
        "id": 1,
        "image": "assets/images/review1.png",
        "title": "LG전자 스탠바이미 27ART10AKPL (스탠",
        "description1":
            "화면을 이동할 수 있고 전환도 편리하다는 점이 제일 마음에 들었어요. 배송도 빠르고 친절하게 받을 수 있어서 좋았습니다.",
        "description2": "스탠바이미는 사랑입니다!️",
        "rating": "⭐ 4.89 (216)",
        'color': Colors.amber,
        "review1": "LG전자 ",
        "review2": "편리성",
      },
      {
        "id": 2,
        "image": "assets/images/review2.png",
        "title": "LG전자 울트라HD 75UP8300KNA (스탠드)",
        "description1": "화면 잘 나오고... 리모컨 기능 좋습니다.",
        "description2":
            "넷플 아마존 등 버튼하나로 바로 접속 되고디스플레이는 액정문제 없어보이고소리는 살짝 약간 감이 있으나 ^^; 시끄러울까봐 그냥 블루투스 헤드폰 구매 예정이라 문제는 없네요. 아주 만족입니다!!",
        "rating": "⭐ 4.36 (136)",
        "color": const Color.fromARGB(255, 151, 150, 147),
        "review1": "LG전자",
        "review2": "고화질",
      },
      {
        "id": 3,
        "image": "assets/images/review3.jpg",
        "title": "라익미 스마트 DS4001L NETRANGE (스탠드)GX30K WIN10 (SSD 256GB)",
        "description1":
            "반응속도 및 화질이나 여러면에서도 부족함을  느끼기에는 커녕 이정도에 이 정도 성능이면차고 넘칠만 합니다",
        "description2":
            "중소기업TV 라익미 제품을 사용해보았는데 뛰어난 가성비와 더불어OTT 서비스에 오픈 브라우저 까지 너무 마음에 들게끔 기능들을 사용 가능했고",

        "rating": "⭐ 3.98 (98)",
        "color": const Color.fromARGB(255, 227, 164, 27),
        "review1": "라익미",
        "review2": "가성비",
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children:
            reviewList.map((item) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 100,
                          height: 140,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Image.asset(
                                height: 120,
                                width: 100,
                                item["image"]!,
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                          top: 5,
                          left: 2,
                          child: crownWithNumber(item['id'], item['color']),
                        ),
                      ],
                    ),

                    SizedBox(width: 10), 
        
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item["title"]!,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 4),
              
                          if (item["description1"] != null)
                            bulletText(item["description1"]!),
                          if (item["description2"] != null)
                            bulletText(item["description2"]!),
                          SizedBox(height: 4),
                          Text(
                            item["rating"]!,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                     
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(
                                    255,
                                    230,
                                    224,
                                    224,
                                  ),
                                  border: Border.all(
                                    color: Colors.transparent,
                                    width: 1,
                                  ), 
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(
                                    item['review1'],
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 134, 134, 134),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),

                              SizedBox(width: 10), 
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(
                                    255,
                                    230,
                                    224,
                                    224,
                                  ),
                                  border: Border.all(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(
                                    item['review2'],
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 134, 134, 134),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
      ),
    );
  }

  Widget crownWithNumber(int number, color) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Icon(
          FontAwesomeIcons.crown, 
          color: color, 
          size: 20, 
        ),
        Positioned(
          top: 7,
          child: Center(
            child: Text(
              "$number",
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget bulletText(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "• ", 
          style: TextStyle(
            fontSize: 14,
            color: Colors.black, 
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 14, color: Colors.black),
            maxLines: 1, 
            overflow: TextOverflow.ellipsis, 
          ),
        ),
      ],
    );
  }

  Widget topViewersContaienr() {
    final List<Map<String, dynamic>> topReviewers = [
      {"image": "assets/users/user1.jpg", "name": "Name01", 'selected': true},
      {"image": "assets/users/user2.jpg", "name": "Name02", 'selected': false},
      {"image": "assets/users/user3.jpg", "name": "Name03", 'selected': false},
      {"image": "assets/users/user4.jpg", "name": "Name04", 'selected': false},
      {"image": "assets/users/user5.jpg", "name": "Name05", 'selected': false},
      {"image": "assets/users/user6.jpg", "name": "Name06", 'selected': false},
      {"image": "assets/users/user7.jpg", "name": "Name07", 'selected': false},
      {"image": "assets/users/user8.jpg", "name": "Name08", 'selected': false},
      {"image": "assets/users/user9.jpg", "name": "Name09", 'selected': false},
      {"image": "assets/users/user10.jpg", "name": "Name10", 'selected': false},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, 
            children: [
              Text(
                "골드 계급 사용자들이예요",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "베스트 리뷰어 🏆 Top10",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.orangeAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 10),
        SizedBox(
          height: 110, 
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: topReviewers.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    topReviewers[index]['selected']
                        ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              FontAwesomeIcons.crown,
                              color: Colors.amber,
                              size: 20,
                            ),
                            InkWell(
                              onTap:
                                  () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CategoriesScreen(),
                                    ),
                                  ),
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.amber,

                                    width: 5,
                                  ),
                                ),
                                child: ClipOval(
                                  child: Image.asset(
                                    topReviewers[index]["image"]!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                        : Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.transparent,
                              width: 0,
                            ),
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              topReviewers[index]["image"]!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                    SizedBox(height: 5),

                    Text(
                      topReviewers[index]["name"]!,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
