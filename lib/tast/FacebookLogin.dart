import 'package:flutter/material.dart';

class Facebooklogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FacebookLoginState();
  }
}

class _FacebookLoginState extends State<Facebooklogin> {
  bool passwordVis = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Image.asset('assets/image/hq720.jpg'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text('اردو',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                width: 4,
                height: 4,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Español',
                    style: TextStyle(fontSize: 14, color: Colors.black)),
              ),
              Container(
                width: 4,
                height: 4,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('More ...',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 24, 93, 213),
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: TextField(
              decoration: InputDecoration(
                hintText: "phone or email",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 78, 97, 106),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 78, 97, 106),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 1,
            ),
            child: TextField(
              obscureText: passwordVis,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: passwordVis
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off)),
                hintText: "password",
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Color.fromARGB(255, 78, 97, 106),
                )),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 78, 97, 106),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 27,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: ElevatedButton(
              onPressed: () {
                print("LOGIN BUTTON");
              },
              child: const Text(
                'Log In',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9))),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Forget Password?',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                )),
          ),
          const SizedBox(
            height: 47,
          ),
          const Row(
            children: <Widget>[
              Expanded(
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text("OR"),
              ),
              Expanded(
                child: Divider(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 41,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: ElevatedButton(
              onPressed: () {
                print("new account");
              },
              child: const Text(
                'Create new Facebook account',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 20,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9))),
            ),
          ),
        ],
      ),
    );
  }
}
