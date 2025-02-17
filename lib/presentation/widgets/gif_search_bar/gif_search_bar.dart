import 'dart:async';
import 'package:flutter/material.dart';

class GifSearchBar extends StatefulWidget {
  final Function(String) onSearch;

  const GifSearchBar({super.key, required this.onSearch});

  @override
  _GifSearchBarState createState() => _GifSearchBarState();
}

class _GifSearchBarState extends State<GifSearchBar> {
  Timer? _debounce;

  void _onTextChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(Duration(milliseconds: 2000), () {
      widget.onSearch(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(20),
          hintText: "Search GIFs...",
          suffixIcon: Icon(Icons.search),
        ),
        onChanged: _onTextChanged,
      ),
    );
  }
}