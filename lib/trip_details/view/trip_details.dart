import 'package:caravan/trip_details/model/trip.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jiffy/jiffy.dart';

class TripDetailsPage extends StatelessWidget {
  const TripDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Trip currentTrip = Trip(
        tripName: 'Austin Trip',
        tripOwner: 'Christian Vergara',
        startDate: DateTime(2023, 5, 30),
        endDate: DateTime(2023, 6, 6),
        tripMembers: [
          'Christian Vergara',
          'Kelly Oliva',
          'Justin Vergara',
          'Mike Kravchenko',
          'Sean Dephilips',
          'Derek Maillard'
        ]);
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.airplanemode_active),
              label: 'Details',
              activeIcon: null),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_rounded),
              label: 'Create Trip',
              activeIcon: null),
        ]),
        appBar: AppBar(
          backgroundColor: Colors.black87,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                FontAwesomeIcons.vanShuttle,
                size: 20,
                color: Colors.white,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Caravan', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
        body: ListView(
          //padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
          shrinkWrap: true,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
              child: AspectRatio(
                aspectRatio: 2 / 1,
                child: Card(
                    child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage: NetworkImage(
                            'https://i.pinimg.com/originals/cb/95/10/cb9510b3b34aebd9072b5bdc6cc2a875.jpg'),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          currentTrip.tripName!,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(fontWeight: FontWeight.w800),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_month_rounded,
                              size: 18,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                  '${Jiffy(currentTrip.startDate).MMMd} - ${Jiffy(currentTrip.endDate).MMMd}'),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Row(
                            children: [
                              Stack(
                                clipBehavior: Clip.none,
                                children: const [
                                  CircleAvatar(),
                                  Positioned(
                                      left: 24,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.red,
                                      )),
                                  Positioned(
                                    left: 48,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 60),
                                child: Text('6 People'),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                )),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 800,
                      width: 80,
                      child: Stepper(type: StepperType.vertical, steps: const [
                        Step(
                            title: Text(''),
                            content: SizedBox(height: 5, child: Text('')),
                            isActive: true),
                        Step(
                            title: Text(''),
                            content: Text(''),
                            isActive: false),
                        Step(
                            title: SizedBox(height: 210, child: Text('')),
                            content: Text(''),
                            isActive: false),
                        Step(
                            title: SizedBox(height: 375, child: Text('')),
                            content: Text(''),
                            isActive: false),
                      ]),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 24.0,
                            children: [
                              const Icon(FontAwesomeIcons.planeDeparture,
                                  size: 18),
                              Text(
                                'Arriving Flight · ${Jiffy(currentTrip.startDate).MMMd}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.0),
                            child: FlightDetailCard(),
                          ),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 24.0,
                            children: [
                              const Icon(Icons.car_rental_rounded, size: 30),
                              Text(
                                'Car Rental',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.0),
                            child: CarRentalCard(),
                          ),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 24.0,
                            children: [
                              const Icon(FontAwesomeIcons.hotel, size: 18),
                              Text(
                                'AirBnB · 7 Nights',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            child: LodgingCard(
                              trip: currentTrip,
                            ),
                          ),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 24.0,
                            children: [
                              const Icon(FontAwesomeIcons.planeDeparture,
                                  size: 18),
                              Text(
                                'Departing Flight · ${Jiffy(currentTrip.endDate).MMMd}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.0),
                            child: FlightDetailCard(),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ));
  }
}

class FlightDetailCard extends StatelessWidget {
  const FlightDetailCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          const BoxConstraints(maxHeight: 110, minHeight: 110, minWidth: 300),
      child: Card(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            height: 30,
            width: 300,
            child: const Padding(
              padding: EdgeInsets.only(top: 4),
              child: Text(
                'Booking Soon',
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Icon(
                    Icons.airplane_ticket,
                    size: 40,
                    // color: Colors.blue,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'JetBlue Flight #420',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.w800),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Icon(
                            Icons.sync_alt_rounded,
                            size: 16,
                            color: Colors.blue,
                          ),
                        )
                      ],
                    ),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 24,
                      children: [
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 8.0,
                          children: [
                            Icon(
                              FontAwesomeIcons.planeDeparture,
                              size: 12,
                              color: Colors.grey.shade600,
                            ),
                            Text(
                              '12:40PM',
                              style: TextStyle(color: Colors.grey.shade600),
                            )
                          ],
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 8.0,
                          children: [
                            Icon(
                              FontAwesomeIcons.planeArrival,
                              size: 12,
                              color: Colors.grey.shade600,
                            ),
                            Text(
                              '4:20PM',
                              style: TextStyle(color: Colors.grey.shade600),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class CarRentalCard extends StatelessWidget {
  const CarRentalCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          const BoxConstraints(maxHeight: 80, minHeight: 80, minWidth: 300),
      child: Card(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Container(
          //   decoration: const BoxDecoration(
          //       color: Colors.blue,
          //       borderRadius: BorderRadius.only(
          //           topLeft: Radius.circular(40),
          //           topRight: Radius.circular(40))),
          //   height: 30,
          //   width: 300,
          //   child: const Padding(
          //     padding: EdgeInsets.only(top: 4),
          //     child: Text(
          //       'Booking Soon',
          //       textAlign: TextAlign.center,
          //       style:
          //           TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Icon(
                    FontAwesomeIcons.vanShuttle,
                    size: 28,
                    // color: Colors.blue,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Enterprise - Minivan',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 24,
                      children: [
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 8.0,
                          children: [
                            Icon(
                              FontAwesomeIcons.clock,
                              size: 12,
                              color: Colors.grey.shade600,
                            ),
                            Text(
                              'Pickup at 5:00PM',
                              style: TextStyle(color: Colors.grey.shade600),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class LodgingCard extends StatelessWidget {
  final Trip trip;
  const LodgingCard({
    required this.trip,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
          maxHeight: 240, minHeight: 240, minWidth: 300, maxWidth: 300),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Container(
              //   decoration: const BoxDecoration(
              //       color: Colors.blue,
              //       borderRadius: BorderRadius.only(
              //           topLeft: Radius.circular(40),
              //           topRight: Radius.circular(40))),
              //   height: 30,
              //   width: 300,
              //   child: const Padding(
              //     padding: EdgeInsets.only(top: 4),
              //     child: Text(
              //       'Booking Soon',
              //       textAlign: TextAlign.center,
              //       style:
              //           TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              //     ),
              //   ),
              // ),
              Image.network(
                  'https://media.architecturaldigest.com/photos/615499d1d7850a3d6360a1b4/16:9/w_2580,c_limit/Scream%20Airbnb%2002%20-%20Exterior%20-%20Credit%20Helynn%20Ospina.jpg'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                'Cozy Getaway in Austin, TX',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(fontWeight: FontWeight.w800),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 16,
                      children: [
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 8.0,
                          children: [
                            Icon(
                              FontAwesomeIcons.calendarCheck,
                              size: 12,
                              color: Colors.grey.shade600,
                            ),
                            Text(
                              '${Jiffy(trip.startDate).MMMd} - 12PM',
                              style: TextStyle(color: Colors.grey.shade600),
                            )
                          ],
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 8.0,
                          children: [
                            Icon(
                              FontAwesomeIcons.calendarXmark,
                              size: 12,
                              color: Colors.grey.shade600,
                            ),
                            Text(
                              '${Jiffy(trip.endDate).MMMd} - 4PM',
                              style: TextStyle(color: Colors.grey.shade600),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
