import 'package:flutter/material.dart';
import 'package:future_work/View/NotificationView.dart';




class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Search Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  final tabs = [
    const HomeView(),
    const HomeView(),
    const HomeView()
  ];
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: ()=>FocusScope.of(context).unfocus(),
      child: Scaffold(

        body:SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height * 0.06,),
              Row(
                children: [
                  SizedBox(width: width * 0.04),
                  Image.asset('assets/images/Vector.png'),
                  SizedBox(width: width * 0.02,),
                  const Text("Chennai,Tamil Nadu,india"),
                  SizedBox(width: width * 0.02,),
                  Image.asset('assets/images/back button.png'),
                ],
              ),
              SizedBox(height: height * 0.02,),
              Row(
                children: [
                  SizedBox(width: width * 0.04),
                  SizedBox(
                    width: width * 0.7,
                    height: height * 0.06,
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        focusColor: const Color(0xffEEEEEE),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white)
                        ),
                        hintText: 'Search for products/stores',
                        hintStyle: const TextStyle(fontSize: 14),
                        suffixIcon: Image.asset('assets/images/search_Vector.png')
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.02,),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                        color: Colors.transparent,
                        borderRadius:
                        BorderRadius.all(Radius.circular(15))),
                    child: IconButton(
                      onPressed: () {
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>const NotificationView()));
                      },
                      icon: Stack(
                        children: <Widget>[
                          Image.asset('assets/images/notification_Vector.png'),
                          Positioned(
                            right: 0,
                            child: notificationIcon(1,false),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.01,),
                  Image.asset('assets/images/tag_Vector.png',height: 24,),
                ],
              ),
              SizedBox(height: height * 0.02),
              Row(
                children: [
                  SizedBox(width: width * 0.05,),
                  const Text("What would you like to do today?",style: TextStyle(color: Colors.black,fontSize: 21,fontWeight: FontWeight.bold),),
                ],
              ),
              SizedBox(
                height: height * 0.32,
                child: Column(
                  children: [
                    Flex(
                      direction: Axis.vertical,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                          child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  crossAxisSpacing: 2.0,
                                  mainAxisSpacing: 0,
                                  childAspectRatio: 20/22
                              ),
                              itemCount: solarListGrid.length,
                              itemBuilder: (BuildContext context,index){
                                return InkWell(
                                  onTap: (){

                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.black12,
                                              offset: Offset(1,3),
                                              blurRadius: 10
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: height * 0.02,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(1.0),
                                            child: Center(
                                              // child: Icon(Icons.print),
                                              child: Container(
                                                width: width* 0.08,
                                                height: 30,
                                                child: Stack(
                                                  children: [
                                                    Image.asset(solarListGrid[index]['image'],height: 25,),
                                                    Positioned(
                                                      right: 0,
                                                      child: offerCart(solarListGrid[index]['offer'],false)
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          const Spacer(),
                                          Container(
                                            height: height * 0.04,
                                            decoration: const BoxDecoration(
                                              // color: Color(0xff9DDACF),
                                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(5),bottomLeft:  Radius.circular(5)),
                                            ),
                                            child: Center(
                                              child: Text(solarListGrid[index]['title'],style: const TextStyle(color: Colors.black54,fontWeight: FontWeight.w600,fontSize: 11),textAlign: TextAlign.center,),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }
                          ),
                        ),
                        SizedBox(height: height * 0.01,),
                      ],
                    )
                  ],
                ),

              ),
              Row(
                children: [
                  SizedBox(width: width * 0.05,),
                  const Text("Top Pick for you",style: TextStyle(color: Colors.black,fontSize: 21,fontWeight: FontWeight.bold),),
                ],
              ),
              SizedBox(
                height: height * 0.25,
                width: width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: height * 0.23,
                        width: width * 0.9,
                        decoration: BoxDecoration(
                          color: const Color(0xff06C25E),
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Stack(
                          children: [
                              Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Image.asset("assets/images/grid1.png")),
                            Positioned(
                              top: height * 0.05,
                                left: width * 0.04,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("DISCOUNT \n25% ALL \nFRUITS",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                                    SizedBox(height: height * 0.01,),
                                    Container(
                                      height: height * 0.04,
                                      width: width * 0.3,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffFF8918),
                                        borderRadius: BorderRadius.circular(6)
                                      ),
                                      child: const Center(
                                        child: Text("CHECK NOW",style: TextStyle(color: Colors.white,fontSize: 12),),
                                      ),
                                    )
                                  ],
                                )
                            ),

                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: height * 0.23,
                        width: width * 0.9,
                        decoration: BoxDecoration(
                            color: const Color(0xff06C25E),
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: Image.asset("assets/images/grid1.png")),
                            Positioned(
                                top: height * 0.05,
                                left: width * 0.04,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("DISCOUNT \n25% ALL \nFRUITS",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                                    SizedBox(height: height * 0.01,),
                                    Container(
                                      height: height * 0.04,
                                      width: width * 0.3,
                                      decoration: BoxDecoration(
                                          color: const Color(0xffFF8918),
                                          borderRadius: BorderRadius.circular(6)
                                      ),
                                      child: const Center(
                                        child: Text("CHECK NOW",style: TextStyle(color: Colors.white,fontSize: 12),),
                                      ),
                                    )
                                  ],
                                )
                            ),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),
              Row(
                children: [
                  SizedBox(width: width * 0.05,),
                  const Text("Treading",style: TextStyle(color: Colors.black,fontSize: 21,fontWeight: FontWeight.bold),),

                  const Spacer(),
                  const Text("See All",style: TextStyle(color: Color(0xff06C25E),fontSize: 15,fontWeight: FontWeight.bold),),
                  SizedBox(width: width * 0.03,),
                ],
              ),
              SizedBox(
                height: height * 0.13,
                width: width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: height * 0.11,
                        width: width * 0.7,
                        decoration: BoxDecoration(
                            color:  Colors.white,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: width * 0.2,
                              height: height * 0.11,
                              decoration:  BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage(
                                      'assets/images/trending.png'),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius: BorderRadius.circular(5)
                              ),
                            ),
                            SizedBox(
                              width: width * 0.5,
                              height: height * 0.11,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: height * 0.004,),
                                  Row(
                                    children: [
                                      SizedBox(width: width * 0.02,),
                                      const Text("Mithas Bandar",style: TextStyle(color: Colors.black54,fontSize: 17,fontWeight: FontWeight.bold),),

                                    ],
                                  ),
                                  SizedBox(height: height * 0.002,),
                                  Row(
                                    children: [
                                      SizedBox(width: width * 0.02,),
                                      const Text("Sweets,North Indian",style: TextStyle(color: Colors.black54,fontSize: 13),),
                                    ],
                                  ),
                                  SizedBox(height: height * 0.002,),
                                  Row(
                                    children: [
                                      SizedBox(width: width * 0.02,),
                                      const Text("(Store location) | 6 Kms",style: TextStyle(color: Colors.black54,fontSize: 13),),
                                    ],
                                  ),
                                  SizedBox(height: height * 0.002,),
                                  Row(
                                    children: [
                                      SizedBox(width: width * 0.02,),
                                      const Icon(Icons.star,size: 15,color: Colors.grey,),
                                      const Text("4.1,45 mins",style: TextStyle(color: Colors.black54,fontSize: 13),),
                                    ],
                                  ),

                                ],
                              ),
                            )
                          ],
                        )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: height * 0.11,
                          width: width * 0.7,
                          decoration: BoxDecoration(
                              color:  Colors.white,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: width * 0.2,
                                height: height * 0.11,
                                decoration:  BoxDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/trending.png'),
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(5)
                                ),
                              ),
                              SizedBox(
                                width: width * 0.5,
                                height: height * 0.11,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: height * 0.004,),
                                    Row(
                                      children: [
                                        SizedBox(width: width * 0.02,),
                                        const Text("Mithas Bandar",style: TextStyle(color: Colors.black54,fontSize: 17,fontWeight: FontWeight.bold),),

                                      ],
                                    ),
                                    SizedBox(height: height * 0.002,),
                                    Row(
                                      children: [
                                        SizedBox(width: width * 0.02,),
                                        const Text("Sweets,North Indian",style: TextStyle(color: Colors.black54,fontSize: 13),),
                                      ],
                                    ),
                                    SizedBox(height: height * 0.002,),
                                    Row(
                                      children: [
                                        SizedBox(width: width * 0.02,),
                                        const Text("(Store location) | 6 Kms",style: TextStyle(color: Colors.black54,fontSize: 13),),
                                      ],
                                    ),
                                    SizedBox(height: height * 0.002,),
                                    Row(
                                      children: [
                                        SizedBox(width: width * 0.02,),
                                        const Icon(Icons.star,size: 15,color: Colors.grey,),
                                        const Text("4.1,45 mins",style: TextStyle(color: Colors.black54,fontSize: 13),),
                                      ],
                                    ),

                                  ],
                                ),
                              )
                            ],
                          )
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),
              Row(
                children: [
                  SizedBox(width: width * 0.05,),
                  const Text("Craze deals",style: TextStyle(color: Colors.black,fontSize: 21,fontWeight: FontWeight.bold),),
                ],
              ),
              SizedBox(
                height: height * 0.25,
                width: width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: height * 0.23,
                        width: width * 0.9,
                        decoration: BoxDecoration(
                            color: const Color(0xff262626),
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: Image.asset("assets/images/vegitable.png")),
                            Positioned(
                                top: height * 0.06,
                                left: width * 0.04,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Customer favorite  \ntop supermarkets",style: TextStyle(color: Colors.white,fontSize: 23,fontWeight: FontWeight.bold),),
                                    SizedBox(height: height * 0.01,),
                                    Row(
                                      children: const [
                                        Text("Explore",style: TextStyle(color: Color(0xffEA7E00),fontSize: 19,fontWeight: FontWeight.bold),),
                                        Icon(Icons.arrow_forward,color:Color(0xffEA7E00) ,)
                                      ],
                                    )
                                  ],
                                )
                            ),

                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: height * 0.23,
                        width: width * 0.9,
                        decoration: BoxDecoration(
                            color: const Color(0xff262626),
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: Image.asset("assets/images/vegitable.png")),
                            Positioned(
                                top: height * 0.06,
                                left: width * 0.04,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Customer favorite  \ntop supermarkets",style: TextStyle(color: Colors.white,fontSize: 23,fontWeight: FontWeight.bold),),
                                    SizedBox(height: height * 0.01,),
                                    Row(
                                      children: const [
                                        Text("Explore",style: TextStyle(color: Color(0xffEA7E00),fontSize: 19,fontWeight: FontWeight.bold),),
                                        Icon(Icons.arrow_forward,color:Color(0xffEA7E00) ,)
                                      ],
                                    )
                                  ],
                                )
                            ),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),
              Container(
                height: height * 0.1,
                width: width * 0.87,
                decoration: BoxDecoration(
                  color: const Color(0xff29D177),
                  borderRadius: BorderRadius.circular(7)
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom:height * 0.012,
                      right: width * 0.03,
                      child: Image.asset("assets/images/rewards.png"),
                    ),
                    Positioned(
                      top:height * 0.01,
                      left: width * 0.05,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(width:  width * 0.03,),
                              const Text("Refer & Eran",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)

                            ],
                          ),
                          SizedBox(height: height * 0.007),
                          Row(
                            children:  [
                              const Text("Invite your friend & eran 15% off",style: TextStyle(color: Colors.white,fontSize: 14),),
                              SizedBox(width:  width * 0.01,),
                              const CircleAvatar(
                                radius: 8,
                                backgroundColor: Colors.white,
                                child: Center(
                                  child: Icon(Icons.arrow_forward,size: 10,color:const Color(0xff29D177) ,),
                                ),
                              )
                            ],
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),
              Row(
                children: [
                  SizedBox(width: width * 0.05,),
                  const Text("Nearby stores",style: TextStyle(color: Colors.black,fontSize: 21,fontWeight: FontWeight.bold),),

                  const Spacer(),
                  const Text("See All",style: TextStyle(color: Color(0xff06C25E),fontSize: 15,fontWeight: FontWeight.bold),),
                  SizedBox(width: width * 0.03,),
                ],
              ),
              SizedBox(
                height: height * 0.3,
                width: width,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8,left: 8,bottom: 8),
                      child: Container(
                          height: height * 0.11,
                          width: width * 0.7,
                          decoration: BoxDecoration(
                              color:  Colors.white,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: width * 0.2,
                                height: height * 0.11,
                                decoration:  BoxDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/nearbystore.png'),
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(5)
                                ),
                              ),
                              SizedBox(
                                width: width * 0.5,
                                height: height * 0.11,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: height * 0.004,),
                                    Row(
                                      children: [
                                        SizedBox(width: width * 0.02,),
                                        const Text("Freshly Baker",style: TextStyle(color: Colors.black54,fontSize: 17,fontWeight: FontWeight.bold),),

                                      ],
                                    ),
                                    SizedBox(height: height * 0.002,),
                                    Row(
                                      children: [
                                        SizedBox(width: width * 0.02,),
                                        const Text("Sweets,North Indian",style: TextStyle(color: Colors.black54,fontSize: 13),),
                                      ],
                                    ),
                                    SizedBox(height: height * 0.002,),
                                    Row(
                                      children: [
                                        SizedBox(width: width * 0.02,),
                                        const Text("(Store location) | 6 Kms",style: TextStyle(color: Colors.black54,fontSize: 13),),
                                      ],
                                    ),
                                    SizedBox(height: height * 0.002,),
                                    Row(
                                      children: [
                                        SizedBox(width: width * 0.02,),
                                        const Icon(Icons.star,size: 15,color: Colors.grey,),
                                        const Text("4.1,45 mins",style: TextStyle(color: Colors.black54,fontSize: 13),),
                                      ],
                                    ),

                                  ],
                                ),
                              )
                            ],
                          )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: height * 0.11,
                          width: width * 0.7,
                          decoration: BoxDecoration(
                              color:  Colors.white,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: width * 0.2,
                                height: height * 0.11,
                                decoration:  BoxDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/nearbystore.png'),
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(5)
                                ),
                              ),
                              SizedBox(
                                width: width * 0.5,
                                height: height * 0.11,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: height * 0.004,),
                                    Row(
                                      children: [
                                        SizedBox(width: width * 0.02,),
                                        const Text("Freshly Baker",style: TextStyle(color: Colors.black54,fontSize: 17,fontWeight: FontWeight.bold),),

                                      ],
                                    ),
                                    SizedBox(height: height * 0.002,),
                                    Row(
                                      children: [
                                        SizedBox(width: width * 0.02,),
                                        const Text("Sweets,North Indian",style: TextStyle(color: Colors.black54,fontSize: 13),),
                                      ],
                                    ),
                                    SizedBox(height: height * 0.002,),
                                    Row(
                                      children: [
                                        SizedBox(width: width * 0.02,),
                                        const Text("(Store location) | 6 Kms",style: TextStyle(color: Colors.black54,fontSize: 13),),
                                      ],
                                    ),
                                    SizedBox(height: height * 0.002,),
                                    Row(
                                      children: [
                                        SizedBox(width: width * 0.02,),
                                        const Icon(Icons.star,size: 15,color: Colors.grey,),
                                        const Text("4.1,45 mins",style: TextStyle(color: Colors.black54,fontSize: 13),),
                                      ],
                                    ),

                                  ],
                                ),
                              )
                            ],
                          )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: height * 0.11,
                          width: width * 0.7,
                          decoration: BoxDecoration(
                              color:  Colors.white,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: width * 0.2,
                                height: height * 0.11,
                                decoration:  BoxDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/nearbystore.png'),
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(5)
                                ),
                              ),
                              SizedBox(
                                width: width * 0.5,
                                height: height * 0.11,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: height * 0.004,),
                                    Row(
                                      children: [
                                        SizedBox(width: width * 0.02,),
                                        const Text("Freshly Baker",style: TextStyle(color: Colors.black54,fontSize: 17,fontWeight: FontWeight.bold),),

                                      ],
                                    ),
                                    SizedBox(height: height * 0.002,),
                                    Row(
                                      children: [
                                        SizedBox(width: width * 0.02,),
                                        const Text("Sweets,North Indian",style: TextStyle(color: Colors.black54,fontSize: 13),),
                                      ],
                                    ),
                                    SizedBox(height: height * 0.002,),
                                    Row(
                                      children: [
                                        SizedBox(width: width * 0.02,),
                                        const Text("(Store location) | 6 Kms",style: TextStyle(color: Colors.black54,fontSize: 13),),
                                      ],
                                    ),
                                    SizedBox(height: height * 0.002,),
                                    Row(
                                      children: [
                                        SizedBox(width: width * 0.02,),
                                        const Icon(Icons.star,size: 15,color: Colors.grey,),
                                        const Text("4.1,45 mins",style: TextStyle(color: Colors.black54,fontSize: 13),),
                                      ],
                                    ),

                                  ],
                                ),
                              )
                            ],
                          )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: height * 0.11,
                          width: width * 0.7,
                          decoration: BoxDecoration(
                              color:  Colors.white,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: width * 0.2,
                                height: height * 0.11,
                                decoration:  BoxDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/nearbystore.png'),
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(5)
                                ),
                              ),
                              SizedBox(
                                width: width * 0.5,
                                height: height * 0.11,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: height * 0.004,),
                                    Row(
                                      children: [
                                        SizedBox(width: width * 0.02,),
                                        const Text("Freshly Baker",style: TextStyle(color: Colors.black54,fontSize: 17,fontWeight: FontWeight.bold),),

                                      ],
                                    ),
                                    SizedBox(height: height * 0.002,),
                                    Row(
                                      children: [
                                        SizedBox(width: width * 0.02,),
                                        const Text("Sweets,North Indian",style: TextStyle(color: Colors.black54,fontSize: 13),),
                                      ],
                                    ),
                                    SizedBox(height: height * 0.002,),
                                    Row(
                                      children: [
                                        SizedBox(width: width * 0.02,),
                                        const Text("(Store location) | 6 Kms",style: TextStyle(color: Colors.black54,fontSize: 13),),
                                      ],
                                    ),
                                    SizedBox(height: height * 0.002,),
                                    Row(
                                      children: [
                                        SizedBox(width: width * 0.02,),
                                        const Icon(Icons.star,size: 15,color: Colors.grey,),
                                        const Text("4.1,45 mins",style: TextStyle(color: Colors.black54,fontSize: 13),),
                                      ],
                                    ),

                                  ],
                                ),
                              )
                            ],
                          )
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),
              Container(
                height: height * 0.06,
                width: width * 0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: const Color(0xff29D177)
                ),
                child: const Center(
                  child: Text("View all stores",style: TextStyle(color: Colors.white,fontSize: 17),),
                ),
              ),
              SizedBox(height: height * 0.02),
            ],
          ),
        ),
      ),
    );
  }
  Widget notificationIcon(int notify,bool isDefault){
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: isDefault == false ? notify == 0
            ? Colors.transparent
            : Colors.red : Colors.transparent ,
        borderRadius:
        BorderRadius.circular(6),
      ),
      constraints: const BoxConstraints(
        minWidth: 12,
        minHeight: 12,
      ),
      child: Text(
        isDefault == false ? notify == 0
            ? ""
            : "${notify}" : "" ,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 8,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
Widget offerCart(int notify,bool isDefault){
  return Container(
    padding: const EdgeInsets.all(1),
    decoration: BoxDecoration(
      color: isDefault == false ? notify == 0
          ? Colors.transparent
          : Color(0xff9C37EC) : Colors.transparent ,
      borderRadius: BorderRadius.circular(3),
    ),
    constraints: const BoxConstraints(
      minWidth: 20,
      minHeight: 12,
    ),
    child: Text(
      isDefault == false ? notify == 0
          ? ""
          : "${notify}% off" : "" ,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 8,
      ),
      textAlign: TextAlign.center,
    ),
  );
}


List<Map<String,dynamic>> solarListGrid = [
  {
    'title':'Food\nDelivery',
    'image':'assets/images/fooddelivery.png',
    'offer':10
  },
  {
    'title':'Medicine',
    'image':'assets/images/medicine_vector.png',
    'offer':10
  },
  {
    'title':'Pet\nSupplies',
    'image':'assets/images/pet_Vector.png',
    'offer':10
  },
  {
    'title':'Gift',
    'image':'assets/images/gift.png',
    'offer':0
  },
  {
    'title':'Meat',
    'image':'assets/images/meat.png',
    'offer':0
  },

  {
    'title':'Casmatics',
    'image':'assets/images/Make Up.png',
    'offer':0
  },
  {
    'title':'Stationary',
    'image':'assets/images/stationery.png',
    'offer':0
  },



  {
    'title':'Stores',
    'image':'assets/images/stores.png',
    'offer':10
  },


];
