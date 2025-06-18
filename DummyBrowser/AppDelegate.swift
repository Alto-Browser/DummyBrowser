//



import SwiftUI
import AppKit
import OpenADK

/// Handles major portions of tha app lifecycle
///
/// Because browsers need the ability to open many windows we need a managments system
/// We use a WindowManager class but this is needed to handling opening windows according to the app lifecycle
class AppDelegate: NSObject, NSApplicationDelegate {
    var windowManager = Alto.shared.windowManager
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        print("App Launched")
        
        var windowConfig = DefaultWindowConfiguration()
        
        // windowConfig.stateFactory = { State2() }
        
        windowConfig.setView { state in
            BrowserView(state: state)
        }
        
        windowManager.configuration = windowConfig
        
        windowManager.createWindow(tabs: [])
    }
}

import Observation
import WebKit
import Observation
import Combine
