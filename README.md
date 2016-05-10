## ModelUtility

JSON转Model框架，解决其他类似框架在Swift使用CoreData的Crash问题以及解析不成功等问题。

### 安装

> pod 'ModelUtility', :git => 'https://github.com/isunimp/ModelUtility.git'

### 使用

```
class User: NSObject {
var id: NSNumber?
var userInfo: UserInfo?
}

class UserInfo: NSObject {
var name: String?
var age: NSNumber?
}

let JSON = ["id":1,"userInfo":["name":"isunimp","age":22]]
let user =  User.mu_modelWithKeyValues(JSON)
```

更多功能敬请期待，欢迎[issue](https://github.com/isunimp/ModelUtility/issues)。