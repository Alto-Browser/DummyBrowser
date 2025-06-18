//

import SwiftUI
import AppKit
import OpenADK

@main
struct AltoApp: App {
    /// Because  abrowser needs to spawn multiple copies of its window and keep track of them we use an appDelegate
    /// This will run `applicationDidFinishLaunching` after the app finishes launching
    /// We then use WindowManager class from OpenADK to handle windows
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        /// No default window we use WindowManager instead of a WindowGroup
        Settings {
            // SettingsView()
        }
    }
}


