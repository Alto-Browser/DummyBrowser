//

import SwiftUI
import OpenADK

struct BrowserView: View {
    var state: (any StateProtocol)?
    let id = UUID()
    
    var body: some View {
        VStack {
            HStack {
                if let tabs = state?.currentSpace?.localLocations[0].tabs {
                    ForEach(Array(tabs.enumerated()), id: \.element.id) { index, tabItem in
                        Button {
                            state?.currentSpace?.currentTab =  Alto.shared.getTab(id: tabItem.id)
                        } label: {
                            Text("tab")
                        }
                    }
                }
                
                Spacer()
                Button {
                    if let tabManager = state?.tabManager as? TabsManager {
                        tabManager.createNewTab(location: "pinned")
                    }
                } label: {
                    Text("+")
                }
            }
            
            HStack {
                if let currentContent = state?.currentContent {
                    ForEach(Array((currentContent.enumerated())), id: \.element.id) { index, content in
                        AnyView(content.returnView())
                    }
                } else {
                    // With No WebView Input it just displays a material
                    NSWebView()
                }
                Spacer()
            }
        }
        .padding()
    }
}
