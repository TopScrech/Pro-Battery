import SwiftUI

struct MediumWidgetView: View {
    var body: some View {
        HStack {
            BatteryGauge(50)
            
            Divider()
                .padding()
                .padding(.leading, 32)
            
            VStack(alignment: .leading) {
                Text("Charge cycles: *16*")
                
                Text("Condition: *Normal*")
                
                Text("Maximum Capacity: *16*")
            }
        }
    }
}

#Preview {
    MediumWidgetView()
}
