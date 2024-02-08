import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialappflutter/model/response/post_model.dart';
import 'package:socialappflutter/ui/main_screen/profile/profile_bloc.dart';
import 'package:socialappflutter/ui/main_screen/profile/profile_event.dart';
import 'package:socialappflutter/ui/main_screen/profile/profile_state.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static String routeName = '/profile';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  final ProfileScreenBloc _profileScreenBloc = ProfileScreenBloc();
  late TabController _tabController;
  final List<PostItem> _userPosts = [];
  final List<PostItem> _userSavedPosts = [];
  int _currentTab = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _profileScreenBloc.add(ProfileScreenLoadDataEvent(
        userId: 'gcIPbK6kb1T5qEVVzN2xUlkhiL53', type: 0));
  }

  @override
  void dispose() {
    _profileScreenBloc.close();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text(
          "tuan1062001",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w800, fontSize: 18),
        ),
      ),
      body: BlocConsumer<ProfileScreenBloc, ProfileScreenState>(
        bloc: _profileScreenBloc,
        listener: (context, state) {
          if (state is SuccessLoadUserPost) {
            _userPosts.clear();
            _userPosts.addAll(state.postModel.data?.content ?? []);
          } else if (state is SuccessLoadUserSavedPost) {
            _userSavedPosts.clear();
            _userSavedPosts.addAll(state.postModel.data?.content ?? []);
          }
        },
        builder: (context, state) {
          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Flexible(
                      child: ClipOval(
                        child: Image.network(
                            height: 65,
                            width: 65,
                            fit: BoxFit.cover,
                            'https://firebasestorage.googleapis.com/v0/b/social-app-5e237.appspot.com/o/new_posts%2F1696233843871.%5Bjpg%2C%20jpg%2C%20jpg%2C%20jpg%2C%20jpg%5D?alt=media&token=7b6077cd-f48e-4223-9c49-744193d6d22d'),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(flex: 1, child: _buildColumnText('Posts', '5')),
                    Expanded(flex: 1, child: _buildColumnText('Follower', '5')),
                    Expanded(
                        flex: 1, child: _buildColumnText('Following', '5')),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Tuan1062001',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Hello theree',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black)),
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      'Chỉnh sửa trang cá nhân',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
              TabBar(
                onTap: (int index) {
                  setState(() {
                    _currentTab = index;
                  });
                },
                controller: _tabController,
                tabs: const [
                  Tab(
                      icon: Icon(
                    Icons.grid_on_rounded,
                    color: Colors.black,
                  )),
                  Tab(icon: Icon(Icons.bookmark_outline, color: Colors.black))
                ],
              ),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 50,
                    child: Image.network(
                        _userPosts[index].imagesList?[0].imageUrl ?? '',fit:BoxFit.cover,),
                  );
                },
                itemCount: _currentTab == 0
                    ? _userPosts.length
                    : _userSavedPosts.length,
                physics: const NeverScrollableScrollPhysics(),
              )
            ],
          );
        },
      ),
    );
  }

  Widget _buildColumnText(String title, String number) {
    return Column(children: [
      Text(
        title,
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.w700, fontSize: 16),
      ),
      Text(number,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16))
    ]);
  }
}
