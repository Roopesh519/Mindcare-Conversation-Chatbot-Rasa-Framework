$(document).ready(function () {
    var timerElement = $("#timer");
    var timerInterval;
    var currentTime = 0; // Start from 00:00:00
    $("#stopBtn").prop('disabled', true);

    function updateTimerDisplay(timeInSeconds) {
        var hours = Math.floor(timeInSeconds / 3600);
        var minutes = Math.floor((timeInSeconds % 3600) / 60);
        var seconds = timeInSeconds % 60;
        timerElement.text(`${String(hours).padStart(2, '0')}:${String(minutes).padStart(2, '0')}:${String(seconds).padStart(2, '0')}`);
    }

    function startTimer() {
        updateTimerDisplay(currentTime);

        timerInterval = setInterval(function () {
            currentTime++;
            updateTimerDisplay(currentTime);
        }, 1000);
    }

    function stopTimer() {
        clearInterval(timerInterval);
    }

    function resetTimer() {
        stopTimer();
        currentTime = 0;
        updateTimerDisplay(currentTime);
    }

    // Button click event handlers
    $("#stopBtn").on("click", function () {
        $(this).hide();
        $('#replayBtn').show();

        stopTimer();
    });
    $("#replayBtn").on("click", function () {
        $(this).hide();
        $('#stopBtn').show();
        startTimer();
    });
    $("#resetBtn").on("click", function () {
        $(this).hide();
        $('#stopBtn').show();
        $("#stopBtn").prop('disabled', true);
        $('#replayBtn').hide();
        $('#startBtn').show();
        resetTimer();
    });
    $("#startBtn").on("click", function () {
        $(this).hide();
        $('#resetBtn').show();
        $("#stopBtn").prop('disabled', false);
        startTimer();
    });


    $("#searchInput").on('input', function () {
        var query = $(this).val().trim();
        const params = { 'type': query };
        GetRequest(search_activityUrl, (response) => {
            $('#activity_block').empty();
            if (response.length > 0) {
                response.forEach(data => {
                    let res = `
                    <div class="col-12 col-md-4 col-lg-4 py-2">
                    <div class="card rounded-3 shadow">
                        <div class="opacity-50">
                            <img src="/media/${data.image}" class="card-img object-fit-cover" alt="type" height="200">
                        </div>
                        <div class="card-img-overlay">
                            <h5 class="card-title text-center mt-4 text-dark">${data.activity_name}</h5>
                            <div class="text-center">
                                <a type="link" class="btn btn-info px-5 mt-5 text-center"
                                    href="/startActivity?type=${data.type}">Start</a>
                            </div>
                        </div>
                    </div>
                </div>
                    `;
                    $('#activity_block').append(res);

                });
            } else {
                var img = $('<img>').attr({
                    'src': '/media/Activity/pexels-charles-1851164.jpg',
                    'alt': 'not found',
                    'width': 100,
                    'height': 300,
                    'class':'object-fit-contain mb-2 '
                });

                $('#activity_block').append(img);
            }

        }, true, params);

    });
});