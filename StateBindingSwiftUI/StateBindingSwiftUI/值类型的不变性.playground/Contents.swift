import UIKit

//struct为值类型,有不可变性.
//相当于一张纸质文件,里面不允许修改一样,如要修改,只能复印一份,然后在复印件里面修改,修改完替换掉原有文件
//所以mutating关键字在底层就是做了上述工作,也就是先复制一份struct实例,再修改其属性,最后把这个复印件返回出来了
struct Person {
    var name = "张三"
    mutating func setName(newName: String) {
        name = newName
    }
}
var person = Person()
//先复制一份person,在复印件中修改name,最后把修改之后的复印件赋给了person变量
person.setName(newName: "李四")
person.name

