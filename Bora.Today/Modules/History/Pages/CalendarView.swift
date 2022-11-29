import SwiftUI
import UIKit
import FSCalendar

class CalendarData: ObservableObject{
    
    @Published var selectedDate : Date = Date()
    @Published var titleOfMonth : Date = Date()
    @Published var crntPage: Date = Date()
    @Published var dateSelectedModel: [ExperienceModel] = []
    
}

struct CalendarView: View {
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    @ObservedObject private var calendarData = CalendarData()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var model: [ExperienceModel] = [ExperienceModel.example1, ExperienceModel.example2, ExperienceModel.example3, ExperienceModel.example1, ExperienceModel.example2, ExperienceModel.example3]
    
    var strDateSelected: String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd 'de' MMMM, yyyy"
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
                
                ZStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        CustomCalendar(dateSelected: $calendarData.selectedDate, mnthNm: $calendarData.titleOfMonth, pageCurrent: $calendarData.crntPage, model: model, dateSelectedModel: $calendarData.dateSelectedModel)
                            .padding()
                            .background(
                                Color.appYellow
                            )
                            .frame(height: 350)
                        
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
                    }
                }
                
                
                
                HStack(spacing: 0) {
                    if let dateText = DateHelper.getDateString(calendarData.selectedDate) {
                        Text(dateText + " | ")
                            .font(.appHeadline)
                    }
                    
                    Text(strDateSelected)
                        .font(.appBody)
                }
                .padding(.horizontal, 21)
                .padding(.top, 32)
                .padding(.bottom, 24)
                
                if $calendarData.dateSelectedModel.count > 0 {
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 50) {
                            
                            ForEach(0..<$calendarData.dateSelectedModel.count, id: \.self) { index in
                                let item = calendarData.dateSelectedModel[index]
                                NavigationLink(destination: ExperienceView(model: item)) {
                                    CalendarEventView(model: item)
                                        .padding(.top, index == 0 ? 0 : 16)
                                        .padding(.bottom, index == calendarData.dateSelectedModel.count - 1 ? 20 : 0)
                                }
                            }
                        }
                    }
                    
                } else {
                    ScrollView(showsIndicators: false) {
                        EmptyStateView(text: "Você ainda não marcou nada pra hoje", buttonText: "Explorar experiências")
                            .frame(width: screen.size.width, alignment: .center)
                    }
                    .padding(.top, 12)
                    .padding(.bottom, 12)
                }
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
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
    
    var model: [ExperienceModel]
    @Binding var dateSelectedModel: [ExperienceModel]
    
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
        
        calendar.scrollEnabled = false
        
        return calendar
    }
    
    func updateUIView(_ uiView: FSCalendar, context: Context) {
        
        uiView.setCurrentPage(pageCurrent, animated: true) // --->> update calendar view when click on left or right button
    }
    
    func makeCoordinator() -> CustomCalendar.Coordinator {
        Coordinator(self, model: model)
    }
    
    class Coordinator: NSObject, FSCalendarDelegate, FSCalendarDataSource {
        
        var parent: CustomCalendar
        var model: [ExperienceModel]
        
        init(_ parent: CustomCalendar, model: [ExperienceModel]) {
            
            self.parent = parent
            self.model = model
        }
        
        func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
            
            parent.dateSelected = date
            parent.dateSelectedModel = []
            
            for index in 0..<model.count {
                let item = model[index]
                let dateFormatted = DateHelper.getDate(item.event.initialDate)
                if (dateFormatted.formatted(date: .complete, time: .omitted) == date.formatted(date: .complete, time: .omitted)) {
                    parent.dateSelectedModel.append(item)
                }
            }
        }
        
        func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
            
            parent.pageCurrent = calendar.currentPage
            parent.mnthNm = calendar.currentPage
        }
        
        func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
            var eventDates: [Date] = []
            
            model.forEach { item in
                let dateFormatted = DateHelper.getDate(item.event.initialDate)
                eventDates.append(dateFormatted)
            }
            
            var eventCount = 0
            eventDates.forEach { eventDate in
                if eventDate.formatted(date: .complete, time: .omitted) == date.formatted(date: .complete, time: .omitted){
                    eventCount += 1;
                }
            }
            return eventCount
        }
    }
}
