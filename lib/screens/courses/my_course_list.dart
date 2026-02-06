import 'package:flutter/material.dart';
import 'package:online_learning_app/component/bottom_option.dart';
import 'package:online_learning_app/component/shopping_cart_option.dart';
import 'package:online_learning_app/constants.dart';
import 'package:online_learning_app/data_provider/my_course_data_provider.dart';
import '../../model/my_course.dart';

enum MyCourseFilter { all, downloaded, archived }

class MyCourseList extends StatefulWidget {
  const MyCourseList({super.key});

  @override
  State<MyCourseList> createState() => _MyCourseListState();
}

class _MyCourseListState extends State<MyCourseList> {
  MyCourseFilter _selectedFilter = MyCourseFilter.all;

  @override
  Widget build(BuildContext context) {
    final List<MyCourse> myCourseList = MyCourseDataProvider.myCourse;

    // Demo progress and downloaded/archived status for sample data
    if (myCourseList.isNotEmpty) {
      myCourseList[0].isDownloaded = true;
      if (myCourseList.length > 1) {
        myCourseList[1].isDownloaded = true;
        myCourseList[1].progress = 50;
      }
      if (myCourseList.length > 2) {
        myCourseList[2].isArchived = true;
        myCourseList[2].progress = 20;
      }
    }

    final List<MyCourse> filteredCourses = _getFilteredCourses(myCourseList);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "My Courses",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade900,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildFilterChip(
                      title: "All Courses",
                      isSelected: _selectedFilter == MyCourseFilter.all,
                      onTap: () {
                        setState(() {
                          _selectedFilter = MyCourseFilter.all;
                        });
                      },
                    ),
                    _buildFilterChip(
                      title: "Downloaded Courses",
                      isSelected: _selectedFilter == MyCourseFilter.downloaded,
                      onTap: () {
                        setState(() {
                          _selectedFilter = MyCourseFilter.downloaded;
                        });
                      },
                    ),
                    _buildFilterChip(
                      title: "Archived Courses",
                      isSelected: _selectedFilter == MyCourseFilter.archived,
                      onTap: () {
                        setState(() {
                          _selectedFilter = MyCourseFilter.archived;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: filteredCourses.isEmpty
                    ? Center(
                        child: Text(
                          "No courses found in this list.",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: filteredCourses.length,
                        itemBuilder: (context, index) {
                          MyCourse myCourse = filteredCourses[index];
                          return _getMyCourse(myCourse, context);
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: const ShoppingCartOption(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomOption(selectedIndex: 2),
    );
  }

  List<MyCourse> _getFilteredCourses(List<MyCourse> courses) {
    switch (_selectedFilter) {
      case MyCourseFilter.downloaded:
        return courses.where((c) => c.isDownloaded && !c.isArchived).toList();
      case MyCourseFilter.archived:
        return courses.where((c) => c.isArchived).toList();
      case MyCourseFilter.all:
      default:
        return courses;
    }
  }

  Widget _buildFilterChip({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: InkWell(
        onTap: onTap,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? kPrimaryColor : Colors.grey.shade500,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Colors.grey.shade900),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getMyCourse(MyCourse myCourse, BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(myCourse.course.thumbnailUrl),
        title: Text(
          myCourse.course.title,
          maxLines: 2,
          style: TextStyle(
            fontSize: 17,
            color: Colors.grey.shade800,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              myCourse.course.createdBy,
              style: TextStyle(
                color: Colors.grey.shade500,
              ),
            ),
            const SizedBox(height: 10),
            Visibility(
              visible: myCourse.progress > 0,
              replacement: Text(
                "Start Course",
                style: TextStyle(
                  color: kBlueColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 3,
                        thumbColor: Colors.transparent,
                        overlayShape: SliderComponentShape.noThumb,
                        thumbShape: SliderComponentShape.noThumb,
                      ),
                      child: Slider(
                        min: 0,
                        max: 100,
                        value: myCourse.progress.toDouble(),
                        onChanged: (val) {},
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text("${myCourse.progress}%"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

