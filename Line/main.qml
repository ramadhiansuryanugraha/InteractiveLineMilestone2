import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1

ApplicationWindow{
    visible: true
    width: 500
    height: 500
    title: 'cek'

    RowLayout{
        id: buttonges
        anchors.horizontalCenter: parent.horizontalCenter
        z: canvas.z + 1

        Button{
            text: 'Reset'

            onClicked: {
                canvas.clear()
            }
        }

        Button{
            text: 'Exit'

            onClicked: {
                Qt.quit()
            }
        }
    }

    Canvas{
        id: canvas
        anchors.fill: parent
        property int lastX: 0
        property int lastY: 0

        function clear(){
            var ctx = getContext('2d');
            ctx.reset();
            canvas.requestPaint();
        }

        MouseArea{
            id: areacuy
            anchors.fill: parent

            onPressed: {
                canvas.lastX=mouseX;
                canvas.lastY=mouseY;
                canvas.clear()

            }

            onPositionChanged: {
                canvas.requestPaint();
            }
        }

        onPaint: {
            var ctx = getContext('2d')
            ctx.linewidth = 8;
            ctx.beginPath()
            ctx.moveTo(lastX, lastY)
            lastX = areacuy.mouseX;
            lastY = areacuy.mouseY;
            ctx.lineTo(lastX, lastY);
            ctx.stroke();
        }
    }
}
