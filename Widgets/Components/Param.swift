import SwiftUI

struct Param: View {
    private let name: LocalizedStringKey
    private let param: String
    
    init(_ name: LocalizedStringKey, param: String) {
        self.name = name
        self.param = param
    }
    
    init(_ name: LocalizedStringKey, param: Int) {
        self.name = name
        self.param = param.description
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
