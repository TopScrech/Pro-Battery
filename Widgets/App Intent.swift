import AppIntents

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Pro Battery"
    static var description: IntentDescription = "Battery level"
    
    @Parameter(title: "Show build number", default: false)
    var showBuildNumber: Bool
}
