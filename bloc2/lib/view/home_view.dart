import 'package:bloc2/core/bloc/spacex_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    var shipText = ' Ship Name: ';
    var flightNumber = ' Flight Number: ';
    var detailsText = ' Details: ';
    return BlocProvider(
      create: (context) => SpaceXBloc()..add(const SpaceFetched()),
      child: Scaffold(body: BlocBuilder<SpaceXBloc, SpaceXState>(
        builder: (context, state) {
          switch (state.status) {
            case PostStatus.failure:
              return const Center(
                child: Text("Bir Hata Oluştu"),
              );

            case PostStatus.success:
              if (state.ships.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return RefreshIndicator(
                onRefresh: () async {
                  //state.ships.clear(); 
                  //API'den gelen yeni değerin gözlenebilmesi açısından ikisi aynı sayfaya yazdırılmıştır.
                  context.read<SpaceXBloc>().add(const SpaceFetched());
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CustomScrollView(
                        slivers: [
                          const _MainAppBar(),
                          SliverList(
                              delegate:
                                  SliverChildBuilderDelegate((context, index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //Ship Image
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 30.0, bottom: 20),
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(state
                                        .ships[index].links!.patch!.small
                                        .toString()),
                                    radius: 70,
                                  ),
                                ),

                                //Flight Number
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      flightNumber,
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.black.withOpacity(0.6),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      ' ${state.ships[index].flightNumber.toString()}',
                                      style: const TextStyle(
                                          fontSize: 17,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                //Ship Name
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      shipText,
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.black.withOpacity(0.6),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      ' ${state.ships[index].name.toString()}',
                                      style: const TextStyle(
                                          fontSize: 17,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                //Details
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      detailsText,
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.black.withOpacity(0.6),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      state.ships[index].details.toString(),
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          }, childCount: state.ships.length))
                        ],
                      ),
                    ),
                  ],
                ),
              );
            default:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Lütfen Bekleyiniz.."),
                    CircularProgressIndicator(),
                  ],
                ),
              );
          }
        },
      )),
    );
  }
}

class _MainAppBar extends StatelessWidget {
  const _MainAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: MediaQuery.of(context).size.height * 0.15,
      backgroundColor: Colors.black,
      flexibleSpace: const FlexibleSpaceBar(
        title: Text('SpaceX'),
        centerTitle: true,
      ),
    );
  }
}
