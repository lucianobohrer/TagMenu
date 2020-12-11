
import SwiftUI
import Combine

public struct HorizontalListView<T: Displayable>: View {
    @ObservedObject public var viewModel: HorizontalListViewModel<T>
    
    public var rightToLeft: Bool = false
    public var tagSettings: TagMenuSettings = TagMenuSettings()
    
    public var body: some View {
        VStack {
            if self.viewModel.displayTitle {
                Text(self.viewModel.title)
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
                    .font(Font(tagSettings.font))
                    .padding(.leading, 8)
                    
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(self.viewModel.items, id: \.id) { (item) in
                        TagView(action: {
                            self.viewModel.handleSelection(item: item)
                        },
                        title: item.value.displayed,
                        selected: item.selected,
                        settings: self.tagSettings)
                    }
                }
                .padding(8)
            }
            
        }
        .background(Color.white)
    }
}

struct HorizontalListView_Previews: PreviewProvider {
    static var cancellable: Cancellable?
    
    static var previews: some View {
        
        let vm = HorizontalListViewModel<String>(items: [
            SelectableListItem(value: "Item 1", selected: true),
            SelectableListItem(value: "Item 2"),
            SelectableListItem(value: "Item 3"),
            SelectableListItem(value: "Item 4"),
            SelectableListItem(value: "Item 5"),
            SelectableListItem(value: "Item 6")
        ],
        title: "",
        selection: .single)
        
        let view = HorizontalListView<String>(viewModel: vm,
                                              tagSettings: TagMenuSettings())
        
        cancellable = vm.selectedItemsSubject.sink { (values) in
            print(values)
        }
        
        return view
    }
}

extension String: Displayable {
    public var displayed: String {
        self
    }
}
