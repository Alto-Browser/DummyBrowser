//

import SwiftUI
import OpenADK

struct BrowserView: View {
    var state: (any StateProtocol)?
    let id = UUID()
    
    var body: some View {
        VStack {
            Text(id.uuidString)
            Text("\(state?.id.uuidString)")
            
            HStack {
                if let tabs = state?.currentSpace?.localLocations[0].tabs {
                    ForEach(Array(tabs.enumerated()), id: \.element.id) { index, tabItem in
                        Rectangle()
                    }
                }
                
                Spacer()
                Button {
                    if let tabManager = state?.tabManager as? TabsManager {
                        tabManager.createNewTab(location: "pinned")
                    }
                } label: {
                    Text("Traffic light buttons")
                }
            }
            
            HStack {
                if let currentContent = state?.currentContent {
                    ForEach(Array((currentContent.enumerated())), id: \.element.id) { index, content in
                        AnyView(content.returnView())
                    }
                    
                }
                Spacer()
            }
        }
        .padding()
    }
}
