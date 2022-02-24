import CoreData

final class MemoDataManager {

    var memos = [Memo]()
    private let persistentContainer: NSPersistentContainer
    private lazy var viewContext: NSManagedObjectContext = persistentContainer.viewContext
    
    init(modelName: String = "CloudNotes") {
        persistentContainer = NSPersistentContainer(name: modelName)
        loadPersistentContainer()
        setMemos()
    }
    
    func loadPersistentContainer() {
        persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func setMemos() {
        memos = fetchMemos()
    }
    
    private func saveViewContext() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                print("An error occured while saving: \(error.localizedDescription)")
            }
        }
    }
    
    func fetchMemos(predicate: NSPredicate? = nil,
                    sortDescriptors: [NSSortDescriptor]? = [NSSortDescriptor(key: "lastModified", ascending: false)]
    ) -> [Memo] {
        let request = Memo.fetchRequest()
        request.predicate = predicate
        request.returnsObjectsAsFaults = false
        request.sortDescriptors = sortDescriptors
        
        var memos: [Memo] = []
        do {
            memos = try viewContext.fetch(request)
        } catch {
            print(error.localizedDescription)
        }
        return memos
    }
    
    func updateMemo(id: UUID,
                    title: String,
                    body: String,
                    lastModified: Date) {
        let predicate = NSPredicate(format: "id == %@", id.uuidString)
        guard let memo = fetchMemos(predicate: predicate).first else {
            return
        }
        memo.title = title
        memo.body = body
        memo.lastModified = lastModified
        saveViewContext()
    }
    
    func deleteMemo(id: UUID) {
        let request = Memo.fetchRequest()
        let predicate = NSPredicate(format: "id == %@", id.uuidString)
        request.predicate = predicate
        
        do {
            let memos = try viewContext.fetch(request)
            guard let memoToDelete = memos.first else {
                return
            }
            viewContext.delete(memoToDelete)
            let memoToDeleteInArray = self.memos.filter { $0.id == id }
            self.memos = self.memos.filter { memoToDeleteInArray.contains($0) == false }
            saveViewContext()
        } catch {
            print(error.localizedDescription)
        }
    }
}

extension MemoDataManager {
    var newMemo: Memo {
        let newMemo = Memo(context: viewContext)
        newMemo.id = UUID()
        newMemo.title = ""
        newMemo.body = ""
        newMemo.lastModified = Date()
        saveViewContext()
        
        return newMemo
    }
    
    var isEmpty: Bool {
        memos.count == 0
    }
}

