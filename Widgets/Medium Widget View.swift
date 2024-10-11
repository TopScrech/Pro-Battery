import SwiftUI

struct MediumWidgetView: View {
    private var entry: Provider.Entry
    
    init(_ entry: Provider.Entry) {
        self.entry = entry
    }
    
    var body: some View {
        HStack {
            BatteryGauge(50)
            
            Spacer()
            
            VStack(alignment: .leading) {
                Param("Max. capacity", param: "16")
                
                Param("Charge cycles", param: "16")
                
                Param("Condition", param: "Normal")
            }
            .frame(maxWidth: 170)
        }
        .padding(.leading, 30)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(alignment: .topTrailing) {
            if entry.configuration.showBuildNumber {
                Text(version())
                    .caption2()
                    .foregroundStyle(.tertiary)
                    .offset(x: 12, y: -8)
            }
        }
    }
}

//#Preview {
//    MediumWidgetView()
//}
