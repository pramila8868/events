import 'package:flutter/material.dart';
//import 'package:flutter/flutter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_house/controller/categories_controller.dart';
//import 'package:bloc/bloc.dart';

// class MyApp1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: SafeArea(
//           child: Center(
//             child: BlocBuilder<TabBarCubit, int>(
//               builder: (context, state) {
//                 return Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       height: 50,
//                       child: TabBar(
//                         tabs: [
//                           Tab(icon: Icon(Icons.add)),
//                           Tab(icon: Icon(Icons.update)),
//                           Tab(icon: Icon(Icons.delete)),
//                         ],
//                         onTap: (index) =>
//                             context.read<TabBarCubit>().selectTab(index),
//                         indicator: UnderlineTabIndicator(
//                             borderSide:
//                                 BorderSide(width: 5.0, color: Colors.red)),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     Text('Selected Tab: $state'),
//                   ],
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MyApp1 extends StatelessWidget {
//   final _tabController = TabController(length: 3, vsync: ScrollableState());

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: SafeArea(
//           child: Center(
//             child: BlocBuilder<TabBarCubit, TabItem>(
//               builder: (context, state) {
//                 // _tabController.index = state.index;
//                 return Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       height: 50,
//                       child: TabBar(
//                         controller: _tabController,
//                         tabs: [
//                           Tab(icon: Icon(Icons.add)),
//                           Tab(icon: Icon(Icons.update)),
//                           Tab(icon: Icon(Icons.delete)),
//                         ],
//                         onTap: (index) {
//                           context
//                               .read<TabBarCubit>()
//                               .selectTab(TabItem.values[index]);
//                           //context.read<TabBarCubit>().
//                           //   context.read<TabBarCubit>().selectTab(TabItem.values[index]);
//                         },
//                         indicator: UnderlineTabIndicator(
//                             borderSide:
//                                 BorderSide(width: 5.0, color: Colors.red)),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     Text('Selected Tab: ${state.toString().split('.').last}'),
//                   ],
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MyApp1 extends StatefulWidget {
//   @override
//   _MyApp1State createState() => _MyApp1State();
// }

// class _MyApp1State extends State<MyApp1>
//     with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
//   final _tabController = TabController(length: 3, vsync: ScrollableState());
//   @override
//   bool get wantKeepAlive => true;

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     return MaterialApp(
//       home: Scaffold(
//         body: SafeArea(
//           child: Center(
//             child: BlocBuilder<TabBarCubit, TabItem>(
//               builder: (context, state) {
//                 return Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       height: 50,
//                       child: TabBar(
//                         controller: _tabController,
//                         tabs: [
//                           Tab(icon: Icon(Icons.add)),
//                           Tab(icon: Icon(Icons.update)),
//                           Tab(icon: Icon(Icons.delete)),
//                         ],
//                         onTap: (index) => context
//                             .read<TabBarCubit>()
//                             .selectTab(TabItem.values[index]),
//                         indicator: UnderlineTabIndicator(
//                             borderSide:
//                                 BorderSide(width: 5.0, color: Colors.red)),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     Text('Selected Tab: ${state.toString().split('.').last}'),
//                   ],
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//enum TabItem

// class MyApp1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: SafeArea(
//           child: Center(
//             child: BlocBuilder<TabBarCubit, TabItem>(
//               builder: (context, state) {
//                 return Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       height: 50,
//                       child: TabBar(
//                         controller: _tabController,
//                         tabs: [
//                           Tab(icon: Icon(Icons.add)),
//                           Tab(icon: Icon(Icons.update)),
//                           Tab(icon: Icon(Icons.delete)),
//                         ],
//                         onTap: (index) => context
//                             .read<TabBarCubit>()
//                             .selectTab(TabItem.values[index]),
//                         indicator: UnderlineTabIndicator(
//                             borderSide:
//                                 BorderSide(width: 5.0, color: Colors.red)),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     Text('Selected Tab: ${state.toString().split('.').last}'),
//                   ],
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MyApp1 extends StatefulWidget {
//   @override
//   _MyApp1State createState() => _MyApp1State();
// }

// class _MyApp1State extends State<MyApp1> with TickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => TabBarCubit(),
//       child: MaterialApp(
//         home: Scaffold(
//           body: SafeArea(
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     height: 50,
//                     child: TabBar(
//                       controller: _tabController,
//                       tabs: [
//                         Tab(icon: Icon(Icons.add)),
//                         Tab(icon: Icon(Icons.update)),
//                         Tab(icon: Icon(Icons.delete)),
//                       ],
//                       onTap: (index) => context
//                           .read<TabBarCubit>()
//                           .selectTab(TabItem.values[index]),
//                       indicator: UnderlineTabIndicator(
//                         borderSide: BorderSide(width: 5.0, color: Colors.red),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Text(
//                       'Selected Tab: ${context.read()<TabBarCubit>().state.toString()}'),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


enum TabOption { Places, Inspiration }

class TabCubit extends Cubit<TabOption> {
  TabCubit() : super(TabOption.Places);

  void selectTab(TabOption tab) => emit(tab);
}

class TabBars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<TabCubit, TabOption>(
            builder: (context, state) {
              return Container(
                child: TabBar(
                  labelPadding: EdgeInsets.only(left: 20),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.green,
                  isScrollable: true,
                  indicatorSize:TabBarIndicatorSize.label,
                  tabs: [
                    Tab(text: "Places"),
                    Tab(text: "Inspiration"),
                  ],
                  onTap: (index) {
                    BlocProvider.of<TabCubit>(context).selectTab(index == 0 ? TabOption.Places : TabOption.Inspiration);
                  },
                ),
              );
            },
          ),
          BlocBuilder<TabCubit, TabOption>(
            builder: (context, state) {
              return Container(
                height: 300,
                width: double.maxFinite,
                child: state == TabOption.Places ? Text("hi") : Text("Here"),
              );
            },
          ),
        ],
      ),
    );
  }
}