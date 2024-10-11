import SwiftUI

struct MediumWidgetView: View {
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
    }
}

struct Param: View {
    private let name: LocalizedStringKey
    private let param: String
    
    init(_ name: LocalizedStringKey, param: String) {
        self.name = name
        self.param = param
    }
    
    var body: some View {
        HStack {
            Text(name)
            
            Spacer()
            
            Text("\(param)")
                .semibold()
        }
    }
}

#Preview {
    MediumWidgetView()
}
