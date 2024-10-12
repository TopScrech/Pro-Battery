import WidgetKit

struct ChargeEntry: TimelineEntry {
    let date: Date
    let charge: Double
    let configuration: ChargeConfigIntent
}
