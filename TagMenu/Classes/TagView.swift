
import SwiftUI

struct TagView: View {
    let action: () -> ()
    let title: String
    let selected: Bool
    let settings: TagMenuSettings
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Text(title)
                .font(Font(self.settings.font))
        }
        .foregroundColor(Color(self.settings.regularColor))
        .padding(.vertical, 10)
        .padding(.horizontal, 22)
        .overlay(RoundedRectangle(cornerRadius: self.settings.cornerRadius)
                    .stroke(selected ? Color(self.settings.highlightColor) : Color(self.settings.regularColor),
                            lineWidth: self.settings.borderSize))
        .background(Color(self.settings.backgroundColor))
        
    }
}

public struct TagMenuSettings {
    
    public var highlightColor: UIColor
    public var regularColor: UIColor
    public var backgroundColor: UIColor
    public var font: UIFont
    public var cornerRadius: CGFloat
    public var borderSize: CGFloat
    
    public init(highlightColor: UIColor = .black,
                regularColor: UIColor = .gray,
                backgroundColor: UIColor = .white,
                font: UIFont = .systemFont(ofSize: 14),
                cornerRadius: CGFloat = 18,
                borderSize: CGFloat = 2) {
        self.highlightColor = highlightColor
        self.regularColor = regularColor
        self.backgroundColor = backgroundColor
        self.font = font
        self.cornerRadius = cornerRadius
        self.borderSize = borderSize
    }
}
