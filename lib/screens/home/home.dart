import 'package:flutter/material.dart';
import 'package:frontend_engineer_test/screens/home/widgets/itemList.dart';
import 'package:frontend_engineer_test/providers/university_provider_service.dart';
import 'package:provider/provider.dart';

import '../../models/university.dart';
import '../university_screen_detail.dart';

enum TypeView { grid, list }

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

int _crossAxisCount = 2;
double _aspectRatio = 1.7;
TypeView _typeView = TypeView.grid;
List<University>? college = [];
bool? isGrid;

class _HomeState extends State<Home> {
  @override
  void initState() {
    isGrid = true;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await context.read<UniversityProvider>().getCollege();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UniversityProvider>(
        builder: (_, UniversityProvider model, __) {
      college = model.getColleges;
      if (college == []) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      return Scaffold(
        appBar: AppBar(
          title: Text('Frontend Engenier Test'),
          actions: [],
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.grey[200]),
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(_typeView == TypeView.list
                        ? Icons.view_list
                        : Icons.grid_on),
                    onPressed: () {
                      if (_typeView == TypeView.list) {
                        _crossAxisCount = 2;
                        _aspectRatio = 1.7;
                        _typeView = TypeView.grid;
                      } else {
                        _crossAxisCount = 1;
                        _aspectRatio = 3;
                        _typeView = TypeView.list;
                      }
                      setState(() {});
                    },
                  ),
                  Text(
                    _typeView == TypeView.list ? 'ListView' : 'Gridview',
                    style: TextStyle(fontSize: 18),
                  ),
                  Spacer(),
                  Switch(
                      value: isGrid!,
                      onChanged: (value) {
                        isGrid = value;
                        if (_typeView == TypeView.list) {
                          _crossAxisCount = 2;
                          _aspectRatio = 1.7;
                          _typeView = TypeView.grid;

                          setState(() {});
                        } else {
                          _crossAxisCount = 1;
                          _aspectRatio = 3;
                          _typeView = TypeView.list;

                          setState(() {});
                        }
                      })
                ],
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: _crossAxisCount,
                  childAspectRatio: _aspectRatio,
                  children: college!.map((u) {
                    return GestureDetector(
                      child: ItemGrid(
                        data: u,
                        typeView: _typeView,
                      ),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UniversityDetail(
                                  u: u,
                                )),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class ImageData {
  String path;
  String title;
  String date;
  ImageData(this.path, this.title, this.date);
}
