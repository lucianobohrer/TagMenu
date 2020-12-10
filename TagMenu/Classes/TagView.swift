
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
                .font(Font(settings.font))
        }
        .foregroundColor(Color(settings.regularColor))
        .padding(.vertical, 10)
        .padding(.horizontal, 22)
        .overlay(RoundedRectangle(cornerRadius: settings.cornerRadius)
                    .stroke(selected ? Color(settings.highlightColor) : Color(settings.regularColor),
                            lineWidth: settings.borderSize))
        .background(Color(settings.backgroundColor))
        
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
