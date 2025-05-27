import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Messenger extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return _MessengerHome();
  }

}
class _MessengerHome extends State <Messenger> {
   ImagePicker imagePicker= ImagePicker();
   Future<XFile?> pickImage ()async{
     return await imagePicker.pickImage(source: ImageSource.gallery);
   }

   int _selectedIndex = 0 ;

  late File storyImage;

   void _onTapped(int index) {
    setState(() {
      _selectedIndex = index; 
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      leading: const CircleAvatar(
        radius: 47,
        backgroundImage: AssetImage('assets/image/Facebook_Messenger_logo_2020.svg.png'),
      ),
      title: const Text("Chats" , style: TextStyle(
        fontFamily: "playfair" ,
        fontWeight: FontWeight.bold ,
        color: Colors.black ,
        fontSize: 33 ,
      ),
      ),
      actions: [
        IconButton(onPressed: (){},
       icon: CircleAvatar(
        backgroundColor: Colors.grey.withOpacity(0.3),
        child: const Icon(Icons.camera_alt , color: Colors.black,),

       ),
       ),
        IconButton(onPressed: (){},
         icon: CircleAvatar(
          backgroundColor: Colors.grey.withOpacity(0.3),
          child: const Icon(
            Icons.edit,
            color: Colors.black,
          ),
         ),
         ),
      ],
     ),
     body: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14 ,vertical: 10),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: IconButton(
                onPressed: (){},
                 icon: const Icon(Icons.search),),
              hintText: "Search",
              filled: true ,
              fillColor: Colors.grey.withOpacity(0.3),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Colors.transparent),
              
              ),
            ),
          ),
          ),
        SizedBox(
          height: 56,
          width: double.infinity,
          child: ListView.separated(
             padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index){
            return Stack(
              alignment: Alignment.bottomRight,
              children: [
            Container(
              height: 56,
              width: 56,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              padding: 
              
              const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.transparent ,
                shape: BoxShape.circle ,
                border:
                index ==3 ? null :
                 Border.all(
                  color: Colors.green ,
                  width: 2 ,
                ),
              ),
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/image/b90050b391b152f2d41508dbc44414cc.jpg'),
              ),

            ),
            
          if(index ==0 ) GestureDetector(
            onTap: () async {
             XFile ? image = pickImage() as XFile?;
             storyImage = File(image!.path);
             setState(() {
               
             });
            },
            child: const CircleAvatar(
              radius: 10.5,
          backgroundColor: Colors.grey,
            child: Icon(
              Icons.add , 
              size: 14,
              color: Colors.black,
            ),
             ),
           )
            ]);
            
        },
         separatorBuilder: (context,index){
          return const SizedBox(width: 20,);
          }, 
          itemCount: 10,
          ),
        ), 
      const SizedBox(height: 35,),
      ListView.separated( 
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context,index) => const ListTile(
        leading: CircleAvatar(
          radius: 30,
                backgroundImage: AssetImage('assets/image/b304408f6711cd1fa4fa119eacde9a6b.jpg'),
              ),
              title: Text("TOM" , style: TextStyle(
                  fontFamily: "playfair" ,
                  color: Colors.black ,
                   fontWeight: FontWeight.bold ,
                  fontSize: 30 ,
      ),),
      subtitle: Text("Hi Jerry" ,
             style: TextStyle(
                  fontFamily: "playfair" ,
                  color: Color.fromARGB(255, 44, 43, 43) ,
                  fontSize: 19 ,
      ),
            ),
      ), separatorBuilder: (context,index){
        return const SizedBox (height: 20,);
      }, itemCount: 15)
      ]
     ),
     bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex, 
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Icon(Icons.chat),
                Positioned(
                  right: 0,
                  child: CircleAvatar(
                    radius: 7,
                    backgroundColor: Colors.red,
                    child: Text(
                      '10',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 5.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_call),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'People',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_library),
            label: 'Stories',
          ),
        ],
        onTap: _onTapped, 
      ),
    );
  }

}

 