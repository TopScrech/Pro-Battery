import WidgetKit

struct ChargeEntry: TimelineEntry {
    let date: Date
    let charge: Double
    let cycles: Int
    let capacity: Int
    let configuration: ChargeConfigIntent
}
