import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_travller_frontend_starter/src/models/mock_itinerary.dart';

class ItineraryScreen extends StatefulWidget {
  const ItineraryScreen({super.key});

  @override
  _ItineraryScreenState createState() => _ItineraryScreenState();
}

class _ItineraryScreenState extends State<ItineraryScreen> {
  int _selectedDay = 1;
  String _nearbyFilter = "Restaurants";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                expandedHeight: 150.0,
                backgroundColor: Colors.white,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),

                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: const EdgeInsets.only(
                    left: 24,
                    bottom: 16,
                    right: 24,
                  ),
                  title: Text(
                    mockItinerary['tripName'],
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8,
                  ),
                  child: Column(
                    children: [
                      _buildDaySelector(),
                      const SizedBox(height: 16),
                      // ClipRRect(
                      //   borderRadius: BorderRadius.circular(16),
                      //   child: Image.network(
                      //     'https://placehold.co/600x300/e8e8e8/aaaaaa?text=Map+Placeholder',
                      //     fit: BoxFit.cover,
                      //     height: 180,
                      //     width: double.infinity,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              _buildActivityList(),
              _buildNearbySuggestions(),
            ],
          )
          .animate()
          .fade(duration: 500.ms)
          .slide(begin: const Offset(0, 0.1), duration: 500.ms),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.pop();
        },
        icon: const Icon(Icons.refresh, color: Colors.white),
        backgroundColor: const Color(0xFF00A3FF),
        label: const Text('Regenerate', style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _buildDaySelector() {
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(5, (index) {
          final day = index + 1;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: ChoiceChip(
              label: Text('Day $day'),
              selected: _selectedDay == day,
              onSelected: (selected) {
                if (selected) setState(() => _selectedDay = day);
              },
              backgroundColor: Colors.grey[200],
              selectedColor: const Color(0xFF00A3FF),
              labelStyle: TextStyle(
                color: _selectedDay == day ? Colors.white : Colors.black,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(color: Colors.transparent),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildActivityList() {
    final activities = mockItinerary['days'][0]['activities'] as List;
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          final activity = activities[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            elevation: 2,
            color: Colors.white,
            shadowColor: Colors.grey.withOpacity(0.2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ExpansionTile(
              title: Text(
                activity['title'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              shape: const Border(),
              childrenPadding: const EdgeInsets.all(16).copyWith(top: 0),
              children: [
                _buildDetailRow(Icons.access_time_filled, activity['time']),
                const SizedBox(height: 8),
                _buildDetailRow(Icons.location_on, activity['location']),
                const SizedBox(height: 16),
                Text(
                  activity['description'],
                  style: TextStyle(color: Colors.grey[700], height: 1.5),
                ),
              ],
            ),
          );
        }, childCount: activities.length),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF00A3FF), size: 20),
        const SizedBox(width: 12),
        Expanded(child: Text(text, style: TextStyle(color: Colors.grey[800]))),
      ],
    );
  }

  Widget _buildNearbySuggestions() {
    final suggestions =
        mockItinerary['nearbySuggestions']['restaurants'] as List;
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 100), // Padding for FAB
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Nearby Suggestions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildNearbyFilterChip("Restaurants"),
                const SizedBox(width: 8),
                _buildNearbyFilterChip("Hotels"),
              ],
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: suggestions.length,
              itemBuilder: (context, index) {
                final suggestion = suggestions[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          suggestion['image'],
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              suggestion['name'],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 16,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '${suggestion['rating']} (${suggestion['reviews']} reviews)',
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              suggestion['details'],
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'View Details',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNearbyFilterChip(String label) {
    final bool isSelected = _nearbyFilter == label;
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        if (selected) setState(() => _nearbyFilter = label);
      },
      backgroundColor: Colors.grey[200],
      selectedColor: const Color(0xFF00A3FF),
      labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
      avatar: Icon(
        label == "Restaurants" ? Icons.restaurant : Icons.hotel,
        color: isSelected ? Colors.white : Colors.black54,
        size: 18,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: Colors.transparent),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    );
  }
}
