// app/javascript/envelope_animation.js (or app/assets/javascripts/envelope_animation.js)

document.addEventListener('turbolinks:load', function() {
    var envelope = document.getElementById('envelope');
    if (envelope) {
        envelope.addEventListener('click', function() {
            this.classList.add('open');

            // Replace 'path-to-letter-show-page' with your actual path
            setTimeout(function() {
                window.location.href = 'path-to-letter-show-page';
            }, 1000); // Adjust time as necessary
        });
    }
});
