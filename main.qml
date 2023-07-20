// Copyright (C) 2017 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

import QtQuick
import QtQuick.Controls
import QtWebEngine
import QtQuick.Layouts
import QtQuick.VirtualKeyboard


Window {
    id: rootWindow
    visible: true
    width: initialWidth
    height: initialHeight
    title: webView.title

    Component.onCompleted: {
        console.log("CLIFF: Component.onCompleted")
    }

    Item {
      id: wrapper
      anchors.fill: parent
      rotation: +initialRotation

      property bool isRotated: rotation === 90

      Component.onCompleted: {
          console.log("CLIFF: wrapper rotation: ", rotation)
          console.log("CLIFF: wrapper isRotated: ", isRotated)
      }


      WebEngineView {
          id: webView
          url: initialUrl
          anchors.left: parent.left
          anchors.top: parent.top
          anchors.right: parent.right
          anchors.bottom: inputPanel.top
          height: parent.width

          //anchors.fill: parent

          onLoadingChanged: function(loadRequest) {
              if (loadRequest.errorString)
                  console.error(loadRequest.errorString);
          }

          Component.onCompleted: {
            console.log("CLIFF: webView rotation: ", wrapper.rotation)
            console.log("CLIFF: webView isRotated: ", wrapper.isRotated)
          }
      }

      InputPanel {
        id: inputPanel
        y: Qt.inputMethod.visible ? parent.width - inputPanel.height : parent.width
        anchors.left: parent.left
        anchors.right: parent.right
      }
    }

}
