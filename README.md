## ModelUtility

JSON转Model框架，解决其他类似框架在Swift中使用CoreData的Crash问题以及解析不成功等问题，`嵌套类型`必须支持，专注于为Swift提供一个强大且稳定的Model框架。

### 安装

> pod 'ModelUtility', :git => 'https://github.com/isunimp/ModelUtility.git'

### 使用

##### 不使用CoreData

```swift
class User: NSObject {
    var id: NSNumber? // 不能使用`Int?` 该类型OC runtime解析不出，会导致属性解析失败
    var userInfo: UserInfo?
}

class UserInfo: NSObject {
    var name: String?
    var age: NSNumber?
}

let JSON = ["id":1,"userInfo":["name":"isunimp","age":22]]
let user =  User.mu_modelWithKeyValues(JSON)

print("id:\(user.id)")                  // 1
print("name:\(user.userInfo?.name)")    // isunimp
print("age:\(user.userInfo?.age)")      // 22
```

##### 使用CoreData

<img src="http://7xrukr.com1.z0.glb.clouddn.com/ModelUtility_SwiftExamples_xcdatamodeld.png-isunimp" height=60% width=60%/>
> 注意：userInfo使用类型为`Transformable`

```swift
class User: NSManagedObject {
    @NSManaged var id: NSNumber?
    @NSManaged var userInfo: UserInfo?
}

class UserInfo: NSManagedObject {
    @NSManaged var name: String?
    @NSManaged var age: NSNumber?
}

let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
let objectContext = appDelegate.managedObjectContext
let JSON = ["id":1,"userInfo":["name":"isunimp","age":22]]
let user =  User.mu_modelWithClass(User.self, keyValues: JSON, inContext: objectContext)

print("id:\(user.id)")                  // 1
print("name:\(user.userInfo?.name)")    // isunimp
print("age:\(user.userInfo?.age)")      // 22
```
更多功能敬请期待，欢迎[issue](https://github.com/isunimp/ModelUtility/issues)。
