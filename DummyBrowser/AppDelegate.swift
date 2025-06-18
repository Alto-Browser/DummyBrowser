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
        
        // creates a window config
        var windowConfig = DefaultWindowConfiguration()
        
        // you provide the window manager with the way to build you browser view
        windowConfig.setView(
            {
                BrowserView(state: State2())
            }
        ) // For a swiftUI view do this
        windowConfig.state = State2()
        /// For an Appkit View do this:
        /// config.setView {
        ///     let view = NSView(frame: NSRect(x: 0, y: 0, width: 200, height: 200))
        ///     view.wantsLayer = true
        ///     view.layer?.backgroundColor = NSColor.systemGreen.cgColor
        ///     return view
        /// }
        
        // tells the window manager to use that window config
        windowManager.configuration = windowConfig
        
        windowManager.createWindow(tabs: [])
        Alto.shared.windowManager.createWindow(tabs: [])
    }
}

import Observation
import WebKit
import Observation
import Combine

@Observable
public class State2: StateProtocol {
    var id = UUID()
    public var tabManager: TabManagerProtocol = TabsManager()
    
    public var currentSpace: SpaceProtocol?
    
    public init() {
        self.tabManager.state = self // Feeds in the state for the tab manager
    }
    
    public func setup(webView: WKWebView) {
        Alto.shared.cookieManager.setupCookies(for: webView)
    }
}
