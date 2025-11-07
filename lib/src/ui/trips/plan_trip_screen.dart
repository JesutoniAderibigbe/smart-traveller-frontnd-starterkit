import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_travller_frontend_starter/src/constants/color_constant.dart';
import 'package:intl/intl.dart';

class PlanTripScreen extends StatefulWidget {
  const PlanTripScreen({super.key});

  @override
  State<PlanTripScreen> createState() => _PlanTripScreenState();
}

class _PlanTripScreenState extends State<PlanTripScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _destinationController = TextEditingController();
  final TextEditingController _travelersController = TextEditingController(
    text: '1',
  );

  DateTime? _startDate;
  DateTime? _endDate;

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        if (isStartDate) {
          _startDate = picked;
        }
      });
    }
  }

  String _displayDate(DateTime date) {
    return DateFormat('MMM dd, yyyy').format(date);
  }

  double _budget = 500;

  final Set<String> _selectedInterests = {'Culture'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorConstant.whiteColor,
        centerTitle: true,
        title: const Text(
          'Plan Your Trip',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
      ),

      //let's validate our form in the body to fully authenticate our request to our genkite trip api
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle("Where to?"),

              TextFormField(
                controller: _destinationController,
                decoration: InputDecoration(
                  hintText: 'e.g., Paris, Tokyo, New York',
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color(0xFF00A3FF),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color(0xFF00A3FF),
                      width: 2,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a destination';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 24.0),

              _buildSectionTitle("When are you going?"),

              Row(
                children: [
                  Expanded(
                    child: _buildDateSelector(
                      label: 'Start Date',
                      date: _startDate,
                      onTap: () => _selectDate(context, true),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildDateSelector(
                      label: 'End Date',
                      date: _endDate,
                      onTap: () => _selectDate(context, false),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24.0),

              _buildSectionTitle("Number of travelers?"),

              TextFormField(
                controller: _travelersController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'How many people?',
                  prefixIcon: const Icon(
                    Icons.people,
                    color: Color(0xFF00A3FF),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color(0xFF00A3FF),
                      width: 2,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter number of travelers';
                  }
                  final number = int.tryParse(value);
                  if (number == null || number < 1) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 24.0),

              _buildSectionTitle('Budget (NGN)'),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFE0F7FF).withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        '\#${_budget.round().toStringAsFixed(0)}',
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF00A3FF),
                        ),
                      ),
                    ),
                    Slider(
                      value: _budget,
                      onChanged: (value) => setState(() => _budget = value),
                      min: 500,
                      max: 50000,
                      divisions: 99,
                      activeColor: const Color(0xFF00A3FF),
                      inactiveColor: Colors.grey[300],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('#500', style: TextStyle(color: Colors.grey[600])),
                        Text(
                          '#50,000',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24.0),

              _buildSectionTitle('What are your interests?'),

              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  _buildInterestChip('Culture'),
                  _buildInterestChip('Adventure'),
                  _buildInterestChip('Relaxation'),
                  _buildInterestChip('Nature'),
                  _buildInterestChip('Food & Drink'),
                  _buildInterestChip('History'),
                  _buildInterestChip('Shopping'),
                  _buildInterestChip('Nightlife'),
                ],
              ),

              const SizedBox(height: 48),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00A3FF),
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: Colors.grey.shade300,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    context.push('/itinerary-screen');
                  },
                  child: Text(
                    'Generate Itinerary',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildDateSelector({
    required String label,
    required DateTime? date,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              Icons.calendar_today,
              size: 20,
              color: date != null ? const Color(0xFF00A3FF) : Colors.grey,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    date != null ? _displayDate(date) : 'Select date',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight:
                          date != null ? FontWeight.w600 : FontWeight.normal,
                      color: date != null ? Colors.black87 : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInterestChip(String label) {
    final bool isSelected = _selectedInterests.contains(label);
    return FilterChip(
      label: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black87,
          fontSize: 12,
        ),
      ),
      selected: isSelected,

      onSelected: (selected) {
        setState(() {
          if (selected) {
            _selectedInterests.add(label);
          } else {
            _selectedInterests.remove(label);
          }
        });
      },
      backgroundColor: Colors.grey[100],
      selectedColor: const Color(0xFF00A3FF),
      checkmarkColor: Colors.white,
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : Colors.black87,
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(
          color: isSelected ? const Color(0xFF00A3FF) : Colors.grey.shade300,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    );
  }
}
