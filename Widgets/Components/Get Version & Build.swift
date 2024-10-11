import Foundation

func version() -> String {
    let dick = Bundle.main.infoDictionary
    let version = dick?["CFBundleShortVersionString"] as? String ?? ""
    let build = dick?["CFBundleVersion"] as? String ?? ""
    
    return "v\(version) (B\(build))"
}
