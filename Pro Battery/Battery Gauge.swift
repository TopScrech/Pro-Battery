import SwiftUI

struct BatteryGauge: View {
    private let charge: Double
    
    init(_ charge: Double) {
        self.charge = charge
    }
    
    private var tint: Color {
        switch charge {
        case 0...5: .red
        case 6...15: .yellow
        case 16...100: .green
        default: .gray
        }
    }
    
    private var icon: String {
        !(0...100).contains(charge) ? "exclamationmark.triangle" : "macbook"
    }
    
    var body: some View {
        Gauge(value: charge, in: 0...100) {
            Image(systemName: icon)
                .fontSize(20)
        }
        .gaugeStyle(.accessoryCircularCapacity)
        .tint(tint)
        .scaleEffect(2)
    }
}

#Preview {
    VStack {
        Group {
            BatteryGauge(-1)
            BatteryGauge(5)
            BatteryGauge(15)
            BatteryGauge(80)
            BatteryGauge(100)
        }
        .padding(40)
    }
    .frame(width: 200, height: 800)
}
