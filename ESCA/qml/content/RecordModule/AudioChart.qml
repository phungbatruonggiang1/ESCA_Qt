import QtQuick 2.15
import QtQuick.Controls 2.15
import AudioChartImport 1.0

Rectangle {
    width: 800
    height: 440
    color: "#1e1e1e"
    radius: 20

    property var audioData: []  // Biến lưu dữ liệu âm thanh
    property int maxAmplitude: 32767  // Giá trị biên độ âm thanh (giả sử PCM 16-bit)

    Canvas {
        id: audioWaveform
        anchors.fill: parent

        onPaint: {
            var ctx = getContext("2d");
            ctx.clearRect(0, 0, width, height);

            // Thiết lập phông chữ size và màu cho text
            ctx.font = "16px Oxanium";
            ctx.fillStyle = "white";

            // Draw X label
            ctx.fillText("Amplititude Time Series Chart (s)", audioWaveform.width / 2 - 130, audioWaveform.height - 10);

            // Draw grid Y
            ctx.font = "13px Oxanium";  // Đổi font nhỏ hơn cho số
            var yAxisValues = [-32767, -20, -10, 0, 10, 20, 32767];
            var yAxisStep = (audioWaveform.height - 60) / (yAxisValues.length - 1);

            for (var i = 0; i < yAxisValues.length; i++) {
                var y = 30 + i * yAxisStep;
                ctx.fillText(yAxisValues[i], 0, y);  // Vẽ số sát hơn trục Y
                // Vẽ lưới ngang cho trục Y
                ctx.strokeStyle = "#5A5A5A";
                ctx.lineWidth = 0.5;
                ctx.beginPath();
                ctx.moveTo(30, y);  // Đường lưới bắt đầu từ bên phải số
                ctx.lineTo(audioWaveform.width - 50, y);
                ctx.stroke();
            }

            // Draw  grid X
            var xAxisLogPositions = [0, 0.25, 0.5, 0.75, 1];  // Tỷ lệ vị trí
            var xMin = 30;
            var xMax = audioWaveform.width - 50;
            var xRange = xMax - xMin;

            for (var j = 0; j < xAxisLogPositions.length; j++) {
                var x = xMin + xAxisLogPositions[j] * xRange;
                // Vẽ lưới dọc cho trục X (chỉ lưới, không số)
                ctx.strokeStyle = "#5A5A5A";
                ctx.lineWidth = 0.5;
                ctx.beginPath();
                ctx.moveTo(x, 30);
                ctx.lineTo(x, audioWaveform.height - 30);
                ctx.stroke();
            }

            // Draw line
            ctx.strokeStyle = "#00FFFF";
            ctx.lineWidth = 2;
            ctx.beginPath();
            for (var k = 0; k < audioData.length; k++) {
                var x1 = xMin + k * xRange / (audioData.length - 1);
                var y1 = audioWaveform.height / 2 - (audioData[k] / maxAmplitude) * (audioWaveform.height / 2 - 60);
                if (k === 0) {
                    ctx.moveTo(x1, y1);
                } else {
                    ctx.lineTo(x1, y1);
                }
            }
            ctx.stroke();
        }
    }

    Connections {
        target: AudioChart  // Kết nối đến AudioChart
        function onAudioSeriesChanged() {
            audioData = AudioChart.audioSeries;  // Lấy dữ liệu audio từ AudioChart
            audioWaveform.requestPaint();  // Yêu cầu canvas vẽ lại
            // console.log("Audio data received:", AudioChart.audioSeries);
        }
    }
}
