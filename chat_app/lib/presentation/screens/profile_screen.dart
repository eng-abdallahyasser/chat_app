import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/services/storage/storege_services.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final AuthService _authService = AuthService();
  final StoregeServices _storegeServices = StoregeServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            _authService.getCurrentUser()!.displayName ?? "not found",
            style: const TextStyle(
              color: Color(0xffc199cd),
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: const Color(0xFF553370),
          iconTheme: const IconThemeData(
            color: Color(0xffc199cd), //change your color here
          ),
        ),
        backgroundColor: const Color(0xFF553370),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FutureBuilder(
                  future: _storegeServices
                      .getProfilePic(_authService.getCurrentUser()!.uid),
                  builder: (context, snapshot) {
                    if (snapshot.hasError ||
                        (!snapshot.hasData || snapshot.data == null)) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(300),
                          child: Image.asset(
                            "assets/images/placeholder.jpg",
                            height: MediaQuery.of(context).size.width / 1.7,
                            width: MediaQuery.of(context).size.width / 1.7,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(
                          width: MediaQuery.of(context).size.width / 1.7,
                          height: MediaQuery.of(context).size.width / 1.7,
                          margin: const EdgeInsets.symmetric(vertical: 30),
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ));
                    }
                    return Container(
                      width: MediaQuery.of(context).size.width / 1.7,
                      height: MediaQuery.of(context).size.width / 1.7,
                      margin: const EdgeInsets.symmetric(vertical: 30),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: MemoryImage(snapshot.data!),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle,
                      ),
                    );
                  },
                ),
                GestureDetector(
                    onTap: _storegeServices.uploadProfilePic,
                    child: const Text(
                      'Change Profile Picture',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF553370),
                          fontWeight: FontWeight.w500),
                    ))
              ],
            )));
  }
}
