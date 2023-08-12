const express = require("express");
const notificationRouter = express.Router();
const https = require("https");

notificationRouter.post('/send-notification', async (req, res) => {
    const { playerId, message, screen } = req.body;


    const headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Basic ' + 'MzI2ZWUzYmUtMzVkMi00OTZhLWIzZTItMjlmOWI3M2EyMjVi',

    };

    const data = JSON.stringify({
        app_id: 'f4984ec5-d389-4fcb-b8a2-8bdf26b9f68b',
        contents: { 'en': message },
        include_player_ids: [playerId],
        data: { screen: screen },
    });

    const options = {
        hostname: 'onesignal.com',
        port: 443,
        path: '/api/v1/notifications',
        method: 'POST',
        headers: headers,
    };

    const request = https.request(options, (response) => {
        let responseData = '';
        response.on('data', (chunk) => {
            responseData += chunk;
        });
        response.on('end', () => {
            console.log(responseData);
            res.send('Notification sent successfully');
        });
    });

    request.on('error', (error) => {
        console.error(error);
        res.status(500).send('Error sending notification');
    });

    request.write(data);
    request.end();
});
module.exports = notificationRouter;
