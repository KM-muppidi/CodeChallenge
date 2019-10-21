import UIKit
import CoreData

class DataManager: NSObject {
    static let shared = DataManager()
    fileprivate let appDelegate: AppDelegate
    fileprivate let context: NSManagedObjectContext
    private override init() {
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
    }
    
    func saveTimeStampData(timeStamp: TimeStamp) {
        let entity = NSEntityDescription.entity(forEntityName: "TimeStampMO", in: context)
        
        let timeStampMO = TimeStampMO(entity: entity!, insertInto: context)
        timeStampMO.name = timeStamp.name
        timeStampMO.entryTime = timeStamp.entryTime
        timeStampMO.exitTime = timeStamp.exitTime
        
        do {
            try context.save()
        } catch {
            print("Failed saving")
        }
    }
    
    func fetchTimeStampsData() -> [TimeStamp] {
        let request = NSFetchRequest<NSManagedObject>(entityName: "TimeStampMO")
        var timeStampObjects = [TimeStamp]()
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try context.fetch(request)
            for timeStampMO in result {
                let timeStamp = TimeStamp()
                timeStamp.name = timeStampMO.value(forKey: "name")! as! String
                timeStamp.entryTime = timeStampMO.value(forKey: "entryTime")! as! String
                timeStamp.exitTime = timeStampMO.value(forKey: "exitTime")! as! String
                timeStampObjects.append(timeStamp)
            }
            
        } catch {
            
            print("Failed")
        }
        return timeStampObjects
    }
}
