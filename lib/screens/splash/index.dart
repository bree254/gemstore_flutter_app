import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:gemstore_flutter/screens/main_page/index.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<SplashScreen> with TickerProviderStateMixin {

  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  bool hide = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scaleController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 800)
    );

    _scaleAnimation = Tween<double>(
        begin: 1.0,
        end: 30.0
    ).animate(_scaleController)..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: MainPage()));
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/splash.png'),
                fit: BoxFit.cover
            )
        ),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  colors: [
                    Colors.black.withOpacity(.9),
                    Colors.black.withOpacity(.4),
                  ]
              )
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FadeInUp(duration: const Duration(milliseconds: 1000), child: const Text("Welcome to GemStore!", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),)),
                const SizedBox(height: 20,),
                FadeInUp(duration: const Duration(milliseconds: 1300), child: const Text("The home for a fashionista", style: TextStyle(color: Colors.white, fontSize: 20),)),
                const SizedBox(height: 100,),
                InkWell(
                  onTap: () {
                    setState(() {
                      hide = true;
                    });
                    _scaleController.forward();
                  },
                  child: AnimatedBuilder(
                    animation: _scaleController,
                    builder: (context, child) => Transform.scale(
                      scale: _scaleAnimation.value,
                      child: FadeInUp(duration: Duration(milliseconds: 1500), child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.2),
                            borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.white),
                        ),
                        child: Center(
                          child: hide == false ? const Text("Get Started", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)) : Container(),
                        ),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
