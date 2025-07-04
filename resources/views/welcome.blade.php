<!DOCTYPE html>
<html>

<head>
    <title>FCM Token Tester</title>
    <script src="https://www.gstatic.com/firebasejs/10.12.2/firebase-app-compat.js"></script>
    <script src="https://www.gstatic.com/firebasejs/10.12.2/firebase-messaging-compat.js"></script>
</head>

<body>
    <h2>Click to Get Your FCM Token</h2>
    <button onclick="requestPermission()">Get Token</button>
    <pre id="tokenOutput"></pre>

    <script>
        // Replace this config with your Firebase project settings
        const firebaseConfig = {
            apiKey: "AIzaSyCpqtyky2kuXsY0Dz-vypB5nS-8MEsgkl4",
            authDomain: "curbymaps-960d6.firebaseapp.com",
            projectId: "curbymaps-960d6",
            storageBucket: "curbymaps-960d6.firebasestorage.app",
            messagingSenderId: "53877603912",
            appId: "1:53877603912:web:857a216e37846929fd227d",
            measurementId: "G-31JTNLGMRN"
        };

        firebase.initializeApp(firebaseConfig);
        const messaging = firebase.messaging();

        async function requestPermission() {
            try {
                const status = await Notification.requestPermission();
                if (status === 'granted') {
                    const token = await messaging.getToken({
                        vapidKey: 'BHHG9PaQwPxVTqaNJ2i41t7-Pw3q9gqyfTL_LgTyljzpusocnTFeWrmTMRW1JT5DYElEtAVNMnj8kAkmH5qfdwE'
                    });
                    document.getElementById('tokenOutput').textContent = token;
                    console.log('Your FCM Token:', token);

                    // TODO: send this token to your Laravel API
                } else {
                    alert('Permission not granted.');
                }
            } catch (err) {
                console.error('Error getting token:', err);
            }
        }

        messaging.onMessage((payload) => {
            console.log('📥 Notification received in foreground:', payload);

            const {
                title,
                body
            } = payload.notification;

            // Show visible browser notification
            new Notification(title, {
                body
            });

            // Optional: alert as well
            // alert('New Notification: ' + title);
        });
    </script>
</body>

</html>