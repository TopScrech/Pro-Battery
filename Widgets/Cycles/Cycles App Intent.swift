import AppIntents

struct CyclesAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Pro Battery"
    static var description: IntentDescription = "Charge cycles"
    
    @Parameter(title: "Show title", default: true)
    var showTitle: Bool
}
