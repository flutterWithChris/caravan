class Trip {
  String? tripId;
  String? tripName;
  String? tripOwner;
  DateTime? startDate;
  DateTime? endDate;
  String? tripDescription;
  String? tripImage;
  String? tripLocation;
  String? tripType;
  String? tripStatus;
  List<String>? tripMembers;
  List<String>? tripRequests;
  List<String>? tripPosts;
  List<String>? tripComments;
  List<String>? tripLikes;
  List<String>? tripDislikes;
  Trip({
    this.tripId,
    this.tripName,
    this.tripOwner,
    this.startDate,
    this.endDate,
    this.tripDescription,
    this.tripImage,
    this.tripLocation,
    this.tripType,
    this.tripStatus,
    this.tripMembers,
    this.tripRequests,
    this.tripPosts,
    this.tripComments,
    this.tripLikes,
    this.tripDislikes,
  });
}
