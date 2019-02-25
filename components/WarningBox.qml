import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.0

import "." as MoneroComponents

Rectangle {
    id: root
    property alias text: content.text
    property alias textColor: content.color
    property bool small: false
    property int fontSize: 15 * scaleRatio

    Layout.fillWidth: true
    Layout.preferredHeight: warningLayout.height

    color: "#09FFFFFF"
    radius: 4
    border.color: MoneroComponents.Style.inputBorderColorInActive
    border.width: 1

    signal linkActivated;

    RowLayout {
        id: warningLayout
        spacing: 0
        anchors.left: parent.left
        anchors.right: parent.right

        Image {
            Layout.alignment: Qt.AlignVCenter
            Layout.preferredHeight: 33 * scaleRatio
            Layout.preferredWidth: 33 * scaleRatio
            Layout.rightMargin: 12 * scaleRatio
            Layout.leftMargin: 18 * scaleRatio
            Layout.topMargin: 12 * scaleRatio
            Layout.bottomMargin: 12 * scaleRatio
            source: "../images/warning.png"
            visible: !small
        }

        TextArea {
            id: content
            Layout.fillWidth: true
            color: MoneroComponents.Style.defaultFontColor
            font.family: MoneroComponents.Style.fontRegular.name
            font.pixelSize: root.fontSize
            horizontalAlignment: TextInput.AlignLeft
            selectByMouse: true
            textFormat: Text.RichText
            wrapMode: Text.WordWrap
            textMargin: 0
            leftPadding: ((small) ? 3 : 4) * scaleRatio
            rightPadding: ((small) ? 12 : 18) * scaleRatio
            topPadding: ((small) ? 6 : 10) * scaleRatio
            bottomPadding: ((small) ? 6 : 10) * scaleRatio
            readOnly: true
            onLinkActivated: root.linkActivated();

            selectionColor: MoneroComponents.Style.dimmedFontColor
            selectedTextColor: MoneroComponents.Style.defaultFontColor
        }
    }
}
