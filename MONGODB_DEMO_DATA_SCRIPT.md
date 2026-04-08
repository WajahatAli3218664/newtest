# MongoDB Demo Data Creation Script
**Run this in MongoDB Atlas or MongoDB Compass to create demo data**

---

## 🔧 SETUP INSTRUCTIONS

1. Login to MongoDB Atlas: https://cloud.mongodb.com
2. Navigate to your cluster: Cluster0
3. Click "Browse Collections"
4. Select database: `icare`
5. Use the MongoDB shell or import these documents

---

## 👥 DEMO USERS

### Patients

```javascript
// Patient 1: Ali Hassan
db.users.insertOne({
  name: "Ali Hassan",
  email: "ali.hassan@example.com",
  password: "$2b$10$YourHashedPasswordHere", // Hash: Demo123456
  role: "Patient",
  phone: "+92 300 1234567",
  age: 35,
  gender: "Male",
  isEmailVerified: true,
  createdAt: new Date(),
  updatedAt: new Date()
});

// Patient 2: Zainab Ahmed
db.users.insertOne({
  name: "Zainab Ahmed",
  email: "zainab.ahmed@example.com",
  password: "$2b$10$YourHashedPasswordHere", // Hash: Demo123456
  role: "Patient",
  phone: "+92 301 2345678",
  age: 28,
  gender: "Female",
  isEmailVerified: true,
  createdAt: new Date(),
  updatedAt: new Date()
});

// Patient 3: Omar Khan
db.users.insertOne({
  name: "Omar Khan",
  email: "omar.khan@example.com",
  password: "$2b$10$YourHashedPasswordHere", // Hash: Demo123456
  role: "Patient",
  phone: "+92 302 3456789",
  age: 42,
  gender: "Male",
  isEmailVerified: true,
  createdAt: new Date(),
  updatedAt: new Date()
});
```

### Doctors

```javascript
// Doctor 1: Dr. Ahmed Khan (General Physician)
db.users.insertOne({
  name: "Dr. Ahmed Khan",
  email: "ahmed.khan@icare.com",
  password: "$2b$10$YourHashedPasswordHere", // Hash: Demo123456
  role: "Doctor",
  phone: "+92 321 1111111",
  isEmailVerified: true,
  isApproved: true,
  specialization: "General Physician",
  experience: "10 years",
  degrees: ["MBBS", "FCPS"],
  licenseNumber: "PMC-12345",
  clinicName: "Khan Medical Center",
  clinicAddress: "Main Boulevard, Gulberg, Lahore",
  availableDays: ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
  availableTime: { start: "09:00", end: "17:00" },
  consultationType: ["Video", "In-Person"],
  languages: ["English", "Urdu"],
  rating: 4.8,
  totalReviews: 156,
  consultationFee: 2000,
  createdAt: new Date(),
  updatedAt: new Date()
});

// Doctor 2: Dr. Sarah Ahmed (Cardiologist)
db.users.insertOne({
  name: "Dr. Sarah Ahmed",
  email: "sarah.ahmed@icare.com",
  password: "$2b$10$YourHashedPasswordHere", // Hash: Demo123456
  role: "Doctor",
  phone: "+92 321 2222222",
  isEmailVerified: true,
  isApproved: true,
  specialization: "Cardiology",
  experience: "15 years",
  degrees: ["MBBS", "FCPS Cardiology", "MRCP"],
  licenseNumber: "PMC-23456",
  clinicName: "Heart Care Clinic",
  clinicAddress: "DHA Phase 5, Karachi",
  availableDays: ["Monday", "Wednesday", "Friday"],
  availableTime: { start: "10:00", end: "16:00" },
  consultationType: ["Video"],
  languages: ["English"],
  rating: 4.9,
  totalReviews: 203,
  consultationFee: 3500,
  createdAt: new Date(),
  updatedAt: new Date()
});

// Doctor 3: Dr. Fatima Ali (Dermatologist)
db.users.insertOne({
  name: "Dr. Fatima Ali",
  email: "fatima.ali@icare.com",
  password: "$2b$10$YourHashedPasswordHere", // Hash: Demo123456
  role: "Doctor",
  phone: "+92 321 3333333",
  isEmailVerified: true,
  isApproved: true,
  specialization: "Dermatology",
  experience: "8 years",
  degrees: ["MBBS", "FCPS Dermatology"],
  licenseNumber: "PMC-34567",
  clinicName: "Skin Care Center",
  clinicAddress: "F-7 Markaz, Islamabad",
  availableDays: ["Tuesday", "Thursday", "Saturday"],
  availableTime: { start: "11:00", end: "18:00" },
  consultationType: ["Video", "In-Person"],
  languages: ["English", "Urdu"],
  rating: 4.7,
  totalReviews: 98,
  consultationFee: 2500,
  createdAt: new Date(),
  updatedAt: new Date()
});

// Doctor 4: Dr. Hassan Raza (Pediatrician)
db.users.insertOne({
  name: "Dr. Hassan Raza",
  email: "hassan.raza@icare.com",
  password: "$2b$10$YourHashedPasswordHere", // Hash: Demo123456
  role: "Doctor",
  phone: "+92 321 4444444",
  isEmailVerified: true,
  isApproved: true,
  specialization: "Pediatrics",
  experience: "12 years",
  degrees: ["MBBS", "FCPS Pediatrics"],
  licenseNumber: "PMC-45678",
  clinicName: "Children's Health Clinic",
  clinicAddress: "Johar Town, Lahore",
  availableDays: ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
  availableTime: { start: "08:00", end: "14:00" },
  consultationType: ["Video", "In-Person"],
  languages: ["English", "Urdu", "Punjabi"],
  rating: 4.9,
  totalReviews: 287,
  consultationFee: 2200,
  createdAt: new Date(),
  updatedAt: new Date()
});

// Doctor 5: Dr. Ayesha Malik (Psychiatrist)
db.users.insertOne({
  name: "Dr. Ayesha Malik",
  email: "ayesha.malik@icare.com",
  password: "$2b$10$YourHashedPasswordHere", // Hash: Demo123456
  role: "Doctor",
  phone: "+92 321 5555555",
  isEmailVerified: true,
  isApproved: true,
  specialization: "Psychiatry",
  experience: "7 years",
  degrees: ["MBBS", "FCPS Psychiatry"],
  licenseNumber: "PMC-56789",
  clinicName: "Mind Wellness Center",
  clinicAddress: "Clifton, Karachi",
  availableDays: ["Monday", "Wednesday", "Friday", "Saturday"],
  availableTime: { start: "14:00", end: "20:00" },
  consultationType: ["Video"],
  languages: ["English", "Urdu"],
  rating: 4.8,
  totalReviews: 142,
  consultationFee: 3000,
  createdAt: new Date(),
  updatedAt: new Date()
});
```

### Laboratories

```javascript
// Lab 1: City Diagnostic Lab
db.users.insertOne({
  name: "City Diagnostic Lab",
  email: "city.lab@icare.com",
  password: "$2b$10$YourHashedPasswordHere", // Hash: Demo123456
  role: "Laboratory",
  phone: "+92 21 1234567",
  isEmailVerified: true,
  labName: "City Diagnostic Lab",
  city: "Karachi",
  address: "Main Boulevard, Gulshan-e-Iqbal, Karachi",
  licenseNumber: "LAB-001-KHI",
  services: ["Blood Tests", "Urine Tests", "X-Ray", "Ultrasound", "ECG"],
  operatingHours: "24/7",
  createdAt: new Date(),
  updatedAt: new Date()
});

// Lab 2: HealthCare Diagnostics
db.users.insertOne({
  name: "HealthCare Diagnostics",
  email: "healthcare.lab@icare.com",
  password: "$2b$10$YourHashedPasswordHere", // Hash: Demo123456
  role: "Laboratory",
  phone: "+92 42 7654321",
  isEmailVerified: true,
  labName: "HealthCare Diagnostics",
  city: "Lahore",
  address: "MM Alam Road, Gulberg, Lahore",
  licenseNumber: "LAB-002-LHR",
  services: ["Blood Tests", "Urine Tests", "MRI", "CT Scan", "Pathology"],
  operatingHours: "8 AM - 10 PM",
  createdAt: new Date(),
  updatedAt: new Date()
});
```

### Pharmacies

```javascript
// Pharmacy 1: MediCare Pharmacy
db.users.insertOne({
  name: "MediCare Pharmacy",
  email: "medicare.pharmacy@icare.com",
  password: "$2b$10$YourHashedPasswordHere", // Hash: Demo123456
  role: "Pharmacy",
  phone: "+92 21 9876543",
  isEmailVerified: true,
  pharmacyName: "MediCare Pharmacy",
  city: "Karachi",
  address: "Shahrah-e-Faisal, Karachi",
  licenseNumber: "PHR-001-KHI",
  services: ["Prescription Medicines", "OTC Medicines", "Medical Supplies", "Home Delivery"],
  operatingHours: "24/7",
  createdAt: new Date(),
  updatedAt: new Date()
});

// Pharmacy 2: LifeCare Pharmacy
db.users.insertOne({
  name: "LifeCare Pharmacy",
  email: "lifecare.pharmacy@icare.com",
  password: "$2b$10$YourHashedPasswordHere", // Hash: Demo123456
  role: "Pharmacy",
  phone: "+92 51 1122334",
  isEmailVerified: true,
  pharmacyName: "LifeCare Pharmacy",
  city: "Islamabad",
  address: "Blue Area, F-6, Islamabad",
  licenseNumber: "PHR-002-ISB",
  services: ["Prescription Medicines", "OTC Medicines", "Health Products", "Consultation"],
  operatingHours: "8 AM - 11 PM",
  createdAt: new Date(),
  updatedAt: new Date()
});
```

### Admin

```javascript
// Admin Account
db.users.insertOne({
  name: "System Admin",
  email: "admin@icare.com",
  password: "$2b$10$YourHashedPasswordHere", // Hash: Admin123456
  role: "Admin",
  phone: "+92 300 0000000",
  isEmailVerified: true,
  createdAt: new Date(),
  updatedAt: new Date()
});
```

---

## 📅 SAMPLE APPOINTMENTS

```javascript
// Get user IDs first (you'll need to replace these with actual IDs from your database)
const aliId = db.users.findOne({email: "ali.hassan@example.com"})._id;
const zainabId = db.users.findOne({email: "zainab.ahmed@example.com"})._id;
const omarId = db.users.findOne({email: "omar.khan@example.com"})._id;
const ahmedKhanId = db.users.findOne({email: "ahmed.khan@icare.com"})._id;
const sarahAhmedId = db.users.findOne({email: "sarah.ahmed@icare.com"})._id;
const fatimaAliId = db.users.findOne({email: "fatima.ali@icare.com"})._id;

// Appointment 1: Pending (for demo of acceptance flow)
db.appointments.insertOne({
  patientId: aliId,
  doctorId: ahmedKhanId,
  patientName: "Ali Hassan",
  doctorName: "Dr. Ahmed Khan",
  date: new Date("2026-04-10T10:00:00"),
  timeSlot: "10:00 AM",
  reason: "Routine checkup and flu symptoms",
  status: "pending",
  consultationFee: 2000,
  createdAt: new Date(),
  updatedAt: new Date()
});

// Appointment 2: Accepted (for demo of consultation)
db.appointments.insertOne({
  patientId: zainabId,
  doctorId: sarahAhmedId,
  patientName: "Zainab Ahmed",
  doctorName: "Dr. Sarah Ahmed",
  date: new Date("2026-04-10T11:00:00"),
  timeSlot: "11:00 AM",
  reason: "Chest pain and breathing difficulty",
  status: "accepted",
  consultationFee: 3500,
  createdAt: new Date(),
  updatedAt: new Date()
});

// Appointment 3: Completed (for demo of history)
db.appointments.insertOne({
  patientId: omarId,
  doctorId: fatimaAliId,
  patientName: "Omar Khan",
  doctorName: "Dr. Fatima Ali",
  date: new Date("2026-04-05T14:00:00"),
  timeSlot: "02:00 PM",
  reason: "Skin rash and itching",
  status: "completed",
  consultationFee: 2500,
  completedAt: new Date("2026-04-05T14:30:00"),
  createdAt: new Date("2026-04-05"),
  updatedAt: new Date("2026-04-05")
});
```

---

## 💊 SAMPLE PRESCRIPTIONS

```javascript
// Get appointment ID for completed appointment
const completedAppointmentId = db.appointments.findOne({
  patientName: "Omar Khan",
  status: "completed"
})._id;

// Prescription for Omar Khan
db.prescriptions.insertOne({
  patientId: omarId,
  doctorId: fatimaAliId,
  appointmentId: completedAppointmentId,
  patientName: "Omar Khan",
  doctorName: "Dr. Fatima Ali",
  date: new Date("2026-04-05"),
  diagnosis: "Allergic dermatitis",
  medicines: [
    {
      name: "Cetirizine 10mg",
      dosage: "1 tablet",
      frequency: "Once daily",
      duration: "7 days",
      instructions: "Take at bedtime"
    },
    {
      name: "Hydrocortisone Cream 1%",
      dosage: "Apply thin layer",
      frequency: "Twice daily",
      duration: "14 days",
      instructions: "Apply on affected areas after washing"
    }
  ],
  notes: "Avoid known allergens. Keep skin moisturized. Follow up in 2 weeks if symptoms persist.",
  createdAt: new Date("2026-04-05"),
  updatedAt: new Date("2026-04-05")
});
```

---

## 🔐 PASSWORD HASHING

**IMPORTANT:** The passwords above need to be hashed using bcrypt before insertion.

### Option 1: Hash via Node.js Script

```javascript
const bcrypt = require('bcrypt');

async function hashPassword(password) {
  const salt = await bcrypt.genSalt(10);
  const hash = await bcrypt.hash(password, salt);
  console.log(hash);
}

hashPassword('Demo123456');  // For demo accounts
hashPassword('Admin123456'); // For admin account
```

### Option 2: Use Backend API

If your backend has a registration endpoint, use it to create accounts with proper password hashing.

---

## ✅ VERIFICATION STEPS

After inserting data, verify:

```javascript
// Check users count
db.users.countDocuments()
// Expected: 13 (3 patients + 5 doctors + 2 labs + 2 pharmacies + 1 admin)

// Check doctors
db.users.find({role: "Doctor"}).count()
// Expected: 5

// Check appointments
db.appointments.countDocuments()
// Expected: 3

// Check prescriptions
db.prescriptions.countDocuments()
// Expected: 1

// Verify specific user
db.users.findOne({email: "ahmed.khan@icare.com"})
// Should return doctor details
```

---

## 🚀 QUICK SETUP (Alternative Method)

If you have backend access, create accounts via API:

```bash
# Register patients
curl -X POST https://icare-backend-comprehensive.vercel.app/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{"name":"Ali Hassan","email":"ali.hassan@example.com","password":"Demo123456","role":"Patient","phone":"+92 300 1234567"}'

# Register doctors (repeat for each doctor)
curl -X POST https://icare-backend-comprehensive.vercel.app/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{"name":"Dr. Ahmed Khan","email":"ahmed.khan@icare.com","password":"Demo123456","role":"Doctor"}'

# Then complete doctor profile via admin panel or API
```

---

## 📝 NOTES

1. **Password Hashing:** Make sure to hash passwords before inserting
2. **User IDs:** Replace placeholder IDs with actual MongoDB ObjectIds
3. **Dates:** Adjust dates to be relevant to demo day
4. **Verification:** Test login for each account after creation
5. **Backup:** Export data after creation for easy restoration

---

**After running this script, all demo accounts will be ready for Friday's presentation!**
