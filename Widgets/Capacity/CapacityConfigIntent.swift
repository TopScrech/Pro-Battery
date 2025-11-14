import AppIntents

struct CapacityConfigIntent: WidgetConfigurationIntent {
    static let title: LocalizedStringResource = "Pro Battery"
    static let description: IntentDescription = "Max. capacity"
    
    @Parameter(title: "Show title", default: true)
    var showTitle: Bool
}
