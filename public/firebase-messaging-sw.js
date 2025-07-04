importScripts('https://www.gstatic.com/firebasejs/10.12.2/firebase-app-compat.js');
importScripts('https://www.gstatic.com/firebasejs/10.12.2/firebase-messaging-compat.js');

firebase.initializeApp({
    apiKey: "AIzaSyCpqtyky2kuXsY0Dz-vypB5nS-8MEsgkl4",
    projectId: "curbymaps-960d6",
    messagingSenderId: "53877603912",
    appId: "1:53877603912:web:857a216e37846929fd227d",
});

const messaging = firebase.messaging();

messaging.onBackgroundMessage(function (payload) {
    console.log('[Service Worker] Background message', payload);
    self.registration.showNotification(payload.notification.title, {
        body: payload.notification.body,
        icon: '/favicon.ico'
    });
});
