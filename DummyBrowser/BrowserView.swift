//

import SwiftUI
import OpenADK

struct BrowserView: View {
    var state: any StateProtocol

    var body: some View {
        VStack {
            if let state = state as? State2 {
                Text(state.id.uuidString)
            }
            Button {
                Alto.shared.windowManager.createWindow(tabs: [])
            } label: {
                Text("Traffic light buttons")
            }
            ColorChangingButtonView()
        }
        .padding()
    }
}


struct ColorChangingButtonView: View {
    @State var waffle: Bool = false
    
    var body: some View {
        Button(action: {
            waffle.toggle()
        }) {
            Text("Tap me!")
                .padding()
                .background(waffle ? Color.blue : Color.red)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
    }
}
