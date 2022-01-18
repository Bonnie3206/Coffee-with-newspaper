//
//  CollectionView.swift
//  iOS_1101_Final
//
//  Created by CK on 2022/1/18.
//

import SwiftUI
import CoreData

struct CollectionView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath:
                                            \PreferItem.timestamp, ascending: true)],
        animation: .default)
    
    private var items: FetchedResults<PreferItem>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    NavigationLink(
                        destination:
                            Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                         ,
                        label:{
                            Text(item.timestamp!,formatter: itemFormatter)
                        }
                    )
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        }
    }
    func addItem(){
        withAnimation{
            let newItem = PreferItem(context: viewContext)
            newItem.timestamp = Date()
            do{
                try viewContext.save()
            }catch{
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError),\(nsError.userInfo)")
            }
        }
    }
    func deleteItems(offsets:IndexSet){
        withAnimation{
            offsets.map {items[$0]}.forEach(viewContext.delete)
            
            do{
                try viewContext.save()
            }catch{
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError),\(nsError.userInfo)")
            }
        }
    }
}
private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)    }
}
