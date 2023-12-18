// import 'package:flutter/material.dart';
// import 'package:habit/pages/login_page.dart';



// class Welcome extends StatefulWidget {
//   const Welcome({Key? key}) : super(key: key);

//   @override
//   State<Welcome> createState() => _WelcomeState();
// }

// class _WelcomeState extends State<Welcome> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//      body: Container(
//        height: double.infinity,
//        width: double.infinity,
//        decoration: const BoxDecoration(
        
//         image: DecorationImage(image: AssetImage('assets/phh1.jpg'),fit: BoxFit.cover)
//        ),
    
//        child: Column(
//          children: [
//            const Padding(
//              padding: EdgeInsets.only(top: 200.0),
//            ),
//            const SizedBox(
//              height: 100,
//            ),
//            const Text('Welcome ',style: TextStyle(
//              fontSize: 30,
//              fontWeight: FontWeight.bold,
//              color: Colors.white
//            ),),
//           const SizedBox(height: 30,),
//           GestureDetector(
//             onTap: (){
//               Navigator.pushReplacement(context,
//                   MaterialPageRoute(builder: (context) => const Loginpage()));
//             },
//             child: Container(
//               height: 53,
//               width: 320,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(30),
//                 border: Border.all(color: Colors.white),
//               ),
//               child: const Center(child: Text('SIGN IN',style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white
//               ),),),
//             ),
//           ),
//            const SizedBox(height: 30,),
//            GestureDetector(
//              onTap: (){
//                Navigator.pushReplacement(context,
//                    MaterialPageRoute(builder: (context) => const Loginpage()));
//              },
//              child: Container(
//                height: 53,
//                width: 320,
//                decoration: BoxDecoration(
//                  color: Colors.white,
//                  borderRadius: BorderRadius.circular(30),
//                  border: Border.all(color: Colors.white),
//                ),
//                child: const Center(child: Text('SIGN UP',style: TextStyle(
//                    fontSize: 20,
//                    fontWeight: FontWeight.bold,
//                    color: Colors.black
//                ),),),
//              ),
//            ),
//            const Spacer(),
//            const Text('Login with Social Media',style: TextStyle(
//                fontSize: 17,
//                color: Colors.white
//            ),),//
//           const SizedBox(height: 12,),
          
//           ]
//        ),
//      ),

//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:habit/pages/login_page.dart';


class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/hab3.jfif'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 200),
            const SizedBox(height: 100),
            const Text(
              'Welcome ',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Loginpage()),
                );
              },
              child: Container(
                height: 53,
                width: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white),
                ),
                child: const Center(
                  child: Text(
                    'SIGN IN',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Loginpage()),
                );
              },
              child: Container(
                height: 53,
                width: 320,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white),
                ),
                child: const Center(
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
           
            Column(
              children: [
                const Text(
                  'Track Your Habits',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
               
                Image.asset(
                  'assets/habit_tracker_illustration.png',
                  height: 150,
                ),
                const SizedBox(height: 12),
                
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Loginpage(),
                      ),
                    );
                  },
                  child: const Text('Go to Habit Tracker'),
                ),
              ],
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
