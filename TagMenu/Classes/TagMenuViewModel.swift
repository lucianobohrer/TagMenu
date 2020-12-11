
import Foundation
import Combine

public final class TagMenuViewModel<T: Displayable>: ObservableObject {
    
    public enum SelectionType {
        case single
        case multiple(max: Int)
    }
    
    @Published public private(set) var items: [SelectableListItem<T>]
    public private(set) var selectedItemsSubject = PassthroughSubject<[SelectableListItem<T>], Never>()
    public private(set) var title: String
    public var displayTitle: Bool {
        return !title.isEmpty
    }
    
    private let selectionType: SelectionType
    private var selectedItems: [SelectableListItem<T>] {
        self.items.filter({ $0.selected })
    }
    
    public init(items: [SelectableListItem<T>], title: String = "", selection: SelectionType = .single) {
        self.items = items
        self.title = title
        self.selectionType = selection
        
        if case let .multiple(max) = selection, self.selectedItems.count > max {
            fatalError("Selected items must be less then max allowed")
        }
    }
    
    public func handleSelection(item: SelectableListItem<T>) {
        self.items = self.items.compactMap { [weak self] (value) in
            guard let self = self else { return nil }
            switch self.selectionType {
            case .single:
                value.selected = value == item && !value.selected ? true : false
            case .multiple(let max) where item == value:
                if self.selectedItems.count < max {
                    value.selected.toggle()
                } else if item.selected {
                    value.selected.toggle()
                }
            default: break
            }
            return value
        }
        self.selectedItemsSubject.send(self.selectedItems)
    }
}

public protocol Displayable {
    var displayed: String { get }
}
