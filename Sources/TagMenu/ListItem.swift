
import Foundation

public class ListItem<T: Displayable>: Identifiable, Equatable {

    public let id = UUID()
    let value: T
    
    public init(value: T) {
        self.value = value
    }
    
    static public func == (lhs: ListItem<T>, rhs: ListItem<T>) -> Bool {
        return lhs.id == rhs.id
    }
}

public final class SelectableListItem<T: Displayable>: ListItem<T> {
    public var selected: Bool
    
    public init(value: T, selected: Bool = false) {
        self.selected = selected
        super.init(value: value)
    }
}
