import UIKit
import RxSwift

let observable = Observable.of(["episodeIV", "episodeV", "episodeVI"])

//observable.subscribe { event in
//    print(event.element ?? event)
//}

observable.subscribe(onNext: { element in
    print(element)
    
})

let disposeBag = DisposeBag()

Observable<String>.create { observer in
//    observer.onNext("R2-D2")
    
    return Disposables.create()
}
.subscribe(

    onNext: { print($0) },
    onError: { print("Error" , $0) },
    onCompleted: { print("Completed")},
    onDisposed: { print("Disposed") }
).disposed(by: disposeBag)


