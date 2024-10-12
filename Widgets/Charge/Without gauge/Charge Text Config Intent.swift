import AppIntents

struct ChargeTextConfigIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Pro Battery"
    static var description: IntentDescription = "Battery level"
    
    @Parameter(title: "Show title", default: true)
    var showTitle: Bool
}
