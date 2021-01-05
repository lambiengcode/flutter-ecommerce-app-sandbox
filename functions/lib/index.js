"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.sendNotices = exports.sendDeadlines = void 0;
const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();
const db = admin.firestore();
const fcm = admin.messaging();
exports.sendDeadlines = functions.firestore
    .document("deadlines/{deadlinesId}")
    .onCreate(async (snapshot) => {
    const notification = snapshot.data();
    const querySnapshot = await db
        .collection("users")
        .where("id", "in", notification.members)
        .get();
    const tokens = querySnapshot.docs.map((snap) => snap.data().token);
    const payload = {
        notification: {
            title: `${notification.title}`,
            body: `${notification.desc}`,
            icon: "your-icon-url",
            click_action: "FLUTTER_NOTIFICATION_CLICK",
            priority: "high",
        },
    };
    return fcm.sendToDevice(tokens, payload);
});
exports.sendNotices = functions.firestore
    .document("posts/{postsId}")
    .onCreate(async (snapshot) => {
    const notification = snapshot.data();
    if (notification.type == "notice") {
        await db
            .collection("courses")
            .where("id", "==", notification.course)
            .onSnapshot((snaps) => {
            snaps.docs.forEach(async (element) => {
                const querySnapshot = await db
                    .collection("users")
                    .where("id", "in", element.data().members)
                    .get();
                const queryGetContent = await db
                    .collection("contents")
                    .where("post", "==", notification.id)
                    .get();
                const tokens = querySnapshot.docs.map((snap) => snap.data().token);
                const title = queryGetContent.docs[0].data().title;
                const desc = queryGetContent.docs[0].data().desc;
                const payload = {
                    notification: {
                        title: `${title}`,
                        body: `${desc}`,
                        icon: "your-icon-url",
                        click_action: "FLUTTER_NOTIFICATION_CLICK",
                        priority: "high",
                    },
                };
                return fcm.sendToDevice(tokens, payload);
            });
        });
    }
});
//# sourceMappingURL=index.js.map