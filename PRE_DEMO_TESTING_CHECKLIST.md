# iCare - Pre-Demo Testing Checklist
**Complete this checklist 24 hours before demo**

---

## ✅ BACKEND VERIFICATION

### Backend Health Check
- [ ] Open: https://icare-backend-comprehensive.vercel.app/
- [ ] Verify response: `{"success":true,"message":"iCare Backend API is running"}`
- [ ] Check timestamp is recent
- [ ] Response time < 2 seconds

### Database Connection
- [ ] Login to MongoDB Atlas: https://cloud.mongodb.com
- [ ] Verify cluster status: Active
- [ ] Check collections exist: users, doctors, appointments, prescriptions
- [ ] Verify demo data is loaded (5 doctors, 3 patients, etc.)

### API Endpoints Test
```bash
# Test doctors endpoint
curl https://icare-backend-comprehensive.vercel.app/api/doctors/get_all_doctors

# Expected: {"success":true,"doctors":[...]}

# Test auth endpoint
curl -X POST https://icare-backend-comprehensive.vercel.app/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"ahmed.khan@icare.com","password":"Demo123456"}'

# Expected: {"success":true,"token":"...","user":{...}}
```

**Results:**
- [ ] Doctors endpoint returns data
- [ ] Auth endpoint returns token
- [ ] No 500 errors
- [ ] No timeout errors

---

## ✅ FRONTEND VERIFICATION

### Web App Deployment
- [ ] Web app URL accessible
- [ ] Loads within 3 seconds
- [ ] No console errors (F12 → Console)
- [ ] Responsive on mobile view
- [ ] All images load correctly
- [ ] No broken links

### Android APK
- [ ] APK file exists: `build/app/outputs/flutter-apk/app-release.apk`
- [ ] APK size reasonable (< 50 MB)
- [ ] Installs on Android device without errors
- [ ] App opens without crashing
- [ ] All features accessible

### Windows Build (Optional)
- [ ] Windows executable exists
- [ ] Runs on Windows 10/11
- [ ] No missing DLL errors

---

## ✅ AUTHENTICATION TESTING

### Patient Signup
- [ ] Open web app
- [ ] Click "Sign Up"
- [ ] Fill form with test data
- [ ] Check "Terms & Conditions"
- [ ] Click "Create Account"
- [ ] **Expected:** Account created, auto-login to dashboard
- [ ] **Verify:** No DioException errors shown
- [ ] **Verify:** Token saved (check localStorage)

### Patient Login
- [ ] Logout from previous test
- [ ] Click "Login"
- [ ] Enter: ali.hassan@example.com / Demo123456
- [ ] Click "Sign In"
- [ ] **Expected:** Login successful, redirect to patient dashboard
- [ ] **Verify:** User name displayed correctly
- [ ] **Verify:** Dashboard loads with data

### Doctor Login
- [ ] Open incognito/different browser
- [ ] Login: ahmed.khan@icare.com / Demo123456
- [ ] **Expected:** Login successful, redirect to doctor dashboard
- [ ] **Verify:** Doctor-specific features visible
- [ ] **Verify:** Appointments section exists

### Lab Login
- [ ] Open incognito/different browser
- [ ] Login: city.lab@icare.com / Demo123456
- [ ] **Expected:** Login successful, redirect to lab dashboard
- [ ] **Verify:** Lab-specific features visible
- [ ] **Verify:** No patient features (appointments, cart)

### Pharmacy Login
- [ ] Open incognito/different browser
- [ ] Login: medicare.pharmacy@icare.com / Demo123456
- [ ] **Expected:** Login successful, redirect to pharmacy dashboard
- [ ] **Verify:** Pharmacy-specific features visible
- [ ] **Verify:** No patient features (appointments, cart)

### Admin Login
- [ ] Open incognito/different browser
- [ ] Login: admin@icare.com / Admin123456
- [ ] **Expected:** Login successful, redirect to admin dashboard
- [ ] **Verify:** Admin controls visible
- [ ] **Verify:** Partner onboarding section exists

---

## ✅ PATIENT JOURNEY TESTING

### Browse Doctors
- [ ] Login as patient: ali.hassan@example.com
- [ ] Navigate to "Find Doctors"
- [ ] **Expected:** List of 5 doctors displayed
- [ ] **Verify:** Each doctor shows: name, specialization, experience, rating, fee
- [ ] **Verify:** Profile pictures load (or placeholder)
- [ ] **Verify:** No errors in console

### Filter Doctors
- [ ] Click "Filters"
- [ ] Select specialization: "Cardiology"
- [ ] Apply filter
- [ ] **Expected:** Only Dr. Sarah Ahmed (Cardiologist) shown
- [ ] Clear filter
- [ ] **Expected:** All doctors shown again

### View Doctor Profile
- [ ] Click on "Dr. Ahmed Khan"
- [ ] **Expected:** Profile page opens
- [ ] **Verify:** Shows: specialization, experience, degrees, availability, fee
- [ ] **Verify:** "Book Appointment" button visible
- [ ] **Verify:** Reviews section exists

### Book Appointment
- [ ] Click "Book Appointment"
- [ ] **Expected:** Booking form opens
- [ ] Select date: Tomorrow
- [ ] **Verify:** Only available days are selectable
- [ ] Select time slot: 10:00 AM
- [ ] Enter reason: "Routine checkup"
- [ ] Click "Book Appointment"
- [ ] **Expected:** Success message shown
- [ ] **Expected:** Redirect to appointments page
- [ ] **Verify:** New appointment appears in list with status "Pending"

### View Appointments
- [ ] Navigate to "My Appointments"
- [ ] **Expected:** List of appointments shown
- [ ] **Verify:** Shows: doctor name, date, time, status
- [ ] **Verify:** Can filter by status (Pending, Accepted, Completed)
- [ ] **Verify:** No errors loading appointments

### View Prescriptions
- [ ] Navigate to "Prescriptions"
- [ ] **Expected:** List of prescriptions (if any exist)
- [ ] **Verify:** Shows: doctor name, date, medicines
- [ ] **Verify:** Can view prescription details
- [ ] **Verify:** Can download/print (if implemented)

---

## ✅ DOCTOR JOURNEY TESTING

### View Appointments
- [ ] Login as doctor: ahmed.khan@icare.com
- [ ] Navigate to "Appointments"
- [ ] **Expected:** List of appointments shown
- [ ] **Verify:** Shows pending appointments at top
- [ ] **Verify:** Shows patient name, date, time, reason
- [ ] **Verify:** "Accept" and "Reject" buttons visible for pending

### Accept Appointment
- [ ] Click "Accept" on a pending appointment
- [ ] **Expected:** Confirmation dialog appears
- [ ] Confirm acceptance
- [ ] **Expected:** Status changes to "Accepted"
- [ ] **Expected:** Success message shown
- [ ] **Verify:** Appointment moves to "Accepted" section

### View Patient Details
- [ ] Click on an accepted appointment
- [ ] **Expected:** Patient details shown
- [ ] **Verify:** Shows: patient name, age, gender, contact
- [ ] **Verify:** Shows appointment details
- [ ] **Verify:** "Start Consultation" button visible

### Create Prescription
- [ ] Navigate to "Create Prescription"
- [ ] Select patient: (from dropdown or search)
- [ ] Add medicine:
  - Name: Paracetamol 500mg
  - Dosage: 1 tablet
  - Frequency: Three times daily
  - Duration: 5 days
  - Instructions: Take after meals
- [ ] Click "Add Medicine"
- [ ] Add another medicine (optional)
- [ ] Enter diagnosis: "Viral fever"
- [ ] Enter notes: "Rest and hydration"
- [ ] Click "Create Prescription"
- [ ] **Expected:** Success message shown
- [ ] **Expected:** Prescription saved
- [ ] **Verify:** Patient can see prescription in their dashboard

### View Analytics
- [ ] Navigate to "Analytics"
- [ ] **Expected:** Dashboard with stats shown
- [ ] **Verify:** Shows: total consultations, revenue, ratings
- [ ] **Verify:** Charts/graphs display (if implemented)
- [ ] **Verify:** No errors loading data

---

## ✅ VIDEO CONSULTATION TESTING

### Start Video Call (Doctor Side)
- [ ] Login as doctor: ahmed.khan@icare.com
- [ ] Navigate to accepted appointment
- [ ] Click "Start Consultation"
- [ ] **Expected:** Video call interface opens
- [ ] **Expected:** Camera permission requested
- [ ] **Expected:** Microphone permission requested
- [ ] Grant permissions
- [ ] **Expected:** Doctor's video preview shown
- [ ] **Expected:** Waiting for patient to join

### Join Video Call (Patient Side)
- [ ] Login as patient: ali.hassan@example.com (different browser/device)
- [ ] Navigate to accepted appointment
- [ ] Click "Join Consultation"
- [ ] **Expected:** Video call interface opens
- [ ] Grant camera/microphone permissions
- [ ] **Expected:** Patient's video shown
- [ ] **Expected:** Doctor's video shown
- [ ] **Expected:** Both parties can see/hear each other

### Test Video Call Features
- [ ] Test audio: Both parties speak and hear
- [ ] Test video: Both parties see each other
- [ ] Test mute: Mute/unmute microphone
- [ ] Test video toggle: Turn camera on/off
- [ ] Test chat: Send text message during call
- [ ] Test end call: End call gracefully
- [ ] **Verify:** No crashes or freezes
- [ ] **Verify:** Acceptable video/audio quality

**If Video Call Fails:**
- [ ] Document exact error message
- [ ] Test on different browser (Chrome recommended)
- [ ] Test on different network
- [ ] Prepare backup: screenshots or pre-recorded video

---

## ✅ CHAT SYSTEM TESTING

### Send Message (Patient to Doctor)
- [ ] Login as patient: ali.hassan@example.com
- [ ] Navigate to "Chat"
- [ ] Select doctor: Dr. Ahmed Khan
- [ ] Type message: "Hello, I have a question about my prescription"
- [ ] Click "Send"
- [ ] **Expected:** Message appears in chat
- [ ] **Expected:** Timestamp shown
- [ ] **Expected:** Delivery status shown

### Receive Message (Doctor Side)
- [ ] Login as doctor: ahmed.khan@icare.com (different browser)
- [ ] Navigate to "Chat"
- [ ] **Expected:** New message notification
- [ ] Open chat with patient
- [ ] **Expected:** Patient's message visible
- [ ] Reply: "Sure, how can I help?"
- [ ] **Expected:** Reply sent successfully

### Verify Message History
- [ ] Refresh both browsers
- [ ] **Expected:** Chat history persists
- [ ] **Expected:** All messages visible
- [ ] **Expected:** Correct order (newest at bottom)

---

## ✅ LAB DASHBOARD TESTING

### Lab Dashboard Features
- [ ] Login as lab: city.lab@icare.com
- [ ] **Expected:** Lab-specific dashboard loads
- [ ] **Verify:** Shows stats: Pending requests, In progress, Completed
- [ ] **Verify:** NO patient features visible (no "Book Appointment", no "My Cart")
- [ ] **Verify:** Shows: Bookings, Manage Tests, Analytics, Invoices, Tasks, Settings

### Lab Bookings (UI Test)
- [ ] Navigate to "Bookings"
- [ ] **Expected:** Bookings management page opens
- [ ] **Verify:** Can view test requests (if any)
- [ ] **Verify:** UI is clean and professional
- [ ] **Verify:** No errors loading page

### Lab Tests Management (UI Test)
- [ ] Navigate to "Manage Tests"
- [ ] **Expected:** Test catalog page opens
- [ ] **Verify:** Can view available tests
- [ ] **Verify:** UI for adding/editing tests exists
- [ ] **Verify:** No errors loading page

---

## ✅ PHARMACY DASHBOARD TESTING

### Pharmacy Dashboard Features
- [ ] Login as pharmacy: medicare.pharmacy@icare.com
- [ ] **Expected:** Pharmacy-specific dashboard loads
- [ ] **Verify:** Shows stats: Total orders, Pending, Products, Low stock
- [ ] **Verify:** NO patient features visible (no "Book Appointment", no "My Cart")
- [ ] **Verify:** Shows: Orders, Inventory, Analytics, Invoices

### Pharmacy Orders (UI Test)
- [ ] Navigate to "Orders"
- [ ] **Expected:** Orders management page opens
- [ ] **Verify:** Can view prescription orders (if any)
- [ ] **Verify:** UI is clean and professional
- [ ] **Verify:** No errors loading page

### Pharmacy Inventory (UI Test)
- [ ] Navigate to "Inventory"
- [ ] **Expected:** Inventory management page opens
- [ ] **Verify:** UI for managing products exists
- [ ] **Verify:** No errors loading page

---

## ✅ ADMIN DASHBOARD TESTING

### Admin Dashboard Features
- [ ] Login as admin: admin@icare.com
- [ ] **Expected:** Admin dashboard loads
- [ ] **Verify:** Shows admin controls
- [ ] **Verify:** Shows: Partner onboarding, Doctor approval, User management

### Create Lab Account (UI Test)
- [ ] Navigate to "Partner Onboarding" or "Create Lab"
- [ ] **Expected:** Lab creation form opens
- [ ] Fill form with test data
- [ ] **Verify:** Form validation works
- [ ] **Verify:** Can submit form (don't actually create during test)

### Create Pharmacy Account (UI Test)
- [ ] Navigate to "Create Pharmacy"
- [ ] **Expected:** Pharmacy creation form opens
- [ ] **Verify:** Form exists and is functional

### Doctor Approval (UI Test)
- [ ] Navigate to "Doctor Approvals"
- [ ] **Expected:** List of pending doctors (if any)
- [ ] **Verify:** Can view doctor details
- [ ] **Verify:** "Approve" and "Reject" buttons exist

---

## ✅ MOBILE RESPONSIVENESS TESTING

### Test on Mobile Browser
- [ ] Open web app on mobile device
- [ ] **Verify:** Layout adapts to mobile screen
- [ ] **Verify:** All buttons are tappable
- [ ] **Verify:** Text is readable
- [ ] **Verify:** Navigation works
- [ ] **Verify:** Forms are usable

### Test Android APK
- [ ] Install APK on Android device
- [ ] Open app
- [ ] Test complete patient journey
- [ ] Test doctor journey
- [ ] **Verify:** Performance is acceptable
- [ ] **Verify:** No crashes
- [ ] **Verify:** All features work

---

## ✅ ERROR HANDLING TESTING

### Test Network Error
- [ ] Disconnect internet
- [ ] Try to login
- [ ] **Expected:** User-friendly error message (NOT DioException)
- [ ] **Expected:** "Cannot reach server. Please check your internet connection."
- [ ] Reconnect internet
- [ ] Retry
- [ ] **Expected:** Works normally

### Test Invalid Credentials
- [ ] Try to login with wrong password
- [ ] **Expected:** "Invalid email or password" message
- [ ] **Expected:** NOT technical error message

### Test Empty Form Submission
- [ ] Try to submit signup form without filling fields
- [ ] **Expected:** Validation errors shown
- [ ] **Expected:** Clear indication of required fields

---

## ✅ PERFORMANCE TESTING

### Page Load Times
- [ ] Measure login page load: _____ seconds (should be < 2s)
- [ ] Measure dashboard load: _____ seconds (should be < 3s)
- [ ] Measure doctors list load: _____ seconds (should be < 3s)

### API Response Times
- [ ] Test doctors API: _____ ms (should be < 1000ms)
- [ ] Test appointments API: _____ ms (should be < 1000ms)
- [ ] Test login API: _____ ms (should be < 1500ms)

---

## ✅ FINAL VERIFICATION

### Demo Environment Setup
- [ ] All demo accounts created in database
- [ ] Sample appointments created
- [ ] Sample prescriptions created
- [ ] Backend is running and responsive
- [ ] Web app is deployed and accessible
- [ ] Android APK is built and tested
- [ ] All credentials documented

### Demo Preparation
- [ ] Demo script reviewed
- [ ] Demo credentials printed
- [ ] Backup screenshots prepared
- [ ] Backup video recorded (optional)
- [ ] Internet connection tested
- [ ] Backup internet (hotspot) ready
- [ ] Demo device charged
- [ ] Backup device ready
- [ ] HDMI/screen sharing tested

### Team Readiness
- [ ] Presenter has practiced demo
- [ ] Technical team on standby
- [ ] All team members know their roles
- [ ] Emergency contacts shared
- [ ] Backup plans discussed

---

## 🚨 CRITICAL ISSUES LOG

**If any test fails, document here:**

| Test | Status | Issue | Workaround | Fixed? |
|------|--------|-------|------------|--------|
| Example: Patient Login | ❌ Failed | DioException shown | Use standalone mode | ⏳ In Progress |
|  |  |  |  |  |
|  |  |  |  |  |

---

## ✅ SIGN-OFF

**Testing Completed By:** _________________  
**Date:** _________________  
**Time:** _________________  

**Overall Status:**
- [ ] All critical tests passed
- [ ] Minor issues documented with workarounds
- [ ] Ready for demo

**Notes:**
_________________________________________________________________
_________________________________________________________________
_________________________________________________________________

---

**Complete this checklist 24 hours before demo. Address all critical issues before demo day.**
