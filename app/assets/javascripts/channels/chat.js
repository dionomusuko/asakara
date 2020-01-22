App.chat = App.cable.subscriptions.create("ChatChannel", {
    connected: function() {
        console.log('connected')
        // Called when the subscription is ready for use on the server
    },

    disconnected: function() {
        // Called when the subscription has been terminated by the server
    },

    received: function(chat) {
        const chats = document.getElementById('chats')
        chats.innerHTML += chat
        // Called when there's incoming data on the websocket for this channel
    },

    speak: function(content) {
        return this.perform('speak', {chat: content});
    }
});

document.addEventListener('DOMContentLoaded', function(){
    const input = document.getElementById('chat-input')
    const button = document.getElementById('button')
    button.addEventListener('click', function(){
        const content = input.value
        App.chat.speak(content)
        input.value = ''
    })
})