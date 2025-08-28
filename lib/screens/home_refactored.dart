import 'dart:convert';

import 'package:eduatlas/Theme/theme.dart';
import 'package:eduatlas/screens/settings_refactored.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../models/model.dart';
import '../services/api.dart';
import '../utils/url_launcher_utils.dart';
import '../widgets/common/custom_snackbar.dart';
import '../widgets/home/animated_app_bar.dart';
import '../widgets/home/search_section.dart';
import '../widgets/home/university_list_section.dart';
import '../widgets/university/university_detail_dialog.dart';

class UniversityListScreen extends StatefulWidget {
  const UniversityListScreen({super.key});

  @override
  State<UniversityListScreen> createState() => _UniversityListScreenState();
}

class _UniversityListScreenState extends State<UniversityListScreen>
    with TickerProviderStateMixin {
  final TextEditingController _countryController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _searchFocusNode = FocusNode();

  List<University> _universities = [];
  List<String> _countryList = [];
  bool _isLoading = false;
  bool _showBackToTop = false;
  String _selectedCountry = '';

  late AnimationController _fabAnimationController;
  late AnimationController _headerAnimationController;
  late Animation<double> _fabAnimation;
  late Animation<double> _headerAnimation;

  @override
  void initState() {
    super.initState();
    _fetchCountries();
    _scrollController.addListener(_scrollListener);

    _fabAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _headerAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _fabAnimation = CurvedAnimation(
      parent: _fabAnimationController,
      curve: Curves.elasticOut,
    );
    _headerAnimation = CurvedAnimation(
      parent: _headerAnimationController,
      curve: Curves.easeOutCubic,
    );

    _headerAnimationController.forward();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    _searchFocusNode.dispose();
    _fabAnimationController.dispose();
    _headerAnimationController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >= 400) {
      if (!_showBackToTop) {
        setState(() {
          _showBackToTop = true;
        });
        _fabAnimationController.forward();
      }
    } else {
      if (_showBackToTop) {
        setState(() {
          _showBackToTop = false;
        });
        _fabAnimationController.reverse();
      }
    }
  }

  void _scrollToTop() {
    HapticFeedback.lightImpact();
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeOutCubic,
    );
  }

  Future<void> _fetchCountries() async {
    try {
      final response = await http.get(
        Uri.parse('https://restcountries.com/v3.1/all'),
      );
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        setState(() {
          _countryList = data
              .map((country) => country['name']['common'] as String)
              .toList();
          _countryList.sort();
        });
      }
    } catch (e) {
      CustomSnackBar.showError(context, 'Failed to fetch countries');
    }
  }

  void _fetchUniversities(String country) async {
    if (country.isEmpty) return;

    HapticFeedback.selectionClick();
    setState(() {
      _isLoading = true;
      _selectedCountry = country;
    });

    try {
      final universities = await UniversityService.fetchUniversities(country);
      setState(() {
        _universities = universities;
        _isLoading = false;
      });

      if (universities.isEmpty) {
        CustomSnackBar.showInfo(context, 'No universities found for $country');
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      CustomSnackBar.showError(
        context,
        'Failed to fetch universities for $country',
      );
    }
  }

  void _openSettings() {
    HapticFeedback.selectionClick();
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => const SettingsScreen()));
  }

  void _showUniversityDetails(University university) {
    HapticFeedback.selectionClick();
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return UniversityDetailDialog(
          university: university,
          onOpenLink: (url) =>
              UrlLauncherUtils.openUniversityLink(context, url),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;

    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: [
          AnimatedAppBar(
            onSettingsPressed: _openSettings,
            headerAnimation: _headerAnimation,
          ),
          SearchSection(
            countryList: _countryList,
            onCountrySelected: _fetchUniversities,
            controller: _countryController,
            focusNode: _searchFocusNode,
            isDark: isDark,
            isLoading: _isLoading,
            universities: _universities,
            selectedCountry: _selectedCountry,
            headerAnimation: _headerAnimation,
          ),
          UniversityListSection(
            universities: _universities,
            onUniversityTap: _showUniversityDetails,
          ),
        ],
      ),
      floatingActionButton: ScaleTransition(
        scale: _fabAnimation,
        child: FloatingActionButton.extended(
          onPressed: _scrollToTop,
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
          icon: const Icon(Icons.keyboard_arrow_up),
          label: const Text('Top'),
          elevation: 8,
          heroTag: "backToTop",
        ),
      ),
    );
  }
}
