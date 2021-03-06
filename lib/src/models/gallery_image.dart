part of imgur.models;

/// The data model formatted for gallery images.
///
/// https://api.imgur.com/models/gallery_image
@JsonSerializable()
class GalleryImage implements BaseModel {
  /// The ID for the image.
  String id;

  /// The title of the image.
  String title;

  /// Description of the image.
  String description;

  /// Time inserted into the gallery.
  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
  DateTime datetime;

  /// Image MIME type.
  String type;

  /// Is the image animated.
  bool animated;

  /// The width of the image in pixels.
  int width;

  /// The height of the image in pixels.
  int height;

  /// The size of the image in bytes.
  int size;

  /// The number of image views.
  int views;

  /// Bandwidth consumed by the image in bytes.
  int bandwidth;

  /// OPTIONAL, the delete hash, if you're logged in as the image owner.
  @JsonKey()
  String deleteHash;

  /// The direct link to the the image.
  ///
  /// Note: if fetching an animated GIF that was over 20MB in original size,
  /// a .gif thumbnail will be returned.
  String link;

  /// OPTIONAL, The .gifv link.
  ///
  /// Only available if the image is animated and type is 'image/gif'.
  @JsonKey()
  String gifv;

  /// OPTIONAL, The direct link to the .mp4.
  ///
  /// Only available if the image is animated and type is 'image/gif'.
  @JsonKey()
  String mp4;

  /// OPTIONAL, The Content-Length of the .mp4.
  ///
  /// Only available if the image is animated and type is 'image/gif'.
  /// Note that a zero value (0) is possible if the video has not yet been
  /// generated.
  @JsonKey(name: 'mp4_size')
  int mp4Size;

  /// OPTIONAL, Whether the image has a looping animation.
  ///
  /// Only available if the image is animated and type is 'image/gif'.
  @JsonKey()
  bool looping;

  /// The current user's vote on the album.
  ///
  /// null if not signed in or if the user hasn't voted on it.
  @JsonKey(fromJson: stringToVote, toJson: voteToString)
  VoteType vote;

  /// Indicates if the current user has favorite the image.
  ///
  /// Defaults to false if not signed in
  bool favorite;

  /// Indicates if the image has been marked as nsfw or not.
  ///
  /// Defaults to null if information is not available.
  bool nsfw;

  /// Number of comments on the gallery image.
  @JsonKey(name: 'comment_count')
  int commentCount;

  /// Topic of the gallery image/
  String topic;

  /// Topic ID of the gallery image/
  @JsonKey(name: 'topic_id')
  dynamic topicId;

  /// The image section.
  ///
  /// If the image has been categorized by Imgur's backend then this will
  /// contain the section the image belongs in.
  String section;

  /// The username of the account that uploaded it, or null.
  @JsonKey(name: 'account_url')
  String accountUrl;

  /// The total number of image favorites.
  @JsonKey(name: 'favorite_count')
  int favoriteCount;

  /// A list of tags associated with the image.
  @JsonKey(toJson: baseModelListToJson)
  List<Tag> tags;

  /// If the video has sound or not.
  @JsonKey(name: 'has_sound')
  bool hasSound;

  /// The account ID of the account that uploaded it, or null.
  @JsonKey(name: 'account_id')
  int accountId;

  /// Upvotes for the image/
  int ups;

  /// Number of downvotes for the image.
  int downs;

  /// Upvotes minus downvotes.
  int points;

  /// Imgur popularity score.
  int score;

  /// If it's an album or not.
  @JsonKey(name: 'is_album')
  bool isAlbum;

  /// Indicates if the image is in the most viral gallery or not.
  @JsonKey(name: 'in_most_viral')
  dynamic inMostViral;

  GalleryImage(
      {this.id,
      this.title,
      this.description,
      this.datetime,
      this.type,
      this.animated,
      this.width,
      this.height,
      this.size,
      this.views,
      this.bandwidth,
      this.deleteHash,
      this.link,
      this.gifv,
      this.mp4,
      this.mp4Size,
      this.looping,
      this.vote,
      this.favorite,
      this.favoriteCount,
      this.hasSound,
      this.tags,
      this.nsfw,
      this.commentCount,
      this.topic,
      this.topicId,
      this.section,
      this.accountUrl,
      this.accountId,
      this.ups,
      this.downs,
      this.points,
      this.score,
      this.isAlbum,
      this.inMostViral});

  factory GalleryImage.fromJson(Map<String, dynamic> json) =>
      _$GalleryImageFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GalleryImageToJson(this);
}
