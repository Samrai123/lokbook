import 'dart:math';

Random random = Random();

List notifs = [
  " others liked your post",
  " mentioned you in a comment",
  " shared your post",
  " commented on your post",
  " replied to your comment",
  " reacted to your comment",
  " asked you to join a Group️",
  "} asked you to like a page",
  "You have memories with ",
  " Tagged you and others in a post",
  "} Sent you a friend request",
];

List notifications = List.generate(
    13,
    (index) => {
          // "name": names[random.nextInt(10)],
          // "dp": "assets/images/cm${random.nextInt(10)}.jpeg",
          "time": "${random.nextInt(50)} min ago",
          "notif": notifs[random.nextInt(10)]
        });

// List posts = List.generate(
//     13,
//     (index) => {
//           "name": names[random.nextInt(10)],
//           "dp": "assets/images/cm${random.nextInt(10)}.jpeg",
//           "time": "${random.nextInt(50)} min ago",
//           "img": "assets/images/cm${random.nextInt(10)}.jpeg"
//         });

// List chats = List.generate(
//     13,
//     (index) => {
//           "name": names[random.nextInt(10)],
//           "dp": "assets/images/cm${random.nextInt(10)}.jpeg",
//           "msg": messages[random.nextInt(10)],
//           "counter": random.nextInt(20),
//           "time": "${random.nextInt(50)} min ago",
//           "isOnline": random.nextBool(),
//         });

// List groups = List.generate(
//     13,
//     (index) => {
//           "name": "Group ${random.nextInt(20)}",
//           "dp": "assets/images/cm${random.nextInt(10)}.jpeg",
//           "msg": messages[random.nextInt(10)],
//           "counter": random.nextInt(20),
//           "time": "${random.nextInt(50)} min ago",
//           "isOnline": random.nextBool(),
//         });

// List types = ["text", "image"];
// List conversation = List.generate(
//     10,
//     (index) => {
//           "username": "Group ${random.nextInt(20)}",
//           "time": "${random.nextInt(50)} min ago",
//           "type": types[random.nextInt(2)],
//           "replyText": messages[random.nextInt(10)],
//           "isMe": random.nextBool(),
//           "isGroup": false,
//           "isReply": random.nextBool(),
//         });

// List friends = List.generate(
//     13,
//     (index) => {
//           "name": names[random.nextInt(10)],
//           "dp": "assets/images/cm${random.nextInt(10)}.jpeg",
//           "status": "Anything could be here",
//           "isAccept": random.nextBool(),
//         });
