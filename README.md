# NyumbaHub Tanzania 🏠

**Property Rental & Services Platform for Tanzania**

A modern Flutter + Firebase application connecting Tenants, Landlords, and Service Providers in Tanzania.

## Features ✨

### User Roles
- **Tenant (Mpangaji)** - Search properties, book viewings, request services
- **Landlord (Mwenye Nyumba)** - Manage rental properties, approve bookings
- **Service Provider (Fundi)** - Offer services, manage requests
- **Admin** - Verify users, manage listings, platform analytics

### Core Features
✅ User Authentication (Email/Phone)
✅ Property Listings with GPS Location
✅ Service Provider Directory
✅ Real-time Chat
✅ Booking System
✅ Verification System (Properties & Providers)
✅ Admin Dashboard
✅ Media Upload (Firebase Storage)
✅ Notifications
✅ Analytics

## Tech Stack 🛠️

- **Frontend**: Flutter 3.x
- **Backend**: Firebase
- **Database**: Firestore
- **Storage**: Firebase Storage
- **Authentication**: Firebase Auth
- **Real-time**: Firebase Realtime Database / Firestore Listeners
- **Functions**: Firebase Cloud Functions
- **Notifications**: Firebase Cloud Messaging (FCM)

## Project Structure 📁

```
nyumba-hub-tanzania/
├── lib/
│   ├── main.dart
│   ├── config/
│   │   ├── firebase_config.dart
│   │   └── app_constants.dart
│   ├── models/
│   │   ├── user_model.dart
│   │   ├── listing_model.dart
│   │   ├── service_model.dart
│   │   └── service_request_model.dart
│   ├── services/
│   │   ├── auth_service.dart
│   │   ├── firestore_service.dart
│   │   ├── storage_service.dart
│   │   └── notification_service.dart
│   ├── providers/
│   │   ├── auth_provider.dart
│   │   ├── listing_provider.dart
│   │   └── service_provider.dart
│   ├── screens/
│   │   ├── auth/
│   │   ├── tenant/
│   │   ├── landlord/
│   │   ├── provider/
│   │   └── admin/
│   ├── widgets/
│   └── utils/
├── assets/
├── pubspec.yaml
└── firebase.json
```

## Getting Started 🚀

### Prerequisites
- Flutter 3.x installed
- Firebase project created
- Android Studio / Xcode

### Installation

1. **Clone Repository**
```bash
git clone https://github.com/padrii/nyumba-hub-tanzania.git
cd nyumba-hub-tanzania
```

2. **Install Dependencies**
```bash
flutter pub get
```

3. **Configure Firebase**
```bash
flutterfire configure
```

4. **Run App**
```bash
flutter run
```

## Firebase Collections 🔥

### Users
```
users/ {
  id: string
  name: string
  phone: string
  email: string
  role: "tenant" | "landlord" | "provider" | "admin"
  profile_image: string
  location: string
  is_verified: boolean
  created_at: timestamp
}
```

### Listings
```
listings/ {
  id: string
  owner_id: string
  title: string
  price: number
  description: string
  location_name: string
  gps_lat: number
  gps_lng: number
  images: array
  video_url: string
  amenities: array
  is_verified: boolean
  verification_status: "pending" | "approved" | "rejected"
  created_at: timestamp
}
```

### Services
```
services/ {
  id: string
  provider_id: string
  category: string
  title: string
  description: string
  price_from: number
  price_to: number
  location: string
  images: array
  rating: number
  is_verified: boolean
  created_at: timestamp
}
```

## Development 💻

### Branch Strategy
- `main` - Production ready
- `develop` - Development branch
- `feature/*` - Feature branches

### Commit Convention
```
feat: new feature
fix: bug fix
docs: documentation
style: formatting
refactor: code refactoring
test: adding tests
chore: maintenance
```

## Contributing 🤝

1. Fork repository
2. Create feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open Pull Request

## License 📄

MIT License - See LICENSE file

## Contact 📞

- Developer: Padrii
- Email: support@nyumahub.tz
- Website: [Coming Soon]

---

**Made with ❤️ for Tanzania**
