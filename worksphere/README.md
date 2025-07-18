# WorkSphere - Flutter HR Assistant Application

A comprehensive, enterprise-ready HR assistant application built with Flutter, inspired by Zoho People's functionality and design.

## 🎯 Features

### ✅ Completed Features

#### **Authentication & User Management**
- **Login Modal** with real-time email validation
- **Password strength indicator** (weak/medium/strong)
- **Form validation** with error messages
- **Demo credentials** for testing
- **Responsive design** for mobile, tablet, and desktop

#### **Dashboard & Navigation**
- **Left sidebar navigation** with 9 sections:
  - Profile
  - Attendance
  - Leave Management
  - Teams
  - HR Analytics
  - User Analytics
  - Documents
  - Kudos
  - Surveys
- **Responsive layout** that adapts to screen size
- **Mobile-friendly drawer** navigation

#### **Analytics & Charts**
- **HR Analytics Dashboard** with interactive charts:
  - Weekly attendance trends (Line chart)
  - Employee engagement scores (Bar chart)
  - Department distribution (Pie chart)
- **User Analytics Dashboard** with:
  - Engagement metrics
  - Performance tracking
  - Satisfaction rates

#### **Core HR Modules**
- **Profile Management** - Complete employee profile view
- **Attendance Tracking** - Daily attendance with stats and tables
- **Leave Management** - Leave requests and approval workflow
- **Team Management** - Department overview and member counts
- **Document Management** - File upload and download interface
- **Kudos System** - Employee recognition and appreciation
- **Survey System** - Employee feedback and satisfaction surveys

#### **UI/UX Features**
- **Zoho People-inspired design** - Professional, clean interface
- **Fully responsive** - Works on mobile, tablet, and desktop
- **Modern Material Design** with consistent styling
- **Smooth animations** and transitions
- **Loading states** and error handling

## 🏗️ Architecture

### **Project Structure**
```
worksphere/
├── lib/
│   ├── main.dart                 # App entry point
│   ├── screens/                  # Screen widgets
│   │   ├── home.dart            # Landing page
│   │   ├── dashboard.dart       # Main dashboard
│   │   └── login_screen.dart    # Login screen
│   ├── widgets/                 # Reusable components
│   │   ├── login_modal.dart     # Login popup
│   │   ├── sidebar.dart         # Navigation sidebar
│   │   ├── top_navbar.dart      # Top navigation
│   │   ├── analytics_charts.dart # Charts and graphs
│   │   └── password_strength_indicator.dart
│   ├── services/                # Business logic
│   │   └── auth_service.dart    # Authentication
│   ├── models/                  # Data models
│   │   └── user.dart            # User model
│   ├── providers/               # State management
│   │   ├── auth_provider.dart   # Auth state
│   │   ├── data_provider.dart   # Data state
│   │   └── theme_provider.dart  # Theme state
│   └── utils/                   # Utilities
│       ├── constants.dart       # App constants
│       ├── validators.dart      # Form validators
│       └── router.dart          # Navigation
├── assets/
│   ├── data/                    # Mock data
│   │   ├── employees.json
│   │   ├── attendance.json
│   │   └── leaves.json
│   └── images/                  # App images
└── pubspec.yaml                 # Dependencies
```

### **Dependencies**
- **flutter**: SDK
- **provider**: ^6.1.1 - State management
- **go_router**: ^13.2.0 - Navigation
- **fl_chart**: ^0.66.0 - Charts and analytics
- **shared_preferences**: ^2.2.2 - Local storage
- **http**: ^1.2.0 - API requests

## 🚀 Getting Started

### **Prerequisites**
- Flutter SDK (>=3.19.0)
- Dart SDK (>=3.0.0)

### **Installation**

1. **Clone the repository**
```bash
git clone [repository-url]
cd worksphere
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Run the application**
```bash
flutter run
```

### **Demo Credentials**
Use these credentials to test the login functionality:
- **Admin**: admin@worksphere.com / admin123
- **Manager**: manager@worksphere.com / manager123
- **Employee**: employee@worksphere.com / employee123

## 📱 Responsive Design

### **Mobile (< 600px)**
- Drawer navigation
- Stacked layout
- Touch-optimized interactions

### **Tablet (600px - 1200px)**
- Sidebar navigation
- Grid layouts
- Optimized spacing

### **Desktop (> 1200px)**
- Full sidebar
- Multi-column layouts
- Hover effects

## 🎨 Design System

### **Colors**
- **Primary**: #1976D2 (Blue)
- **Secondary**: #424242 (Dark Grey)
- **Background**: #F5F5F5 (Light Grey)
- **Surface**: #FFFFFF (White)
- **Error**: #D32F2F (Red)

### **Typography**
- **Headlines**: Bold, clean fonts
- **Body**: Readable, accessible text
- **Captions**: Subtle, supporting text

## 🔧 Development

### **Adding New Features**
1. Create new screen in `lib/screens/`
2. Add navigation route in `lib/utils/router.dart`
3. Update sidebar in `lib/widgets/sidebar.dart`
4. Add mock data in `assets/data/`

### **API Integration Ready**
The app is designed for easy API integration:
- Service layer (`lib/services/`) ready for REST API calls
- Model classes support JSON serialization
- Error handling and loading states implemented

## 🎯 Next Steps

### **Phase 2 Features**
- [ ] Real API integration
- [ ] Push notifications
- [ ] Offline mode
- [ ] Advanced analytics
- [ ] Performance reviews
- [ ] Payroll integration
- [ ] Chatbot assistant
- [ ] E-signatures

### **Performance Optimizations**
- [ ] Image caching
- [ ] Lazy loading
- [ ] State persistence
- [ ] Background sync

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🙋‍♂️ Support

For support, email support@worksphere.com or create an issue in the repository.
