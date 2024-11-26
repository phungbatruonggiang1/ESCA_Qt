import QtQuick 2.15
import QtQuick.Controls 2.15
import AudioChartImport 1.0

Rectangle {
    width: 800
    height: 480
    color: "#1e1e1e"
    radius: 20

    property var audioData: []  // Variable to store audio data
    property int maxAmplitude: 32767  // Maximum amplitude (assuming 16-bit PCM)
    property int threshold: 10000  // Set the threshold value

    Canvas {
        id: audioWaveform
        anchors.fill: parent

        onPaint: {
            var ctx = getContext("2d");
            ctx.clearRect(0, 0, width, height);

            // Set font and style
            ctx.font = "16px Oxanium";
            ctx.fillStyle = "white";
            ctx.fillText("Amplitude Time Series Chart (s)", audioWaveform.width / 2 - 130, audioWaveform.height - 10);

            // Draw Y-axis grid and labels
            var yAxisValues = [-32767, -20, -10, 0, 10, 20, 32767];
            var yAxisStep = (audioWaveform.height - 60) / (yAxisValues.length - 1);
            ctx.font = "13px Oxanium";
            ctx.strokeStyle = "#5A5A5A";
            ctx.lineWidth = 0.5;

            for (var i = 0; i < yAxisValues.length; i++) {
                var y = 30 + i * yAxisStep;
                ctx.fillText(yAxisValues[i], 0, y);
                ctx.beginPath();
                ctx.moveTo(30, y);
                ctx.lineTo(audioWaveform.width - 50, y);
                ctx.stroke();
            }

            // Draw X-axis grid
            var xAxisLogPositions = [0, 0.25, 0.5, 0.75, 1];
            var xMin = 30;
            var xMax = audioWaveform.width - 50;
            var xRange = xMax - xMin;

            for (var j = 0; j < xAxisLogPositions.length; j++) {
                var x = xMin + xAxisLogPositions[j] * xRange;
                ctx.beginPath();
                ctx.moveTo(x, 30);
                ctx.lineTo(x, audioWaveform.height - 30);
                ctx.stroke();
            }

            // Draw waveform in two parts: one for normal values and another for over-threshold
            ctx.lineWidth = 2;

            // Normal segments
            ctx.strokeStyle = "#00FFFF";
            ctx.beginPath();
            var isThresholdExceeded = false;
            for (var k = 0; k < audioData.length; k++) {
                x = xMin + k * xRange / (audioData.length - 1);
                y = audioWaveform.height / 2 - (audioData[k] / maxAmplitude) * (audioWaveform.height / 2 - 60);

                if (Math.abs(audioData[k]) <= threshold) {
                    if (isThresholdExceeded) {
                        ctx.stroke();  // End previous red path
                        ctx.beginPath();  // Start a new path for normal values
                        ctx.strokeStyle = "#00FFFF";
                        isThresholdExceeded = false;
                        ctx.moveTo(x, y);
                    }
                    ctx.lineTo(x, y);
                } else {
                    if (!isThresholdExceeded) {
                        ctx.stroke();  // End previous normal path
                        ctx.beginPath();  // Start a new path for threshold-exceeding values
                        ctx.strokeStyle = "red";
                        isThresholdExceeded = true;
                        ctx.moveTo(x, y);
                    }
                    ctx.lineTo(x, y);
                }
            }
            ctx.stroke();  // Final stroke to complete any remaining path
        }
    }

    Connections {
        target: AudioChart
        function onAudioSeriesChanged() {
            audioData = AudioChart.audioSeries;
            audioWaveform.requestPaint();
        }
    }
}
