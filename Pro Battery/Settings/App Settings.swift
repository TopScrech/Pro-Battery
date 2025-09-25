import SwiftUI
import LaunchAtLogin

struct AppSettings: View {
    var body: some View {
        Form {
            LaunchAtLogin.Toggle()
        }
        .navigationTitle("Settings")
        .buttonStyle(.plain)
        .formStyle(.grouped)
        .frame(width: 500, height: 600)
    }
}

#Preview {
    AppSettings()
        .darkSchemePreferred()
}
