import SwiftUI

struct BatteryGauge: View {
    private let charge: Double
    private let isCapacity: Bool
    
    init(_ charge: Double, isCapacity: Bool = true) {
        self.charge = charge
        self.isCapacity = isCapacity
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
        Group {
            if isCapacity {
                gauge
                    .gaugeStyle(.accessoryCircularCapacity)
            } else {
                gauge
                    .gaugeStyle(.accessoryCircular)
            }
        }
        .tint(tint)
        .scaleEffect(2.2)
    }
    
    private var gauge: some View {
        Gauge(value: charge, in: 0...100) {
            
        } currentValueLabel: {
            Image(systemName: icon)
                .fontSize(20)
        }
    }
}

#Preview {
    HStack {
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
        
        VStack {
            Group {
                BatteryGauge(-1, isCapacity: false)
                BatteryGauge(5, isCapacity: false)
                BatteryGauge(15, isCapacity: false)
                BatteryGauge(80, isCapacity: false)
                BatteryGauge(100, isCapacity: false)
            }
            .padding(40)
        }
    }
    .frame(width: 300, height: 750)
    .darkSchemePreferred()
}
