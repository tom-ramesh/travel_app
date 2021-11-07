import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/models/activity_model.dart';
import 'package:travel_app/models/destination_model.dart';

class ActivityList extends StatelessWidget {
  final Destination destination;

  ActivityList({required this.destination});

  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐';
    }
    stars.trim();
    return Text(stars);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          padding: const EdgeInsets.only(
            top: 10.0,
            bottom: 15.0,
          ),
          itemCount: destination.activities.length,
          itemBuilder: (BuildContext context, int index) {
            Activity activity = destination.activities[index];
            return Stack(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                  height: 170.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 120.0,
                              child: Text(
                                activity.name,
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  '\$${activity.price}',
                                  style: const TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Text(
                                  'per pax',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Text(
                          activity.type,
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        _buildRatingStars(activity.rating),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(
                                5.0,
                              ),
                              width: 70.0,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondary,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Text(activity.startTimes[0]),
                              alignment: Alignment.center,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              padding: const EdgeInsets.all(
                                5.0,
                              ),
                              width: 70.0,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondary,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Text(activity.startTimes[1]),
                              alignment: Alignment.center,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 20.0,
                  top: 15.0,
                  bottom: 15.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image(
                      width: 110.0,
                      image: AssetImage(
                        activity.imageUrl,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}
