import 'package:flutter/material.dart';
import 'package:movies/API/api_manager_search.dart';
import 'package:movies/Model/MovieSearch.dart';
import 'package:movies/app_colors.dart';

class SearchTopBar extends StatefulWidget {
  final Function(String) onSearch;  // Callback to pass search query

  const SearchTopBar({super.key, required this.onSearch});

  @override
  State<SearchTopBar> createState() => _SearchTopBarState();
}

class _SearchTopBarState extends State<SearchTopBar> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: Theme.of(context)
          .textTheme
          .titleSmall
          ?.copyWith(fontSize: 18,color: AppColors.whiteColor),
      onChanged: widget.onSearch,  // Trigger parent callback on change
      decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.greyColor,
          border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          hintText: 'Search',
          hintStyle: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(color: AppColors.greyColor),
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.whiteColor,
            size: 30,
          ),
          suffixIcon: controller.text.isNotEmpty
              ? IconButton(
              icon: const Icon(
                Icons.clear,
                color: AppColors.whiteColor,
              ),
              onPressed: () {
                controller.clear();
                widget.onSearch(''); // Clear search when input is cleared
              })
              : null),
    );
  }
}
