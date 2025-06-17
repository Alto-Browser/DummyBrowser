//

import SwiftUI
import OpenADK

struct BrowserView: View {
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button {
                Alto.shared.windowManager.createWindow(tabs: [])
            } label: {
                Text("trafic light buttons")
            }
        }
        .padding()
    }
}
