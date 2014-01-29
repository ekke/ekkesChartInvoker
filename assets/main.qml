/* Copyright (c) 2014 Ekkehard Gentz (ekke)
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import bb.cascades 1.2

Page {
    property bool invoked: false
    property string invokedWithImage: ""
    onInvokedWithImageChanged: {
        console.debug("Image from CARD: "+ invokedWithImage)
    }
    titleBar: TitleBar {
        title: qsTr("Invokation 'ekkesExpressCharts'")
    }
    actions: ActionItem {
        title: qsTr("Charts on-the-fly")
        imageSource: "asset:///images/chart.png"
        ActionBar.placement: ActionBarPlacement.OnBar
        onTriggered: {
            app.chartImage()
        }
    }
    Container {
        topPadding: 40
        layout: StackLayout {
            orientation: LayoutOrientation.TopToBottom
        }
        verticalAlignment: VerticalAlignment.Fill
        Label {
            // Localized text with the dynamic translation and locale updates support
            text: qsTr("Images from CARD") + Retranslate.onLocaleOrLanguageChanged
            textStyle.base: SystemDefaults.TextStyles.BigText
            multiline: true
        }
        ImageView {
            visible: invoked
            imageSource: invokedWithImage
            scalingMethod: ScalingMethod.AspectFit
        }
    }
}
