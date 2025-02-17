import 'package:flutter/material.dart';
import '../../data/api/gif_api.dart';
import '../widgets/gif_list/gif_list.dart';
import '../widgets/gif_search_bar/gif_search_bar.dart';
import '../indicators/loading_indicator.dart';
import '../indicators/error_message.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final GifService _gifService = GifService();
  List<dynamic> _gifs = [];
  bool _isLoading = false;
  bool _isFetchingMore = false;
  String _errorMessage = "";
  int _page = 0;
  bool _hasMore = true;
  String _currentQuery = "";
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  Future<void> _searchGifs(String query, {bool isNewSearch = true}) async {
    if (_isLoading || _isFetchingMore) return;

    setState(() {
      if (isNewSearch) {
        _isLoading = true;
        _gifs.clear();
        _page = 0;
        _hasMore = true;
        _currentQuery = query;
        _errorMessage = "";
      } else {
        _isFetchingMore = true;
      }
    });

    try {
      final results = await _gifService.searchGifs(query, page: _page);
      setState(() {
        if (results.isNotEmpty) {
          _gifs.addAll(results);
          _page++; // Move to the next page
        } else {
          _hasMore = false; // No more GIFs to fetch
        }
      });
    } catch (error) {
      setState(() => _errorMessage = error.toString());
    } finally {
      setState(() {
        _isLoading = false;
        _isFetchingMore = false;
      });
    }
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent * 0.9 &&
        _hasMore &&
        !_isLoading &&
        !_isFetchingMore) {
      _searchGifs(_currentQuery, isNewSearch: false);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Giphy Search")),
      body: Column(
        children: [
          GifSearchBar(onSearch: (query) => _searchGifs(query, isNewSearch: true)),
          if (_isLoading) LoadingIndicator(),
          if (_errorMessage.isNotEmpty) ErrorMessage(message: _errorMessage),
          Expanded(
            child: GifList(
              gifs: _gifs,
              isLoadingMore: _isFetchingMore,
              scrollController: _scrollController,
            ),
          ),
        ],
      ),
    );
  }
}
