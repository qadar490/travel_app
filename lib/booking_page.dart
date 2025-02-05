import 'package:flutter/material.dart';
import 'dart:ui';
import '../services/booking_service.dart';
import '../pages/booking_details_page.dart';

class BookingPage extends StatelessWidget {
  final String imagePath;
  final String name;
  final String location;
  final String rating;
  final String description;
  final String price;
  final BookingService _bookingService = BookingService();

  BookingPage({
    super.key,
    this.imagePath = 'images/4.png',
    this.name = 'RedFish Lake',
    this.location = 'Idaho',
    this.rating = '4.5',
    this.price = '\$40',
    this.description = 'Redfish Lake is the final stop on the longest Pacific salmon run in North America, which requires long-distance swimmers, such as Sockeye and Chinook Salmon, to travel over 900 miles upstream to return to their spawning grounds.\n\nRedfish Lake is an alpine lake in Custer County, Idaho, just south of Stanley. It is the largest lake within the Sawtooth National Recreation Area.',
  });

  void _handleBooking(BuildContext context) async {
    try {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Xaqiijinta Booking-ka'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Goobta: $name'),
              Text('Location: $location'),
              Text('Qiimaha: $price'),
              const SizedBox(height: 16),
              const Text('Ma hubtaa inaad booking-gan sameyneyso?'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Maya'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                await _bookingService.createBooking(name, location, price);
                
                // Show success message and navigate to bookings
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Waad ku guuleysatay booking-ka!'),
                    backgroundColor: Color(0xFF008080),
                  ),
                );
                // ignore: use_build_context_synchronously
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingDetailsPage(
                      name: name,
                      location: location,
                      price: price,
                      imagePath: imagePath,
                      bookingDate: DateTime.now(),
                    ),
                  ),
                );
              },
              child: const Text('Haa'),
            ),
          ],
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Khalad: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Image and Navigation
                Stack(
                  children: [
                    // Main Image
                    Container(
                      height: 300,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(30),
                        ),
                        image: DecorationImage(
                          image: AssetImage(imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Back Button
                    Positioned(
                      top: 40,
                      left: 16,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ),
                    // Image Carousel Indicators
                    Positioned(
                      bottom: 20,
                      left: 16,
                      right: 16,
                      child: Row(
                        children: [
                          ...List.generate(3, (index) => _buildImageIndicator()),
                          Container(
                            margin: const EdgeInsets.only(left: 8),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              '+8',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title and Rating
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 20,
                              ),
                              Text(
                                rating,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      // Location
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 16,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            location,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Description Title
                      const Text(
                        'What is Redfish Lake known for?',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Description Text
                      Text(
                        description,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Booking Button and Favorite
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () => _handleBooking(context),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF008080),
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                'Book Now | $price',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.favorite_border),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageIndicator() {
    return Container(
      width: 60,
      height: 40,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
} 