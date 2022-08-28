"use strict";
window.scrollTo(0, document.body.scrollHeight);
let userName;
if (localStorage.getItem("userName") == null) {
    let name = prompt("Please enter your name:");
    userName = name;
    localStorage.setItem("userName", name);
} else {
    userName = localStorage.getItem("userName")
}

var connection = new signalR.HubConnectionBuilder().withUrl("/chat").build();

document.querySelector(".send-message").disabled = true;

connection.on("ReceiveMessage", function (user, message, color) {
    let messageItem;
    if (user == userName) {
        messageItem = `
            <div class="message-item text-end">
                <div class="message-container sent-by-client">
                    <p class="sender" style="color:${color}">${user}</p>
                    <p class="message">${message}</p>
                </div>
            </div>
        `;
    } else {
        messageItem = `
            <div class="message-item">
                <div class="message-container">
                    <p class="sender" style="color:${color}">${user}</p>
                    <p class="message">${message}</p>
                </div>
            </div>
        `;
    }

    $("#messages-area .container").append(messageItem);
    window.scrollTo(0, document.body.scrollHeight);
});

connection.start().then(function () {
    document.querySelector(".send-message").disabled = false;
}).catch(function (err) {
    return console.error(err.toString());
});

function SendMessage() {
    var message = document.querySelector("#send-area input").value;
    var color = stringToColour(userName);
    document.querySelector("#send-area input").value = "";
    connection.invoke("SendMessage", userName, message, color).catch(function (err) {
        return console.error(err.toString());
    });
    event.preventDefault();
    window.scrollTo(0, document.body.scrollHeight);
}

document.querySelector(".send-message").addEventListener("click", function (event) {
    SendMessage();
});

document.querySelector("#send-area input").addEventListener("keyup", function (event) {
    if (event.keyCode == 13) {
        SendMessage();
    }
});



function stringToColour(str) {
    var hash = 0;
    for (var i = 0; i < str.length; i++) {
        hash = str.charCodeAt(i) + ((hash << 5) - hash);
    }
    var colour = '#';
    for (var i = 0; i < 3; i++) {
        var value = (hash >> (i * 8)) & 0xFF;
        colour += ('00' + value.toString(16)).substr(-2);
    }
    return colour;
}