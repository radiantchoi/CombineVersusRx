//
//  ViewModel.swift
//  CombineVersusRx
//
//  Created by Gordon Choi on 2023/03/02.
//

import Combine

import RxSwift

final class ViewModel {
    @Published var combineFirstStream: Int
    @Published var combineSecondStream: Int
    
    // 프로퍼티 래퍼가 써 보고 싶어서 사용했지만~
    // Observable<Int> 표현은 AnyCancellable<Int, Error> 와 같다고 볼 수 있습니다.
    // PublishSubject<Int>() 표현은 PassThroughSubject<Int, Error>()와 같다고 볼 수 있습니다.
    // onNext 메서드는 send 메서드와 같습니다.
    // 직접 이를 적용해 수정해보는 것도 좋습니다.
    
    private var rxFirstSubject = BehaviorSubject(value: 1)
    private var rxSecondSubject = BehaviorSubject(value: 1)
    
    var rxFirstStream: Observable<Int> {
        return rxFirstSubject.asObservable()
    }
    var rxSecondStream: Observable<Int> {
        return rxSecondSubject.asObservable()
    }

    init() {
        combineFirstStream = 1
        combineSecondStream = 1
    }
    
    func increaseCombineFirstStream() {
        combineFirstStream += 1
    }
    
    func increaseCombineSecondStream() {
        combineSecondStream += 1
    }
    
    func increaseRxFirstStream() {
        guard let value = try? rxFirstSubject.value() else {
            debugPrint("Failed to get value")
            return
        }
        
        rxFirstSubject.onNext(value + 1)
    }
    
    func increaseRxSecondStream() {
        guard let value = try? rxSecondSubject.value() else {
            debugPrint("Failed to get value")
            return
        }
        
        rxSecondSubject.onNext(value + 1)
    }
}
