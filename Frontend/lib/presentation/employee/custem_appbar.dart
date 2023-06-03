
import 'package:flutter/material.dart';
import 'package:oneone/Presentation/widget/profile_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function() onBackArrowPressed; // callback function for back arrow

  
  const CustomAppBar({Key? key, required this.onBackArrowPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 7,
      backgroundColor: Colors.black,
      leading: IconButton( // arrow button
        icon: const Icon(Icons.arrow_back),
        onPressed: onBackArrowPressed,
      ),
      title: const Text('Your Cars',
      style: TextStyle(
        color: Colors.white,
         fontSize: 16,
         fontWeight: FontWeight.w400,
 ),),
      centerTitle: true,
      shape: const ContinuousRectangleBorder( 
        // curved shape
        borderRadius: BorderRadius.only(
         
          bottomRight: Radius.circular(300),
        ),
      ),
      actions: [ProfileWidget()],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 5); // adjust height as needed

}



