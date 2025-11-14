import AppIntents

struct ChargeConfigIntent: WidgetConfigurationIntent {
    static let title: LocalizedStringResource = "Pro Battery"
    static let description: IntentDescription = "Battery level"
    
    @Parameter(title: "Capacity gauge", default: true)
    var capacityGauge: Bool
    
    @Parameter(title: "Show build number", default: false)
    var showBuildNumber: Bool
}
