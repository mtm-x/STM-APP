import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Window

Window {
    id : winMain
    width: 1140
    height: 580
    visible: true
    title: qsTr("Traffic Controller")
    color: "#292b3a"

    maximumWidth: 1140
    maximumHeight: 580
    minimumWidth: 1140
    minimumHeight: 580

    FontLoader {
        id: productsans
        source: "qrc:/res/fonts/ProductSansRegular.ttf"

    }

    Rectangle {

        id: rectangle1
        anchors.horizontalCenter: parent.horizontalCenter
        width: 5
        height: 680
        color : "#ddd8ff"
    }

    Dialog {
        id: dialog
        anchors.centerIn: parent
        title: "Confirmation"
        standardButtons: Dialog.Yes | Dialog.No

        onAccepted: console.log("Yes clicked")
        onRejected: console.log("No clicked")
    }

    Rectangle {

        id: rectangle2
        anchors.left: parent.left
        anchors.leftMargin: 110
        anchors.verticalCenter: parent.verticalCenter
        width: 390
        height: 310
        color: "#ddd8ff"
        radius: 5

        Label {
            id: label
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: productsans.name
            font.bold: true
            color: "#292b3a"
            text: qsTr("CAM 1")
            font.pixelSize: 20
            // Image {
            //     source: "qrc:res/t.png"
            // }
        }

        RowLayout{
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -50
            spacing: 20

            Button {
                id: makeGreen
                font.family: productsans.name
                font.bold: true
                text: qsTr("Make Green")
                width: 13
                height: 7

                background: Rectangle {
                    radius: 3
                    color: makeGreen.down ? "#1bc274" : (makeGreen.hovered ? "#17a864" : "#1bc274")
                }

                contentItem: Text {
                    text: makeGreen.text
                    font: makeGreen.font
                    color: "#fafcfc"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                       dialog.open()
                    }
                }
            }


            Button {
                id: makeRed
                font.family: productsans.name
                font.bold: true
                text: qsTr("Make Red")
                background: Rectangle {
                    radius: 3
                    color: makeRed.down ? "#e04a4d" : (makeRed.hovered ? "#f04548" : "#ff5c5f")

                }
                contentItem: Text {
                    text: makeRed.text
                    font: makeRed.font
                    color: "#fafcfc"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        dialog.open()
                    }
                }
            }
        }
    }

    Row{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: 280
        anchors.top:parent.top
        anchors.topMargin: 130
        spacing: 40


        ColumnLayout{
            spacing: 15

            Label{
                font.family: productsans.name
                font.bold: true
                color: "#ddd8ff"
                text: qsTr("Cam 1")
            }

            Rectangle {
                width: 190
                height: 110
                color: "#ddd8ff"
                radius: 5

                Label {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.family: productsans.name
                    font.bold: true
                    color: "#292b3a"
                    text: qsTr("CAM 1")
                }
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        label.text = qsTr("CAM 1")
                    }
                }
            }

            Label{
                font.family: productsans.name
                font.bold: true
                color: "#ddd8ff"
                text: qsTr("Cam 3")
            }
            Rectangle {
                width: 190
                height: 110
                color: "#ddd8ff"
                radius: 5

                Label {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.family: productsans.name
                    font.bold: true
                    color: "#292b3a"
                    text: qsTr("CAM 3")
                }
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        label.text = qsTr("CAM 3")
                    }
                }
            }
        }

        ColumnLayout{
            spacing: 15
            Label{
                font.family: productsans.name
                font.bold: true
                color: "#ddd8ff"
                text: qsTr("Cam 2")
            }
            Rectangle {
                width: 190
                height: 110
                color: "#ddd8ff"
                radius: 5

                Label {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.family: productsans.name
                    font.bold: true
                    color: "#292b3a"
                    text: qsTr("CAM 2")
                }
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        label.text = qsTr("CAM 2")
                    }
                }
            }
            Label{
                font.family: productsans.name
                font.bold: true
                color: "#ddd8ff"
                text: qsTr("Cam 4")
            }
            Rectangle {
                width: 190
                height: 110
                color: "#ddd8ff"
                radius: 5

                Label {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.family: productsans.name
                    font.bold: true
                    color: "#292b3a"
                    text: qsTr("CAM 4")
                }
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        label.text = qsTr("CAM 4")
                    }
                }
            }
        }
    }
}
