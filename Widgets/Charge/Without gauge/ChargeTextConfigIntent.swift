import AppIntents

struct ChargeTextConfigIntent: WidgetConfigurationIntent {
    static let title: LocalizedStringResource = "Pro Battery"
    static let description: IntentDescription = "Battery level"
    
    @Parameter(title: "Show title", default: true)
    var showTitle: Bool
}
