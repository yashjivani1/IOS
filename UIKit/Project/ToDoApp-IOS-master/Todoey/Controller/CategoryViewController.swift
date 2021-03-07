
import UIKit
import CoreData

class CategoryViewController: UITableViewController {

    var categories = [Category1]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    override func viewDidLoad() {
        super.viewDidLoad()
print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        loadCategories()
        tableView.tableFooterView = UIView()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        cell.textLabel?.text = categories[indexPath.row].name
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
  

    func deletess(rowIndexPathAt indexPath : IndexPath) -> UIContextualAction{
        let action = UIContextualAction(style: .destructive, title: "Delete") {[weak self] (_, _, _) in
            guard let self = self else{ return }
            self.deleteItems(indexPath: indexPath)
            self.deleteCategory(indexPath: indexPath)
            self.categories.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            
            self.saveCategories()
        }
        
        return action
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete1 = self.deletess(rowIndexPathAt : indexPath)
        let swipe = UISwipeActionsConfiguration(actions: [delete1])
        return swipe

    }
    
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow{
            destinationVC.selectedCategory = categories[indexPath.row]
        }
        
    }
 
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var texField = UITextField()
        
        let alert = UIAlertController(title: "Add new Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            let newCategory = Category1(context : self.context)
            newCategory.name = texField.text!
            self.categories.append(newCategory)
            
            self.saveCategories()
        }
        
        alert.addTextField { (field) in
            texField = field
            texField.placeholder = "Add a new Category"
            
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func saveCategories(){
        do{
            try context.save()
        }catch{
            print("Error saving category \(error)")
        }
        
        tableView.reloadData()
    }
    
    func loadCategories(){
        let request : NSFetchRequest<Category1> = Category1.fetchRequest()
        
        do{
            categories = try context.fetch(request)
        }catch{
            print("Error loading categoes \(error)")
        }
        
        tableView.reloadData()
        
        
    }
    
        func deleteItems(indexPath : IndexPath){
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
              fetchRequest.predicate = NSPredicate(format: "parentCategory.name == %@", categories[indexPath.row].name!)
    
    
    
              let result = try? context.fetch(fetchRequest)
              for x in result!{
                print(x)
                context.delete(x.self as! NSManagedObject)
              }
        }
    
        func deleteCategory(indexPath : IndexPath){
            let category = categories[indexPath.row]
    
            context.delete(category)
        }
}
