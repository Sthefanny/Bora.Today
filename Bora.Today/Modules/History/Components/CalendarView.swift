import SwiftUI
import UIKit
import FSCalendar

class CalendarData: ObservableObject{
    
    @Published var selectedDate : Date = Date()
    @Published var titleOfMonth : Date = Date()
    @Published var crntPage: Date = Date()
    
}

struct CalendarView: View {
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    @ObservedObject private var calendarData = CalendarData()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var strDateSelected: String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: calendarData.selectedDate)
    }
    
    var strMonthTitle: String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: calendarData.titleOfMonth)
    }
    
    var body: some View {
        
        GeometryReader { screen in
            VStack(alignment: .leading, spacing: 0) {
                HStack(alignment: .center, spacing: screen.size.width * 0.18) {
                    HStack(alignment: .top, spacing: 4) {
                        
                        Image(systemName: "chevron.left")
                            .font(.appButtonText)
                            .foregroundColor(.appBlueButton)
                        
                        Text("back".localized(language))
                            .font(.appButtonText)
                            .foregroundColor(.appBlueButton)
                        
                    }
                    .padding(.horizontal, 21)
                    .onTapGesture {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    
                    Text("agendaTitle".localized(language))
                        .font(.appTitle2)
                        .fontWeight(.semibold)
                        .foregroundColor(.appBlack)
                }
                .padding(.bottom, 32)
                .padding(.top, 16)
                
                ZStack {
                    VStack {
                        CustomCalendar(dateSelected: $calendarData.selectedDate, mnthNm: $calendarData.titleOfMonth, pageCurrent: $calendarData.crntPage)
                            .padding()
                            .background(
                                Color.appYellow
                            )
                            .frame(height: 350)
                        
                        Text(strDateSelected)
                            .font(.title)
                        
                        Spacer()
                        
                    }
                    
                    
                    VStack {
                        HStack() {
                            
                            Button(action: {
                                
                                self.calendarData.crntPage = Calendar.current.date(byAdding: .month, value: -1, to: self.calendarData.crntPage)!
                                
                            }) {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.appBlack)
                                    .frame(width: 35, height: 35, alignment: .leading)
                            }
                            .frame(width: 35, height: 35, alignment: .leading)
                            
                            Spacer()
                            
//                            Text(strMonthTitle)
//                                .font(.appTitle3)
//                                .fontWeight(.semibold)
                            
//                            Spacer()
                            
                            Button(action: {
                                
                                self.calendarData.crntPage = Calendar.current.date(byAdding: .month, value: 1, to: self.calendarData.crntPage)!
                                
                            }) {
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.appBlack)
                                    .frame(width: 35, height: 35, alignment: .trailing)
                            }
                            .frame(width: 35, height: 35, alignment: .trailing)
                            
                        }
                        .padding(.horizontal, 21)
                        .padding(.top, 10)
                        .offset(CGSize(width: 0, height: 10))
                        
                        Spacer()
                    }
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
            }
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}

struct CustomCalendar: UIViewRepresentable {
    
    typealias UIViewType = FSCalendar
    
    @Binding var dateSelected: Date
    @Binding var mnthNm: Date
    @Binding var pageCurrent: Date
    
    var calendar = FSCalendar()
    
    var today: Date{
        return Date()
    }
    
    func makeUIView(context: Context) -> FSCalendar {
        
        calendar.dataSource = context.coordinator
        calendar.delegate = context.coordinator
        calendar.appearance.headerMinimumDissolvedAlpha = 0
        
        calendar.appearance.headerTitleFont = UIFont(name: AppFont.figtree.name, size: 20)
        calendar.appearance.weekdayFont = UIFont(name: AppFont.figtree.name, size: 14)
        calendar.appearance.titleFont = UIFont(name: AppFont.figtree.name, size: 16)
        calendar.appearance.headerTitleColor = UIColor(Color.appBlack)
        calendar.appearance.weekdayTextColor = UIColor(Color.appDarkGray)
        calendar.appearance.todayColor = UIColor(Color.appBlack)
        calendar.appearance.selectionColor = UIColor(Color.appBlueButtonPressed)
        calendar.appearance.eventSelectionColor = UIColor(Color.appRed)
        calendar.appearance.titleTodayColor = UIColor(Color.white)
        calendar.appearance.titleSelectionColor = UIColor(Color.appBlack)
//        calendar.appearance.headerTitleColor = UIColor(Color.clear)
        
        calendar.scrollEnabled = false
        
        return calendar
    }
    
    func updateUIView(_ uiView: FSCalendar, context: Context) {
        
        uiView.setCurrentPage(pageCurrent, animated: true) // --->> update calendar view when click on left or right button
    }
    
    func makeCoordinator() -> CustomCalendar.Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, FSCalendarDelegate, FSCalendarDataSource {
        
        var parent: CustomCalendar
        
        init(_ parent: CustomCalendar) {
            
            self.parent = parent
        }
        
        func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
            
            parent.dateSelected = date
        }
        
        func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
            
            parent.pageCurrent = calendar.currentPage
            parent.mnthNm = calendar.currentPage
        }
        
        func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
            let eventDates = [Date(), Date(),
                              Date.now.addingTimeInterval(400000),
                              Date.now.addingTimeInterval(100000),
                              Date.now.addingTimeInterval(-600000),
                              Date.now.addingTimeInterval(-1000000)]
            var eventCount = 0
            eventDates.forEach { eventDate in
                if eventDate.formatted(date: .complete,
                                       time: .omitted) == date.formatted(
                                        date: .complete, time: .omitted){
                    eventCount += 1;
                }
            }
            return eventCount
        }
    }
}




////
////  CalendarView.swift
////  Bora.Today
////
////  Created by Sthefanny Gonzaga on 27/10/22.
////
//
//import SwiftUI
//import UIKit
//import FSCalendar
//
//struct CalendarView: View {
//    @State var selectedDate: Date = Date()
//
//    var body: some View {
//
//        GeometryReader { screen in
//            VStack(alignment: .center, spacing: 0) {
//                FormattedDate(selectedDate: selectedDate, omitTime: true)
//
//                CalendarViewRepresentable(selectedDate: $selectedDate)
//                    .padding(.horizontal, 21)
//                    .background {
//                        Color.appYellow
//                    }
//            }
//            .frame(width: screen.size.width, height: screen.size.height * 0.5, alignment: .center)
//        }
//    }
//}
//
//struct CalendarViewRepresentable: UIViewRepresentable {
//    typealias UIViewType = FSCalendar
//    fileprivate var calendar = FSCalendar()
//
//    @Binding var selectedDate: Date
//
//    func makeUIView(context: Context) -> FSCalendar {
//        // Setting delegate and dateSource of calendar to the
//        // values we get from Coordinator
//        calendar.delegate = context.coordinator
//        calendar.dataSource = context.coordinator
//        // returning the intialized calendar
//
//        //Customization
//        calendar.appearance.headerTitleFont = UIFont(name: AppFont.figtree.name, size: 20)
//        calendar.appearance.weekdayFont = UIFont(name: AppFont.figtree.name, size: 14)
//        calendar.appearance.titleFont = UIFont(name: AppFont.figtree.name, size: 16)
//        calendar.appearance.headerTitleColor = UIColor(Color.appBlack)
//        calendar.appearance.weekdayTextColor = UIColor(Color.appDarkGray)
//        calendar.appearance.headerMinimumDissolvedAlpha = 0.5
//        calendar.appearance.todayColor = UIColor(Color.appBlack)
//        calendar.appearance.selectionColor = UIColor(Color.appBlueButtonPressed)
//        calendar.appearance.eventSelectionColor = UIColor(Color.appRed)
//        calendar.appearance.titleTodayColor = UIColor(Color.white)
//        calendar.appearance.titleSelectionColor = UIColor(Color.appBlack)
//
//        return calendar
//    }
//
//    func updateUIView(_ uiView: FSCalendar, context: Context) {}
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//
//    class Coordinator: NSObject, FSCalendarDelegate, FSCalendarDataSource {
//        var parent: CalendarViewRepresentable
//
//        init(_ parent: CalendarViewRepresentable) {
//            self.parent = parent
//        }
//
//        func calendar(_ calendar: FSCalendar,
//                      didSelect date: Date,
//                      at monthPosition: FSCalendarMonthPosition) {
//            parent.selectedDate = date
//        }
//
//        //        func calendar(_ calendar: FSCalendar,
//        //                      imageFor date: Date) -> UIImage? {
//        //            if isWeekend(date: date) {
//        //                return UIImage(named: "calendar_day")
//        //            }
//        //            return nil
//        //        }
//
//        func calendar(_ calendar: FSCalendar,
//                      numberOfEventsFor date: Date) -> Int {
//            let eventDates = [Date(), Date(),
//                              Date.now.addingTimeInterval(400000),
//                              Date.now.addingTimeInterval(100000),
//                              Date.now.addingTimeInterval(-600000),
//                              Date.now.addingTimeInterval(-1000000)]
//            var eventCount = 0
//            eventDates.forEach { eventDate in
//                if eventDate.formatted(date: .complete,
//                                       time: .omitted) == date.formatted(
//                                        date: .complete, time: .omitted){
//                    eventCount += 1;
//                }
//            }
//            return eventCount
//        }
//
//        //        func calendar(_ calendar: FSCalendar, shouldSelect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
//        //            if isWeekend(date: date) {
//        //                return false
//        //            }
//        //            return true
//        //        }
//
//        //        func calendar(_ calendar: FSCalendar, imageFor date: Date) -> UIImage? {
//        //            //            let imageDateFormatter = DateFormatter()
//        //            //            imageDateFormatter.dateFormat = "yyyyMMdd"
//        //            //            let dateStr = imageDateFormatter.string(from: date)
//        //            //            let img = UIImage(named: "calendar_day")
//        //            //            let newimg = resizeImage(image: img, width: 30, height: 30)
//        //            //            return datesWithCat.contains(dateStr) ? newimg : nil
//        //            return UIImage(named: "calendar_day")
//        //        }
//
//        func maximumDate(for calendar: FSCalendar) -> Date {
//            Date.now.addingTimeInterval(86400 * 90)
//        }
//
//        func minimumDate(for calendar: FSCalendar) -> Date {
//            Date.now.addingTimeInterval(-86400 * 90)
//        }
//    }
//}
//
//func isWeekend(date: Date) -> Bool {
//    let dateFormatter = DateFormatter()
//    dateFormatter.dateFormat = "EEEE"
//    let day: String = dateFormatter.string(from: date)
//    if day == "Saturday" || day == "Sunday" {
//        return true
//    }
//    return false
//}
//
//struct CalendarView_Previews: PreviewProvider {
//    static var previews: some View {
//        CalendarView()
//    }
//}
