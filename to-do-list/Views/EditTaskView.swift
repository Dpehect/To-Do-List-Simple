import SwiftUI

struct EditTaskView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: TaskViewModel
    @State var task: Task
    @State private var newTitle: String
    
    init(viewModel: TaskViewModel, task: Task) {
        self.viewModel = viewModel
        self.task = task
        _newTitle = State(initialValue: task.title)
    }
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Görev Adı", text: $newTitle)
                
                Button("Kaydet") {
                    viewModel.updateTask(task: task, with: newTitle)
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .navigationTitle("Görevi Düzenle")
            .navigationBarItems(trailing: Button("İptal") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct EditTaskView_Previews: PreviewProvider {
    static var previews: some View {
        EditTaskView(viewModel: TaskViewModel(), task: Task(title: "Örnek Görev"))
    }
}
