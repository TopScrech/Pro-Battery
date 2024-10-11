import AppIntents

struct ChargeConfigIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Pro Battery"
    static var description: IntentDescription = "Battery level"
    
    @Parameter(title: "Show build number", default: false)
    var showBuildNumber: Bool
    
    @Parameter(title: "Capacity gauge", default: true)
    var capacityGauge: Bool
}
