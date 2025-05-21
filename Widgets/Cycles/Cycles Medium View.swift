import SwiftUI

struct CyclesMediumView: View {
    private let entry: CyclesProvider.Entry
    
    init(_ entry: CyclesProvider.Entry) {
        self.entry = entry
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .bottom, spacing: 0) {
                Text(entry.cycles)
                    .fontSize(250)
                    .minimumScaleFactor(0.01)
                
                if entry.configuration.showDesignCycles {
                    Text("/\(entry.designCycles)")
                        .tertiary()
                        .fontSize(50)
                        .minimumScaleFactor(0.01)
                        .offset(y: -16)
                }
            }
            
            if entry.configuration.showTitle {
                Text("Charge cycles")
                    .secondary()
            }
        }
        .rounded()
    }
}

//#Preview {
//    CyclesMediumView()
//}
