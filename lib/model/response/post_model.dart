class PostModel {
  Status? status;
  Data? data;
  int? pageCount;
  int? page;

  PostModel({this.status, this.data, this.pageCount, this.page});

  PostModel.fromJson(Map<String, dynamic> json) {
    status =
    json['status'] != null ? Status.fromJson(json['status']) : null;
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    pageCount = json['pageCount'];
    page = json['page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (status != null) {
      data['status'] = status!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['pageCount'] = pageCount;
    data['page'] = page;
    return data;
  }
}

class Status {
  int? code;
  String? message;

  Status({this.code, this.message});

  Status.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}

class Data {
  List<PostItem>? content;
  Pageable? pageable;
  bool? last;
  int? totalElements;
  int? totalPages;
  int? size;
  int? number;
  Sort? sort;
  bool? first;
  int? numberOfElements;
  bool? empty;

  Data(
      {this.content,
        this.pageable,
        this.last,
        this.totalElements,
        this.totalPages,
        this.size,
        this.number,
        this.sort,
        this.first,
        this.numberOfElements,
        this.empty});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <PostItem>[];
      json['content'].forEach((v) {
        content!.add(PostItem.fromJson(v));
      });
    }
    pageable = json['pageable'] != null
        ? Pageable.fromJson(json['pageable'])
        : null;
    last = json['last'];
    totalElements = json['totalElements'];
    totalPages = json['totalPages'];
    size = json['size'];
    number = json['number'];
    sort = json['sort'] != null ? Sort.fromJson(json['sort']) : null;
    first = json['first'];
    numberOfElements = json['numberOfElements'];
    empty = json['empty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (content != null) {
      data['content'] = content!.map((v) => v.toJson()).toList();
    }
    if (pageable != null) {
      data['pageable'] = pageable!.toJson();
    }
    data['last'] = last;
    data['totalElements'] = totalElements;
    data['totalPages'] = totalPages;
    data['size'] = size;
    data['number'] = number;
    if (sort != null) {
      data['sort'] = sort!.toJson();
    }
    data['first'] = first;
    data['numberOfElements'] = numberOfElements;
    data['empty'] = empty;
    return data;
  }
}

class PostItem {
  String? postId;
  String? description;
  List<ImagesList>? imagesList;
  PostUserId? postUserId;
  String? checkInTimestamp;
  String? checkInAddress;
  double? checkInLatitude;
  double? checkInLongitude;
  String? type;
  String? videoUrl;
  String? question;

  PostItem(
      {this.postId,
        this.description,
        this.imagesList,
        this.postUserId,
        this.checkInTimestamp,
        this.checkInAddress,
        this.checkInLatitude,
        this.checkInLongitude,
        this.type,
        this.videoUrl,
        this.question});

  PostItem.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    description = json['description'];
    if (json['imagesList'] != null) {
      imagesList = <ImagesList>[];
      json['imagesList'].forEach((v) {
        imagesList!.add(ImagesList.fromJson(v));
      });
    }
    postUserId = json['postUserId'] != null
        ? PostUserId.fromJson(json['postUserId'])
        : null;
    checkInTimestamp = json['checkInTimestamp'];
    checkInAddress = json['checkInAddress'];
    checkInLatitude = json['checkInLatitude'];
    checkInLongitude = json['checkInLongitude'];
    type = json['type'];
    videoUrl = json['videoUrl'];
    question = json['question'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['postId'] = postId;
    data['description'] = description;
    if (imagesList != null) {
      data['imagesList'] = imagesList!.map((v) => v.toJson()).toList();
    }
    if (postUserId != null) {
      data['postUserId'] = postUserId!.toJson();
    }
    data['checkInTimestamp'] = checkInTimestamp;
    data['checkInAddress'] = checkInAddress;
    data['checkInLatitude'] = checkInLatitude;
    data['checkInLongitude'] = checkInLongitude;
    data['type'] = type;
    data['videoUrl'] = videoUrl;
    data['question'] = question;
    return data;
  }
}

class ImagesList {
  int? id;
  String? imageUrl;

  ImagesList({this.id, this.imageUrl});

  ImagesList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['imageUrl'] = imageUrl;
    return data;
  }
}

class PostUserId {
  String? userId;
  String? userName;
  String? fullName;
  String? imageUrl;
  String? bio;
  String? email;
  double? latitude;
  double? longitude;
  String? lastOnline;
  bool? isBlock;
  List<UserInterestProfiles>? userInterestProfiles;

  PostUserId(
      {this.userId,
        this.userName,
        this.fullName,
        this.imageUrl,
        this.bio,
        this.email,
        this.latitude,
        this.longitude,
        this.lastOnline,
        this.isBlock,
        this.userInterestProfiles});

  PostUserId.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userName = json['userName'];
    fullName = json['fullName'];
    imageUrl = json['imageUrl'];
    bio = json['bio'];
    email = json['email'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    lastOnline = json['lastOnline'];
    isBlock = json['isBlock'];
    if (json['userInterestProfiles'] != null) {
      userInterestProfiles = <UserInterestProfiles>[];
      json['userInterestProfiles'].forEach((v) {
        userInterestProfiles!.add(UserInterestProfiles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['userName'] = userName;
    data['fullName'] = fullName;
    data['imageUrl'] = imageUrl;
    data['bio'] = bio;
    data['email'] = email;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['lastOnline'] = lastOnline;
    data['isBlock'] = isBlock;
    if (userInterestProfiles != null) {
      data['userInterestProfiles'] =
          userInterestProfiles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserInterestProfiles {
  int? id;
  TourInterest? tourInterest;

  UserInterestProfiles({this.id, this.tourInterest});

  UserInterestProfiles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tourInterest = json['tourInterest'] != null
        ? TourInterest.fromJson(json['tourInterest'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (tourInterest != null) {
      data['tourInterest'] = tourInterest!.toJson();
    }
    return data;
  }
}

class TourInterest {
  int? id;
  String? name;

  TourInterest({this.id, this.name});

  TourInterest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Pageable {
  int? pageNumber;
  int? pageSize;
  Sort? sort;
  int? offset;
  bool? paged;
  bool? unpaged;

  Pageable(
      {this.pageNumber,
        this.pageSize,
        this.sort,
        this.offset,
        this.paged,
        this.unpaged});

  Pageable.fromJson(Map<String, dynamic> json) {
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    sort = json['sort'] != null ? Sort.fromJson(json['sort']) : null;
    offset = json['offset'];
    paged = json['paged'];
    unpaged = json['unpaged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pageNumber'] = pageNumber;
    data['pageSize'] = pageSize;
    if (sort != null) {
      data['sort'] = sort!.toJson();
    }
    data['offset'] = offset;
    data['paged'] = paged;
    data['unpaged'] = unpaged;
    return data;
  }
}

class Sort {
  bool? empty;
  bool? sorted;
  bool? unsorted;

  Sort({this.empty, this.sorted, this.unsorted});

  Sort.fromJson(Map<String, dynamic> json) {
    empty = json['empty'];
    sorted = json['sorted'];
    unsorted = json['unsorted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['empty'] = empty;
    data['sorted'] = sorted;
    data['unsorted'] = unsorted;
    return data;
  }
}