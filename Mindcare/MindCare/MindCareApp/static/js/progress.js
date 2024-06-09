
$(document).ready(function () {
    GetRequest(get_progressUrl, (response) => {
        // setProgress(response);
        progressSet(response);
    });
});

var dates = [];
var emotion = [];
var emotionType = [];

const setProgress = (data) => {
    data.forEach(element => {
        let em;
        switch (element[1]) {
            case 'sad':
                em = 3;
                break;
            case 'happy':
                em = 9;
                break;
            case 'neutral':
                em = 6;
                break;
            case 'angry':
                em = 5;
                break;
            case 'fearful':
                em = 4;
                break;
            default:
                em = 0;
                break;
        }
        dates.push(element[0]);
        emotion.push(em);
        emotionType.push(element[1]);
    });

    const emotionColors = {
        'sad': '#3498db',
        'happy': '#2ecc71',
        'neutral': '#f39c12',
        'angry': '#e74c3c',
        'fearful': '#9b59b6',
    };


    const C = emotionType.map(emotionName => {
        const color = emotionColors[emotionName];
        return color;
    });
    console.log(C);


    const options = {
        chart: {
            type: 'bar',
            width: 1200, // Adjust width as needed
            height: 430,
        },
        series: [{
            name: 'Emotion',
            data: emotion,
            colors: C,

        }],
        xaxis: {
            categories: dates,
        },
        plotOptions: {
            bar: {
                columnWidth: '50%', // You can adjust the width of the bars
            },
        },
        dataLabels: {
            enabled: true,
            formatter: function (val, opts) {
                // Display "Emotion: emotion name" on hover
                const type = emotionType[opts.dataPointIndex];
                return type;
            },
        },
    };

    const chart = new ApexCharts(document.querySelector('#chart'), options);
    chart.render();
};

function getColorByEmotion(emotionName) {
    const emotionColors = {
        'sad': '#3498db',
        'happy': '#2ecc71',
        'neutral': '#f39c12',
        'angry': '#e74c3c',
        'fearful': '#9b59b6',
    };
    return emotionColors[emotionName] || '#000000'; // Default to black if not found
}

const progressSet = (data) => {
    var dates = data.map(element => element[0]);
    var emotions = data.map(element => {
        switch (element[1]) {
            case 'sad': return 3;
            case 'happy': return 9;
            case 'neutral': return 6;
            case 'angry': return 5;
            case 'fearful': return 4;
            default: return 0;
        }
    });

    var emotionTypes = data.map(element => element[1]);

    // Get colors for each emotion type
    var colors = emotionTypes.map(getColorByEmotion);

    var ctx = document.getElementById('emotionChart').getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: dates,
            datasets: [{
                label: 'Emotion',
                data: emotions,
                backgroundColor: colors,
            }],
        },
        options: {
            scales: {
                x: {
                    type: 'category',
                    labels: dates,
                },
                y: {
                    beginAtZero: true,
                }
            },
            plugins: {
                legend: {
                    display: false, // Hide the legend for simplicity
                },
                tooltip: {
                    callbacks: {
                        label: function (context) {
                            return 'Emotion: ' + emotionTypes[context.dataIndex];
                        },
                    },
                },
            },
        },
    });
}