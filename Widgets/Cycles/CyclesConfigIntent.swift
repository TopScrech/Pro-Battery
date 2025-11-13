import AppIntents

struct CyclesConfigIntent: WidgetConfigurationIntent {
    static let title: LocalizedStringResource = "Pro Battery"
    static let description: IntentDescription = "Charge cycles"
    
    @Parameter(title: "Show title", default: true)
    var showTitle: Bool
    
    @Parameter(title: "Show design cycles", default: false)
    var showDesignCycles: Bool
}
