import SwiftUI
import WidgetKit

struct ChargeEntry: TimelineEntry {
    let date: Date
    let charge: Double
    let cycles: Int
    let capacity: Int
    let condition: String
    let configuration: ChargeConfigIntent
}
