import WidgetKit

struct CyclesEntry: TimelineEntry {
    let date: Date
    let cycles: Int
    let designCycles: Int
    let configuration: CyclesConfigIntent
}
