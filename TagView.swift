
import SwiftUI

struct TagView: View {
    let action: () -> ()
    let title: String
    let selected: Bool
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Text(title)
        }
        .foregroundColor(.black)
        .padding(.vertical, 10)
        .padding(.horizontal, 22)
        .overlay(RoundedRectangle(cornerRadius: 18)
                    .stroke(selected ? Color.black : Color.gray,
                            lineWidth: 2))
        
    }
}
