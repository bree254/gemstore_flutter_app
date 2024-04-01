import 'package:flutter/material.dart';
import 'package:gemstore_flutter/constants/colors.dart';
import 'package:gemstore_flutter/models/data_class.dart';
import 'package:gemstore_flutter/widgets/collection_widget.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {


  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();

    MyData.productGroup = [
      {
        "name": "T-Shirts",
        "description":"The Office Life",
        "imageURL":"assets/images/t_shirt.png",
      },
      {
        "name": "Dresses",
        "description":"The Elegant Design",
        "imageURL":"assets/images/elegant.png",

      },
      {
        "name": "T-Shirts",
        "description":"The Casual Life",
        "imageURL":"assets/images/t_shirt.png",
      },
      {
        "name": "Dresses",
        "description":" The Classy Design",
        "imageURL":"assets/images/elegant.png",

      },
    ];

    MyData.productGroup = MyData.productGroup.map((product) {
      List<String> descriptionParts = product['description'].split(" ");
      return {
        "name": product['name'],
        "descriptionParts": descriptionParts,
        "imageURL": product['imageURL'],
      };
    }).toList();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white24,
        title: const Text(
          'GemStore',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: const Icon(Icons.menu_outlined, color: Colors.black),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_outlined, color: Colors.black),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Center(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  children: MyData.categoryList.map((category) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          MyData.categoryList.forEach((item) {
                            item.isSelected = false;
                          });
                          category.isSelected = true;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: category.isSelected ? BrownColor : Colors.grey.withOpacity(.3),
                                border: Border.all(
                                  color: category.isSelected ? Colors.white : Colors.transparent,
                                  width: 2,
                                ),
                              ),
                              child: Center(
                                  child: Image.asset(
                                    category.image,
                                    color: category.isSelected ? Colors.white : Colors.grey.withOpacity(.9),
                                    width: 30,
                                    height: 30,

                                  ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              category.name,
                              style: TextStyle(
                                color: category.isSelected ? Colors.black : Colors.black87,
                                fontWeight: category.isSelected ? FontWeight.bold : FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              child: Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: PageView.builder(
                    itemCount: MyData.collections.length,
                    itemBuilder: (context, index) {
                      return CollectionPage(
                        collectionName: 'Autumn Collection 2021',
                        imagePath: MyData.collections[index],
                        pageIndex: index,
                        currentPageIndex: currentPageIndex,
                      );
                    },
                    onPageChanged: (index) {
                      setState(() {
                        currentPageIndex = index;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child:
            Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8,top: 16,bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Feature Products",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Show all',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54,
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 250,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                itemCount: MyData.featuredproducts.length,
                  itemBuilder:(BuildContext context ,index) {
                    var featuredProducts = MyData.featuredproducts[index];
                  return Column(
                      children: [
                    Container(
                      height :150,
                        width: 100,
                        margin: EdgeInsets.only(right: 20, left: 20,bottom: 25),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          featuredProducts['imageURL'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                        Text(
                          featuredProducts['name'],
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          '\$ ${featuredProducts["price"].toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                  ]);
                }),
            )
            ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 0, bottom: 8, left: 8, right: 8),
              child: AnimatedContainer(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ParyCollectionBg,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                duration: const Duration(milliseconds: 300),
                child: Stack(
                  children: [
                    Positioned(
                      left: 150,
                      top: 20,
                      right: 3,
                      child: Transform.scale(
                        scale: 0.6,
                        child: Image.asset(
                          'assets/images/ellipse_out.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text('|'),
                                  SizedBox(width: 10),
                                  Text('NEW COLLECTION',style: TextStyle(fontWeight: FontWeight.w400),),
                                ],
                              ),
                              SizedBox(height: 50),
                              Column(
                                children: const [
                                  Text(
                                    'HANG OUT',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    ' & PARTY',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Image.asset(
                          'assets/images/party_collection.png',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child:
            Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8,top: 16,bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Recommended",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Show all',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54,
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child:  SizedBox(
              height: 80,
              child:  ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: MyData.recommendedproducts.length,
                itemBuilder: (BuildContext context, int index) {
                  final product = MyData.recommendedproducts[index];
                  return Container(
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.only(right:8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 120,
                          height: 120,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: AssetImage(product["image"]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              product["name"],
                              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              '\$ ${product["price"].toStringAsFixed(2)}',
                              style: const TextStyle(fontSize: 14.0, color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),

          SliverToBoxAdapter(
            child:
            Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8,top: 16,bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Top Collection",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Show all',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54,
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child:
            Padding(
              padding: const EdgeInsets.only(top:0,bottom: 8,left: 8,right: 8),
              child: AnimatedContainer(
                margin: const EdgeInsets.only(bottom: 20),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ParyCollectionBg,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                duration: const Duration(milliseconds: 300),
                child:
                Stack(
                  children: [
                    Positioned(
                      left: 150,
                      top: 0,
                      bottom: 0,
                      right: 8,
                      child: Transform.scale(
                        scale: 0.6,
                        child: Image.asset(
                          'assets/images/ellipse_in.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text('|'),
                                  SizedBox(width: 10,),
                                  Text('Sale up to 40%',style: TextStyle(fontWeight: FontWeight.w400)),
                                ],
                              ),
                              const SizedBox(height: 50,),
                              Column(
                                children: const [
                                  Text(
                                    'FOR SLIM ',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),),
                                  Text(
                                    ' & BEAUTY',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Image.asset(
                            'assets/images/slim.png'),
                      ],
                    ),
                  ]

                ),
              ),
            ),

          ),
          SliverToBoxAdapter(
            child:
            Padding(
              padding: const EdgeInsets.only(top:0,bottom: 8,left: 8,right: 8),
              child: AnimatedContainer(
                margin: const EdgeInsets.only(bottom: 20),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ParyCollectionBg,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                duration: Duration(milliseconds: 300),
                child:
                Stack(
                  children:[
                    Positioned(
                      left: 180,
                      top: 0,
                      bottom: 0,
                      right: 0,
                      child: Transform.scale(
                        scale: 0.6,
                        child: Image.asset(
                          'assets/images/ellipse_in.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('|'),
                                SizedBox(width: 10,),
                                Text('Summer Collection 2021',style: TextStyle(fontWeight: FontWeight.w400)),
                              ],
                            ),
                            const SizedBox(height: 50,),
                            Column(
                              children: const [
                                Text(
                                  'MOST SEXY',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),),
                                Text(
                                  '& FABULOUS',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),),
                                Text(
                                  'DESIGN',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Image.asset('assets/images/sexy.png'),
                    ],
                  ),]
                ),
              ),
            ),

          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              child:
              ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: MyData.productGroup.length,
                  itemBuilder:(BuildContext context ,index) {
                    var ProductGroup = MyData.productGroup[index];
                    return Container(
                      height: 150,
                      width: 160,
                      margin: const EdgeInsets.only(right: 10, left: 10,bottom: 5),
                      decoration: BoxDecoration(
                        color:ParyCollectionBg,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                              child: Image.asset(ProductGroup['imageURL'],
                                fit: BoxFit.fitWidth,
                              )
                          ,),
                          const SizedBox(width: 10,),
                          Padding(
                            padding: const EdgeInsets.only(right:2.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  ProductGroup['name'],
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                                const SizedBox(height: 30,),
                                for (String word in ProductGroup['descriptionParts'])
                                  Text(
                                    word,
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }
              ),
            ),
          ),

        ],
      ),
    );
  }
}

