
import SwiftUI
import Combine

public struct HorizontalListView<T: Displayable>: View {
    @ObservedObject public var viewModel: HorizontalListViewModel<T>
    
    public var rightToLeft: Bool = false
    
    public var body: some View {
        VStack {
            if viewModel.displayTitle {
                Text(viewModel.title)
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
                    .padding(.leading, 8)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(viewModel.items, id: \.id) { (item) in
                        TagView(action: {
                                    self.viewModel.handleSelection(item: item)
                                },
                                title: item.value.displayed,
                                selected: item.selected)
                    }
                }
                .padding(8)
            }
            
        }.background(Color.white)
    }
}

struct HorizontalListView_Previews: PreviewProvider {
    static var cancellable: Cancellable?
    
    static var previews: some View {
        
        let vm = HorizontalListViewModel<String>(items: [
            SelectableListItem(value: "Recommended", selected: true),
            SelectableListItem(value: "Price Low - High"),
            SelectableListItem(value: "Price High - Low"),
            SelectableListItem(value: "Highest Discount")
        ],
        title: "Sort by",
        selection: .multiple(max: 3))
        
        let view = HorizontalListView<String>(viewModel: vm)
        
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
