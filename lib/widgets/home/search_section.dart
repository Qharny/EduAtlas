import 'package:flutter/material.dart';

import '../common/empty_state_widget.dart';
import '../common/loading_widget.dart';
import '../search/country_search_field.dart';

class SearchSection extends StatelessWidget {
  final List<String> countryList;
  final Function(String) onCountrySelected;
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool isLoading;
  final List<dynamic> universities;
  final String selectedCountry;
  final Animation<double> headerAnimation;

  const SearchSection({
    super.key,
    required this.countryList,
    required this.onCountrySelected,
    required this.controller,
    required this.focusNode,
    required this.isLoading,
    required this.universities,
    required this.selectedCountry,
    required this.headerAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeTransition(
              opacity: headerAnimation,
              child: Text(
                'Search Universities',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.headlineSmall?.color,
                  fontSize: 28,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Enter a country name to discover its universities',
              style: TextStyle(
                color: Theme.of(context).textTheme.bodySmall?.color,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            CountrySearchField(
              countryList: countryList,
              onCountrySelected: onCountrySelected,
              controller: controller,
              focusNode: focusNode,
            ),
            const SizedBox(height: 16),
            if (selectedCountry.isNotEmpty) _buildSelectedCountryInfo(context),
            if (isLoading) ...[
              const SizedBox(height: 40),
              const LoadingWidget(message: 'Fetching universities...'),
            ] else if (universities.isEmpty && selectedCountry.isNotEmpty) ...[
              const SizedBox(height: 40),
              const EmptyStateWidget(
                icon: Icons.search_off,
                title: 'No universities found',
                subtitle: 'Try searching for a different country',
              ),
            ] else if (universities.isEmpty) ...[
              const SizedBox(height: 40),
              const EmptyStateWidget(
                icon: Icons.school_outlined,
                title: 'Ready to explore!',
                subtitle: 'Search for a country to get started',
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedCountryInfo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.black.withOpacity(0.05)
            : Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.black.withOpacity(0.1)
              : Colors.white.withOpacity(0.1),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.location_on,
            color: Theme.of(context).iconTheme.color,
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Showing universities in $selectedCountry',
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge?.color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            '${universities.length} found',
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyLarge?.color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
