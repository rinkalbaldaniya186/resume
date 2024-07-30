import 'package:flutter/material.dart';
import 'package:rnewapp/ResumeBuilder/appHomePage.dart';
import 'package:rnewapp/ResumeBuilder/model/onboardingClass.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboradingScreenState();
}

List<OnboardingClass> obList = [];
PageController _PageController = PageController();
var currentPage = 0;

class _OnboradingScreenState extends State<OnboardingScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    obList.add(OnboardingClass('assets/image/obresume6.jpg', 'Welcome', 'Welcome!!! Intelligent Resume builder app will help you to create professional resume & Curriculum vitae for job application in few minutes.'));
    obList.add(OnboardingClass('assets/image/obresume2.jpg', 'Create Your Resume', 'A resume should include personal information, an objective or summary statement, work experience, education, and hard and soft skills.'));
    obList.add(OnboardingClass('assets/image/obresume9.jpg', 'Resume Writing Services', 'Can refer to a wide range of editing, rewriting or formatting assistance that you might receive to help you create a job application submission.'));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemBuilder: (context, index) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 520,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(obList[index].image),
                        fit: BoxFit.fitWidth,
                      )
                  ),
                ),
                Text('${obList[index].title}',style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Text('${obList[index].description}',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400,),textAlign: TextAlign.center,),
                ),
                SizedBox(
                  height: 50,
                ),
                SmoothPageIndicator(
                  controller: _PageController,
                  count:  3,
                  axisDirection: Axis.horizontal,
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                        onPressed: () {
                          _PageController.animateToPage(
                              currentPage-1,
                              duration: Duration(seconds: 1),
                              curve: Curves.bounceOut
                          );
                          currentPage = currentPage - 1;
                        },
                        child: Text('Previos',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: (currentPage == 0) ? Colors.grey : Colors.blue.shade400),
                        )
                    ),
                    TextButton(
                      onPressed: () async {
                        _PageController.animateToPage(
                            currentPage+1,
                            duration: Duration(seconds: 1),
                            curve: Curves.bounceOut
                        );
                        currentPage = currentPage + 1;
                        if(currentPage == 3){
                          var pref = await SharedPreferences.getInstance();
                          await pref.setBool("isOnboarding", true);
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AppHomePage(),));
                        }
                      },
                      child:(currentPage == 2) ? Text('Start',style: TextStyle(color: Colors.blueAccent.shade400, fontSize: 22,fontWeight: FontWeight.w700),) : Text('Next',style: TextStyle(color: Colors.blue.shade400, fontSize: 22,fontWeight: FontWeight.w700),),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: 3,
        controller: _PageController,
        onPageChanged: (value) {
          currentPage = value;
        },
      ),
    );
  }
}

