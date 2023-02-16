// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:open_house/const/colors.dart';
import 'package:open_house/past_event_cubit/cubit/pastevent_cubit.dart';
import 'package:open_house/past_event_cubit/cubit/pastevent_state.dart';

import '../controller/favouritscubit.dart';

class Events extends StatefulWidget {
  // PastEvent pastevent;
  const Events({
    super.key,
    //required this.pastevent
  });

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cubit = context.read<PastEventCubit>();
      cubit.fetchPastEvent();
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final favoriteCubit = context.read<FavoriteCubit>();
    // context.read<OrganizationCubit>().fetchPosts();
    return BlocBuilder<PastEventCubit, PastEventState>(
        builder: (context, state) {
      //if(state ==)
      if (state is InitPastEventState) //|| state is LoadingPastEventState)
      {
        return const Text("Data is initialize"); // CircularProgressIndicator();
      } else if (state is LoadingPastEventState) {
        return const CircularProgressIndicator(
          color: Colors.red,
          strokeWidth: 10,
          semanticsValue: "1",
        );
      } else if (state is LoadedPastEventState) {
        final pasteventlist = state.pastevent;
        return GridView.builder(
            itemCount: pasteventlist.length, //state.length, //userList
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 5.0, mainAxisSpacing: 2.0),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                //  height: 800,

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6), color: eventcolor

                    //color: Colors.yellow
                    ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(children: [
                      Image.network(
                        pasteventlist[index].image.toString(),
                        height: 82,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      BlocBuilder<FavoriteCubit, bool>(
                          builder: (context, isFavorite) {
                        return Positioned(
                          right: 10,
                          top: 5,
                          child: CircleAvatar(
                            radius: 12,
                            backgroundColor: eventcolor,
                            child: InkWell(
                              onTap: () {
                                context.read<FavoriteCubit>().toggle();
                                // context.read<PastEventCubit>().toggleInterested(
                              },
                              child: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                size: 15,
                                //      isFavorite ? Icons.favorite : Icons.favorite_border,
                                color: isFavorite ? Colors.red : null,
                                //Icons.favorite,
                                //
                              ),
                            ),
                          ),
                        );
                      })
                    ]),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        pasteventlist[index].name.toString(),
                        softWrap: false,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: text1,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Roboto"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6.0),
                      child: Text(
                        pasteventlist[index].venue.toString(),
                        softWrap: false,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: text1,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Roboto"),
                      ),
                    ),
                  ],
                ),
              );
            });
      } else if (state is ErrorTPastEventState) {
        return Text(
          state.message,
          style: const TextStyle(color: Colors.white),
        );
      } else if (state is ApiNoData) {
        return const Text(
          "No Data",
          style: TextStyle(color: Colors.white),
        );
      } else if (state is ApiNoInternet) {
        return const Text(
          "No internet connection",
          style: TextStyle(color: Colors.white),
        );
      }
      return Text(state.toString());
    });
    //   }
    //  ));
  }
}
