import AppIntents

struct CapacityConfigIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Pro Battery"
    static var description: IntentDescription = "Max. capacity"
    
    @Parameter(title: "Show title", default: true)
    var showTitle: Bool
}
