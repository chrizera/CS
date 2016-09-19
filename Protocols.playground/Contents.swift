//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

protocol TabularDataSource {
    var numberOfRows: Int {get}
    var numberOfColumns: Int {get}
    
    func labelForRow(row: Int) -> String
    func labelForColumn(column: Int) -> String
    
    func itemForRow(row: Int, column: Int) -> Int
}

/*func printTable(data: [[Int]]){
    for row in data {
        var out = ""
        
        for item in row {
            out += " \(item) |"
        }
        print(out)
    }
    
}*/
//func printTable(rowLabels: [String], columnLabels: [String], data: [[Int]]) {
func printTable(dataSource: protocol<TabularDataSource, CustomStringConvertible>) {
    
    print("Table: \(dataSource.description)")

    let rowLabels = (0 ..< dataSource.numberOfRows).map{dataSource.labelForRow($0)}
    let columnLabels = (0 ..< dataSource.numberOfColumns).map{dataSource.labelForColumn($0)}
    
    let rowLabelWidths = rowLabels.map{$0.characters.count}
    
    guard let maxRowLabelWidth = rowLabelWidths.maxElement() else {
        return
    }
    
    var firstRow: String = padding(maxRowLabelWidth) + " |"
    var columnWidths = [Int]()
    
    for columnLabel in columnLabels {
        let columnHeader = " \(columnLabel) |"
        firstRow += columnHeader
        columnWidths.append(columnHeader.characters.count)
    }
    print(firstRow)
    
    //for (i, row) in data.enumerate() {
    for i in 0 ..< dataSource.numberOfRows {
        let paddingAmount = maxRowLabelWidth - rowLabelWidths[i]
        var out = rowLabels[i] + padding(paddingAmount) + " |"
    
    
    /*for item in row {
        out += " \(item) |"
    }*/
        //for (j, item) in row.enumerate() {
        for j in 0 ..< dataSource.numberOfColumns {
            let item = dataSource.itemForRow(i, column: j)
            let itemString = " \(item) |"
            let paddingAmount = columnWidths[j] - itemString.characters.count
            out += padding(paddingAmount) + itemString
        }
    
    print(out)
    }
}

func padding(amount: Int) -> String {
    var paddingString = ""
    
    for _ in 0 ..< amount {
        paddingString += " "
    }
    return paddingString
}

/*let rowLabels = ["Joe", "Karen", "Fred"]
let columnLabels = ["Age", "Years of Experience"]
let data = [[30, 6], [40, 18], [50, 20]]

printTable(rowLabels,columnLabels: columnLabels, data: data)*/

struct Person {
    let name: String
    let age: Int
    let yearsOfExperience: Int
}
struct Department: TabularDataSource, CustomStringConvertible{
    let name: String
    var people = [Person]()
    var description: String {
        return "Department (\(name))"
    }
    
    init(name: String){
        self.name = name
    }
    
    mutating func addPerson(person: Person) {
        people.append(person)
    }
    
    var numberOfRows: Int {
        return people.count
    }
    var numberOfColumns: Int {
        return 2
    }
    func labelForRow(row: Int) -> String {
        return people[row].name
    }
    func labelForColumn(column: Int) -> String {
        switch column {
        case 0:
            return "Age"
        case 1:
            return "Years of Experience"
        default:
            fatalError("Invalid Column")
        }
    }
    func itemForRow(row: Int, column: Int) -> Int {
        let person = people[row]
        switch column {
        case 0:
            return person.age
        case 1:
            return person.yearsOfExperience
        default:
            fatalError("Invalid column")
        }
    }
}

var department = Department(name: "Engineering")
department.addPerson(Person(name: "Joe", age: 30, yearsOfExperience: 6))
department.addPerson(Person(name: "Karen", age: 40, yearsOfExperience: 18))
department.addPerson(Person(name: "Fred", age: 50, yearsOfExperience: 20))

printTable(department)
//print(department)

