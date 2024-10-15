import AppIntents

struct CyclesConfigIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Pro Battery"
    static var description: IntentDescription = "Charge cycles"
    
    @Parameter(title: "Show title", default: true)
    var showTitle: Bool
    
    @Parameter(title: "Show design cycles", default: false)
    var showDesignCycles: Bool
}
