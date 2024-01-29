import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialappflutter/model/response/post_model.dart';
import 'package:socialappflutter/ui/main_screen/home/home_screen_bloc.dart';
import 'package:socialappflutter/ui/main_screen/home/home_screen_event.dart';
import 'package:socialappflutter/ui/main_screen/home/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _bloc = HomeScreenBloc();
  bool isLoading = false;
  bool canLoad = true;
  final ScrollController _scrollController = ScrollController();
  final List<PostItem> _listOfPost = [];
  int pageNumber = 1;

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange &&
        !isLoading &&
        canLoad) {
      _loadMoreItems();
    }
  }

  Future<void> _loadMoreItems() async {
    setState(() {
      isLoading = true;
    });
    pageNumber = pageNumber + 1;
    _bloc.add(LoadNewFeedEvent(pageNumber: pageNumber));
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    _bloc.add(LoadNewFeedEvent(pageNumber: 1));
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('TravelGo'),
        ),
        body: BlocConsumer<HomeScreenBloc, HomeScreenState>(
          bloc: _bloc,
          listener: (context, state) {
            if (state is PostLoadedSuccess) {
              if (state.postModel.data?.last == true) {
                canLoad = false;
              } else {
                canLoad = true;
              }
            }
          },
          builder: (context, state) {
            switch (state.runtimeType) {
              case PostLoadedSuccess:
                final successState = state as PostLoadedSuccess;
                for (PostItem i in successState.postModel.data?.content ?? []) {
                  _listOfPost.add(i);
                }
                print("HEHA ${_listOfPost.length}");
                return ListView.builder(
                  itemBuilder: (context, index) {
                    if (index == _listOfPost.length) {
                      _buildLoadMoreIndicator();
                    } else {
                      return postItem(_listOfPost[index], index);
                    }
                  },
                  controller: _scrollController,
                  itemCount: _listOfPost.length,
                );
              default:
                return Container();
            }
          },
        ));
  }

  Widget _buildLoadMoreIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () {
                  _loadMoreItems();
                },
                child: const Text('Load More'),
              ),
      ),
    );
  }

  Widget postItem(PostItem data, int position) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ClipOval(
                  child: Image.network(
                    data.postUserId?.imageUrl ?? '',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${data.postUserId?.userName}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      ),
                      Text(
                        '${data.checkInAddress}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                      ),
                      Text(
                        '${data.checkInTimestamp}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                      )
                    ],
                  ),
                ),
                const Expanded(
                    child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.more_vert_outlined),
                ))
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 320,
            child: PageView.builder(
                itemCount: data.imagesList?.length ?? 0,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(
                          data.imagesList?[index].imageUrl ?? '',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(width: 2)),
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: Text(
                              '${index + 1}/${data.imagesList?.length}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 16),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                }),
          ),
          Row(
            children: const [
              IconButton(
                icon: Icon(
                  Icons.heart_broken_outlined,
                  color: Colors.black,
                ),
                onPressed: null,
                iconSize: 32,
              ),
              IconButton(
                icon: Icon(
                  Icons.mode_comment_outlined,
                  color: Colors.black,
                ),
                onPressed: null,
                iconSize: 32,
              ),
              Spacer(),
              IconButton(
                icon: Icon(
                  Icons.share,
                  color: Colors.black,
                ),
                onPressed: null,
                iconSize: 32,
              ),
              IconButton(
                icon: Icon(
                  Icons.bookmark_outline,
                  color: Colors.black,
                ),
                onPressed: null,
                iconSize: 32,
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 10,
            color: Colors.grey.shade300,
          )
        ],
      ),
    );
  }
}
