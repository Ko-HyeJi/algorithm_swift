/*
다리를 지나는 트럭

문제 설명
  트럭 여러 대가 강을 가로지르는 일차선 다리를 정해진 순으로 건너려 합니다. 
  모든 트럭이 다리를 건너려면 최소 몇 초가 걸리는지 알아내야 합니다. 
  다리에는 트럭이 최대 bridge_length대 올라갈 수 있으며, 다리는 weight 이하까지의 무게를 견딜 수 있습니다. 
  단, 다리에 완전히 오르지 않은 트럭의 무게는 무시합니다.
  solution 함수의 매개변수로 다리에 올라갈 수 있는 트럭 수 bridge_length, 다리가 견딜 수 있는 무게 weight, 트럭 별 무게 truck_weights가 주어집니다. 
  이때 모든 트럭이 다리를 건너려면 최소 몇 초가 걸리는지 return 하도록 solution 함수를 완성하세요.

제한 조건
  bridge_length는 1 이상 10,000 이하입니다.
  weight는 1 이상 10,000 이하입니다.
  truck_weights의 길이는 1 이상 10,000 이하입니다.
  모든 트럭의 무게는 1 이상 weight 이하입니다.

입출력 예
	bridge_length  weight  truck_weights	                  return
	2	             10	     [7,4,5,6]	                      8
	100	           100	   [10]	                            101
	100	           100	   [10,10,10,10,10,10,10,10,10,10]  110
*/

import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var queue = [(weight: Int, time: Int)]()
    var index = 0
    var time = 0
    
    while index < truck_weights.count {
        for i in 0..<queue.count {
            queue[i].time += 1
        }
        
        if !queue.isEmpty && queue.first!.time == bridge_length {
            queue.removeFirst()
        }
        
        var sum = 0
        for i in 0..<queue.count {
            sum += queue[i].weight
        }
        
        if sum + truck_weights[index] <= weight {
            queue.append((truck_weights[index], 0))
            index += 1
        }
        
        time += 1
    }
    
    time += bridge_length - queue.last!.time

    return time
}

print(solution(2, 10, [7,4,5,6])) // 8
print(solution(100, 100, [10])) // 101
print(solution(100, 100, [10,10,10,10,10,10,10,10,10,10])) // 110