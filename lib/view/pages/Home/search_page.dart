import 'package:flutter/material.dart';
import 'package:fusionpower/constant/colors.dart';
import 'package:fusionpower/controllers/serach_controller.dart';
import 'package:get/get.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 12,
              top: 24,
            ),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 52,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      cursorColor: greyDark,
                      style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: greyDark),
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: "Search",
                        hintStyle: const TextStyle(
                          fontSize: 17,
                          color: Color(0xFFAEAEB2),
                        ),
                        prefixIcon:
                            const Icon(Icons.search, color: Color(0xFFAEAEB2)),
                        filled: true,
                        fillColor: const Color(0xFFF4F4F4),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              const BorderSide(color: Color(0xFFEFEFF0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              const BorderSide(color: Color(0xFFEFEFF0)),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 11,
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Text(
                    "Cancel",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 12, top: 24),
            child: Row(children: [
              Text(
                "Recent Search",
                style: TextStyle(
                  color: labelColorPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Text(
                  "View All",
                  style: TextStyle(fontSize: 14, color: labelColorPrimary),
                ),
              )
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 16,
              left: 16,
            ),
            child: GetBuilder<SearchController>(builder: (controller) {
              final recentSearches = controller.recentSearches;
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount:
                    recentSearches.length > 2 ? 2 : recentSearches.length,
                itemBuilder: (context, index) {
                  return _SearchProductItem(search: recentSearches[index]);
                },
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 12, top: 24),
            child: Row(children: [
              Text(
                "Popular Search",
                style: TextStyle(
                  color: labelColorPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Text(
                  "View All",
                  style: TextStyle(fontSize: 14, color: labelColorPrimary),
                ),
              )
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 16,
              left: 16,
            ),
            child: GetBuilder<SearchController>(builder: (controller) {
              final popularSearches = controller.popularSearches;
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount:
                    popularSearches.length > 2 ? 2 : popularSearches.length,
                itemBuilder: (context, index) {
                  return _SearchProductItem(search: popularSearches[index]);
                },
              );
            }),
          ),
        ]),
      ),
    );
  }
}

class _SearchProductItem extends StatelessWidget {
  const _SearchProductItem({
    required this.search,
    Key? key,
  }) : super(key: key);

  final String search;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(8),
      child: Row(children: [
        Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xFFE5E5EA),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          search,
          style: const TextStyle(
            color: labelColorPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Spacer(),
        GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.close,
              color: Colors.black,
            ))
      ]),
    );
  }
}
