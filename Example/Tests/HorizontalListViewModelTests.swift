
import XCTest
import Combine
import TagMenu

final class HorizontalListViewModelTests: XCTestCase {
    var viewModel: TagMenuViewModel<TestItem>!
    var cancellables = Set<AnyCancellable>()
    
    func testViewModelDisplayTitle() {
        viewModel = TagMenuViewModel<TestItem>(items: [],
                                                    title: "title")
        XCTAssertEqual(viewModel.title, "title")
        XCTAssertTrue(viewModel.displayTitle)
    }
    
    func testViewModelNotDisplayTitle() {
        viewModel = TagMenuViewModel<TestItem>(items: [])
        XCTAssertFalse(viewModel.displayTitle)
    }
    
    func testViewModelSingleSelection() {
        let item1 = SelectableListItem(value: TestItem(name: "item 1", price: 10))
        let item2 = SelectableListItem(value: TestItem(name: "item 2", price: 20))
        let item3 = SelectableListItem(value: TestItem(name: "item 3", price: 30))
        
        viewModel = TagMenuViewModel<TestItem>(items: [item1,
                                                              item2,
                                                              item3])
        
        let subscriber = CurrentValueSubject<[SelectableListItem<TestItem>], Never>([])
        
        viewModel.selectedItemsSubject
            .subscribe(subscriber)
            .store(in: &cancellables)
        
        viewModel.handleSelection(item: item1)
        viewModel.handleSelection(item: item2)
        
        XCTAssertEqual(subscriber.value.count, 1)
        XCTAssertEqual(subscriber.value.first, item2)
    }
    
    func testViewModelMultipleSelection() {
        let item1 = SelectableListItem(value: TestItem(name: "item 1", price: 10))
        let item2 = SelectableListItem(value: TestItem(name: "item 2", price: 20))
        let item3 = SelectableListItem(value: TestItem(name: "item 3", price: 30))
        
        viewModel = TagMenuViewModel<TestItem>(items: [item1,
                                                            item2,
                                                            item3],
                                                      selection: .multiple(max: 3))
        
        let subscriber = CurrentValueSubject<[SelectableListItem<TestItem>], Never>([])
        
        viewModel.selectedItemsSubject
            .subscribe(subscriber)
            .store(in: &cancellables)
        
        viewModel.handleSelection(item: item3)
        viewModel.handleSelection(item: item2)
        viewModel.handleSelection(item: item1)
        
        XCTAssertEqual(subscriber.value.count, 3)
        XCTAssertEqual(subscriber.value, [item1, item2, item3])
    }
    
    func testViewModelMultipleDeselect() {
        let item1 = SelectableListItem(value: TestItem(name: "item 1", price: 10))
        let item2 = SelectableListItem(value: TestItem(name: "item 2", price: 20))
        let item3 = SelectableListItem(value: TestItem(name: "item 3", price: 30))
        
        viewModel = TagMenuViewModel<TestItem>(items: [item1,
                                                              item2,
                                                              item3],
                                                    selection: .multiple(max: 3))
        
        let subscriber = CurrentValueSubject<[SelectableListItem<TestItem>], Never>([])
        
        viewModel.selectedItemsSubject
            .subscribe(subscriber)
            .store(in: &cancellables)
        
        // Selects three
        viewModel.handleSelection(item: item3)
        viewModel.handleSelection(item: item2)
        viewModel.handleSelection(item: item1)

        // Deselects three
        viewModel.handleSelection(item: item3)
        viewModel.handleSelection(item: item2)
        viewModel.handleSelection(item: item1)
        
        XCTAssertEqual(subscriber.value.count, 0)
        XCTAssertTrue(subscriber.value.isEmpty)
    }
    
    func testViewModelOverMaxSelection() {
        let item1 = SelectableListItem(value: TestItem(name: "item 1", price: 10))
        let item2 = SelectableListItem(value: TestItem(name: "item 2", price: 20))
        let item3 = SelectableListItem(value: TestItem(name: "item 3", price: 30))
        
        viewModel = TagMenuViewModel<TestItem>(items: [item1,
                                                            item2,
                                                            item3],
                                                      selection: .multiple(max: 2))
        
        let subscriber = CurrentValueSubject<[SelectableListItem<TestItem>], Never>([])
        
        viewModel.selectedItemsSubject
            .subscribe(subscriber)
            .store(in: &cancellables)
        
        viewModel.handleSelection(item: item3)
        viewModel.handleSelection(item: item2)
        viewModel.handleSelection(item: item1)
        
        XCTAssertEqual(subscriber.value.count, 2)
        XCTAssertEqual(subscriber.value, [item2, item3])
    }
}

struct TestItem: Displayable {
    var displayed: String {
        return "\(name)-\(price)"
    }
    var name: String
    var price: Double
}
