import Foundation

extension Date {

    var today: Date {
        return rewindDays(0)
    }

    func rewindDays (_ days:Int) -> Date{
        return Calendar.current.date(byAdding: .day, value: days, to: self)!
    }

    func offsetFrom(date: Date) -> Int {

        let cal = Calendar.current

        let startOfCurrentDate = cal.startOfDay(for: date)
        let startOfOtherDay = cal.startOfDay(for: self)

        return cal.dateComponents([.day], from: startOfCurrentDate, to: startOfOtherDay).day!

    }

}

