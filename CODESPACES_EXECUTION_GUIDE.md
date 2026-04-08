# GitHub Codespaces - Complete Execution Guide
**Execute all remaining tasks in GitHub Codespaces**

---

## 🚀 SETUP GITHUB CODESPACES

### Step 1: Open Codespaces
```bash
# Go to your GitHub repository
# Click: Code → Codespaces → Create codespace on main

# Or use GitHub CLI:
gh codespace create
```

### Step 2: Install Flutter in Codespaces
```bash
# Install Flutter
git clone https://github.com/flutter/flutter.git -b stable
export PATH="$PATH:`pwd`/flutter/bin"

# Verify installation
flutter doctor

# Accept licenses
flutter doctor --android-licenses
```

### Step 3: Setup Project
```bash
# Navigate to project
cd /workspaces/icare-main-master

# Get dependencies
flutter pub get

# Check for issues
flutter analyze
```

---

## ✅ TASK 1: TEST PATIENT JOURNEY (30 minutes)

### Run Web Version for Testing
```bash
# Start Flutter web server
flutter run -d web-server --web-port=8080

# Codespaces will provide a URL like:
# https://username-repo-8080.preview.app.github.dev
```

### Test Steps
1. Open the provided URL in browser
2. Click "Sign Up"
3. Fill form:
   - Name: Test Patient
   - Email: test.patient@example.com
   - Password: Test123456
   - Role: Patient
4. Check "Terms & Conditions"
5. Click "Create Account"
6. **Verify:** Redirects to dashboard
7. Navigate to "Find Doctors"
8. **Verify:** Doctors list loads
9. Select a doctor
10. Click "Book Appointment"
11. Select date and time
12. Click "Book"
13. **Verify:** Success message appears

### Document Results
```bash
# Create test results file
cat > test_results.txt << 'EOF'
PATIENT JOURNEY TEST RESULTS
============================
Date: $(date)

1. Signup: [PASS/FAIL]
2. Login: [PASS/FAIL]
3. Browse Doctors: [PASS/FAIL]
4. Book Appointment: [PASS/FAIL]

Issues Found:
- 

Notes:
- 
EOF
```

---

## ✅ TASK 2: TEST DOCTOR JOURNEY (30 minutes)

### Test Steps
1. Logout from patient account
2. Click "Sign Up"
3. Fill form:
   - Name: Test Doctor
   - Email: test.doctor@example.com
   - Password: Test123456
   - Role: Doctor
4. Complete doctor profile
5. **Verify:** Dashboard loads
6. Navigate to "Appointments"
7. **Verify:** Can view appointments
8. Click "Accept" on pending appointment
9. **Verify:** Status changes to "Accepted"
10. Navigate to "Create Prescription"
11. Fill prescription form
12. Click "Create"
13. **Verify:** Success message

---

## ✅ TASK 3: CREATE DEMO DATA IN MONGODB (1 hour)

### Connect to MongoDB Atlas
```bash
# Install MongoDB tools
npm install -g mongodb

# Or use mongosh
curl -O https://downloads.mongodb.com/compass/mongosh-1.10.6-linux-x64.tgz
tar -xvf mongosh-1.10.6-linux-x64.tgz
export PATH="$PATH:$(pwd)/mongosh-1.10.6-linux-x64/bin"
```

### Create Demo Users Script
```bash
# Create Node.js script to populate data
cat > create_demo_data.js << 'EOF'
const { MongoClient } = require('mongodb');
const bcrypt = require('bcrypt');

const uri = "mongodb+srv://icare_admin:YOUR_PASSWORD@cluster0.hbies44.mongodb.net/icare";
const client = new MongoClient(uri);

async function createDemoData() {
  try {
    await client.connect();
    const db = client.db('icare');
    const users = db.collection('users');
    
    // Hash password
    const hashedPassword = await bcrypt.hash('Demo123456', 10);
    const hashedAdminPassword = await bcrypt.hash('Admin123456', 10);
    
    // Create patients
    await users.insertMany([
      {
        name: "Ali Hassan",
        email: "ali.hassan@example.com",
        password: hashedPassword,
        role: "Patient",
        phone: "+92 300 1234567",
        age: 35,
        gender: "Male",
        isEmailVerified: true,
        createdAt: new Date(),
        updatedAt: new Date()
      },
      {
        name: "Zainab Ahmed",
        email: "zainab.ahmed@example.com",
        password: hashedPassword,
        role: "Patient",
        phone: "+92 301 2345678",
        age: 28,
        gender: "Female",
        isEmailVerified: true,
        createdAt: new Date(),
        updatedAt: new Date()
      },
      {
        name: "Omar Khan",
        email: "omar.khan@example.com",
        password: hashedPassword,
        role: "Patient",
        phone: "+92 302 3456789",
        age: 42,
        gender: "Male",
        isEmailVerified: true,
        createdAt: new Date(),
        updatedAt: new Date()
      }
    ]);
    
    // Create doctors
    await users.insertMany([
      {
        name: "Dr. Ahmed Khan",
        email: "ahmed.khan@icare.com",
        password: hashedPassword,
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
      },
      {
        name: "Dr. Sarah Ahmed",
        email: "sarah.ahmed@icare.com",
        password: hashedPassword,
        role: "Doctor",
        phone: "+92 321 2222222",
        isEmailVerified: true,
        isApproved: true,
        specialization: "Cardiology",
        experience: "15 years",
        degrees: ["MBBS", "FCPS Cardiology"],
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
      }
    ]);
    
    // Create labs
    await users.insertMany([
      {
        name: "City Diagnostic Lab",
        email: "city.lab@icare.com",
        password: hashedPassword,
        role: "Laboratory",
        phone: "+92 21 1234567",
        isEmailVerified: true,
        labName: "City Diagnostic Lab",
        city: "Karachi",
        address: "Main Boulevard, Gulshan-e-Iqbal, Karachi",
        licenseNumber: "LAB-001-KHI",
        createdAt: new Date(),
        updatedAt: new Date()
      }
    ]);
    
    // Create pharmacies
    await users.insertMany([
      {
        name: "MediCare Pharmacy",
        email: "medicare.pharmacy@icare.com",
        password: hashedPassword,
        role: "Pharmacy",
        phone: "+92 21 9876543",
        isEmailVerified: true,
        pharmacyName: "MediCare Pharmacy",
        city: "Karachi",
        address: "Shahrah-e-Faisal, Karachi",
        licenseNumber: "PHR-001-KHI",
        createdAt: new Date(),
        updatedAt: new Date()
      }
    ]);
    
    // Create admin
    await users.insertOne({
      name: "System Admin",
      email: "admin@icare.com",
      password: hashedAdminPassword,
      role: "Admin",
      phone: "+92 300 0000000",
      isEmailVerified: true,
      createdAt: new Date(),
      updatedAt: new Date()
    });
    
    console.log("✅ Demo data created successfully!");
    
  } catch (error) {
    console.error("❌ Error:", error);
  } finally {
    await client.close();
  }
}

createDemoData();
EOF

# Install dependencies
npm install mongodb bcrypt

# Run script (replace YOUR_PASSWORD with actual password)
node create_demo_data.js
```

---

## ✅ TASK 4: BUILD ANDROID APK (1 hour)

### Build APK
```bash
# Clean previous builds
flutter clean

# Get dependencies
flutter pub get

# Build release APK
flutter build apk --release

# APK location:
# build/app/outputs/flutter-apk/app-release.apk

# Check APK size
ls -lh build/app/outputs/flutter-apk/app-release.apk

# Download APK from Codespaces
# Right-click on file → Download
```

---

## ✅ TASK 5: DEPLOY WEB VERSION (30 minutes)

### Build Web Version
```bash
# Build for web
flutter build web --release

# Web files location:
# build/web/
```

### Deploy to Vercel
```bash
# Install Vercel CLI
npm install -g vercel

# Login to Vercel
vercel login

# Deploy
cd build/web
vercel --prod

# Note the deployment URL
```

### Alternative: Deploy to Firebase
```bash
# Install Firebase CLI
npm install -g firebase-tools

# Login
firebase login

# Initialize
firebase init hosting

# Deploy
firebase deploy --only hosting
```

---

## ✅ TASK 6: TEST ALL ROLE DASHBOARDS (1 hour)

### Test Script
```bash
# Create automated test script
cat > test_all_roles.sh << 'EOF'
#!/bin/bash

echo "Testing All Role Dashboards"
echo "==========================="

# Start web server in background
flutter run -d web-server --web-port=8080 &
SERVER_PID=$!

# Wait for server to start
sleep 10

# Get the URL
URL=$(gh codespace ports -q | grep 8080 | awk '{print $4}')

echo "Server running at: $URL"
echo ""
echo "Manual Testing Required:"
echo "1. Open: $URL"
echo "2. Test Patient login: ali.hassan@example.com / Demo123456"
echo "3. Test Doctor login: ahmed.khan@icare.com / Demo123456"
echo "4. Test Lab login: city.lab@icare.com / Demo123456"
echo "5. Test Pharmacy login: medicare.pharmacy@icare.com / Demo123456"
echo "6. Test Admin login: admin@icare.com / Admin123456"
echo ""
echo "Press Ctrl+C when done"

# Wait for user to finish testing
wait $SERVER_PID
EOF

chmod +x test_all_roles.sh
./test_all_roles.sh
```

---

## ✅ TASK 7: FIX CRITICAL BUGS (As Needed)

### Common Issues and Fixes

**Issue 1: DioException Shown to Users**
```bash
# Find all DioException references
grep -r "DioException" lib/

# Replace with user-friendly messages
# Edit files and replace error handling
```

**Issue 2: Backend Not Responding**
```bash
# Test backend
curl https://icare-backend-comprehensive.vercel.app/

# If down, check Vercel dashboard
# Restart if needed
```

**Issue 3: Login Fails**
```bash
# Check auth service
cat lib/services/auth_service.dart

# Verify token storage
# Check SharedPreferences implementation
```

---

## ✅ TASK 8: CREATE BACKUP MATERIALS (30 minutes)

### Take Screenshots
```bash
# Install screenshot tool
sudo apt-get update
sudo apt-get install -y scrot

# Take screenshots (manual process)
# 1. Open app in browser
# 2. Navigate to each screen
# 3. Take screenshot (Print Screen)
# 4. Save to screenshots/ folder

mkdir -p screenshots
```

### Record Demo Video (Optional)
```bash
# Install recording tool
sudo apt-get install -y ffmpeg

# Record screen
ffmpeg -video_size 1920x1080 -framerate 30 -f x11grab -i :0.0 demo_recording.mp4

# Stop with Ctrl+C
```

---

## ✅ TASK 9: PRACTICE DEMO (1 hour)

### Demo Rehearsal Checklist
```bash
cat > demo_rehearsal_checklist.txt << 'EOF'
DEMO REHEARSAL CHECKLIST
========================

Setup (5 min):
[ ] Backend health check passed
[ ] Web app loaded
[ ] All tabs open with correct accounts
[ ] Timer ready

Demo Flow (15 min):
[ ] Opening (2 min) - Completed in time
[ ] Patient Journey (5 min) - Completed in time
[ ] Doctor Journey (4 min) - Completed in time
[ ] Partner Ecosystem (3 min) - Completed in time
[ ] Q&A (3 min) - Prepared answers

Issues Found:
- 

Improvements Needed:
- 

Total Time: ___ minutes
EOF
```

---

## ✅ TASK 10: FINAL VERIFICATION (30 minutes)

### Pre-Demo Checklist
```bash
cat > final_verification.sh << 'EOF'
#!/bin/bash

echo "FINAL VERIFICATION CHECKLIST"
echo "============================"
echo ""

# Check backend
echo "1. Checking backend..."
curl -s https://icare-backend-comprehensive.vercel.app/ | grep -q "success" && echo "✅ Backend OK" || echo "❌ Backend DOWN"

# Check MongoDB
echo "2. Checking database..."
# Add MongoDB check here

# Check demo accounts
echo "3. Demo accounts to verify:"
echo "   - ali.hassan@example.com / Demo123456"
echo "   - ahmed.khan@icare.com / Demo123456"
echo "   - city.lab@icare.com / Demo123456"
echo "   - medicare.pharmacy@icare.com / Demo123456"
echo "   - admin@icare.com / Admin123456"

# Check APK
echo "4. Checking APK..."
[ -f "build/app/outputs/flutter-apk/app-release.apk" ] && echo "✅ APK exists" || echo "❌ APK missing"

# Check web build
echo "5. Checking web build..."
[ -d "build/web" ] && echo "✅ Web build exists" || echo "❌ Web build missing"

echo ""
echo "Manual checks required:"
echo "[ ] All demo accounts login successfully"
echo "[ ] Patient journey works end-to-end"
echo "[ ] Doctor journey works end-to-end"
echo "[ ] Video call works"
echo "[ ] Chat works"
echo "[ ] All dashboards load"
echo ""
echo "Ready for demo? [Y/N]"
EOF

chmod +x final_verification.sh
./final_verification.sh
```

---

## 📋 COMPLETE EXECUTION SEQUENCE

### Run Everything in Order
```bash
# 1. Setup (30 min)
flutter pub get
flutter doctor

# 2. Test Patient Journey (30 min)
flutter run -d web-server --web-port=8080
# Test manually in browser

# 3. Test Doctor Journey (30 min)
# Continue testing in browser

# 4. Create Demo Data (1 hour)
node create_demo_data.js

# 5. Build APK (1 hour)
flutter build apk --release

# 6. Deploy Web (30 min)
flutter build web --release
cd build/web && vercel --prod

# 7. Test All Roles (1 hour)
./test_all_roles.sh

# 8. Practice Demo (1 hour)
# Follow FRIDAY_DEMO_SCRIPT.md

# 9. Final Verification (30 min)
./final_verification.sh

# Total Time: ~6-7 hours
```

---

## 🚨 TROUBLESHOOTING IN CODESPACES

### Flutter Not Working
```bash
# Reinstall Flutter
rm -rf flutter
git clone https://github.com/flutter/flutter.git -b stable
export PATH="$PATH:`pwd`/flutter/bin"
flutter doctor
```

### Port Not Accessible
```bash
# Check ports
gh codespace ports

# Forward port manually
gh codespace ports forward 8080:8080
```

### Out of Memory
```bash
# Check memory
free -h

# Increase swap
sudo fallocate -l 4G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
```

---

## ✅ SUCCESS CRITERIA

After completing all tasks, you should have:
- [ ] All tests passed
- [ ] Demo data in MongoDB
- [ ] APK built and downloaded
- [ ] Web version deployed
- [ ] All role dashboards tested
- [ ] Demo practiced and timed
- [ ] Backup materials ready
- [ ] Final verification passed

---

## 📞 QUICK COMMANDS REFERENCE

```bash
# Start web server
flutter run -d web-server --web-port=8080

# Build APK
flutter build apk --release

# Build web
flutter build web --release

# Deploy to Vercel
vercel --prod

# Check backend
curl https://icare-backend-comprehensive.vercel.app/

# Run tests
flutter test

# Check for errors
flutter analyze
```

---

**Copy this entire guide into your Codespaces terminal and execute step by step. Good luck! 🚀**
