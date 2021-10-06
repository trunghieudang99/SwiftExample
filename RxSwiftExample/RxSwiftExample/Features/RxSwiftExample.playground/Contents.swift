import UIKit
import RxSwift

var greeting = "Hello, playground"

let one = 1
 let two = 2
 let three = 3
// 2

let observable2: Observable<Int> = Observable.of(one, two, three)

let observable3 = Observable.of([one, two, three])

let observable4 = Observable.from([one, two, three])
 

observable3.subscribe(
    onNext: { print($0) },
    onError: { print($0)},
    onCompleted: { print("Completed") },
    onDisposed: { print("Disposed") }

).disposed(by: DisposeBag())

