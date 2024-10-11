import AppIntents

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Pro Battery"
    static var description: IntentDescription = "Battery level"
    
    // An example configurable parameter
    @Parameter(title: "Favorite Emoji", default: "😃")
    var favoriteEmoji: String
}
