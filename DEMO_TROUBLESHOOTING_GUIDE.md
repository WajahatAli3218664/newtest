# iCare - Demo Day Troubleshooting Guide
**Keep this open during the demo for quick reference**

---

## 🚨 QUICK FIXES

### Issue: Backend Not Responding

**Symptoms:**
- Login fails with "Cannot reach server"
- Doctors list doesn't load
- Appointments don't load

**Quick Check:**
```
Open: https://icare-backend-comprehensive.vercel.app/
Expected: {"success":true,"message":"iCare Backend API is running"}
```

**If Backend is Down:**
1. ✅ **Don't panic** - App has standalone mode
2. ✅ Refresh the page - standalone mode activates automatically
3. ✅ Say: "We have a fallback system that provides demo data when the backend is unavailable"
4. ✅ Continue demo with local data
5. ✅ All features will work with mock data

**If Backend is Slow:**
1. Wait 5-10 seconds for response
2. If timeout, standalone mode kicks in
3. Continue normally

---

### Issue: Login Fails

**Symptoms:**
- "Invalid credentials" error
- "User not found" error
- Page doesn't redirect after login

**Quick Fixes:**

**Try 1: Clear Browser Cache**
```
Chrome: Ctrl+Shift+Delete → Clear browsing data
Firefox: Ctrl+Shift+Delete → Clear data
```

**Try 2: Use Incognito/Private Mode**
```
Chrome: Ctrl+Shift+N
Firefox: Ctrl+Shift+P
```

**Try 3: Try Different Account**
```
If ali.hassan@example.com fails, try:
- zainab.ahmed@example.com
- omar.khan@example.com
All use password: Demo123456
```

**Try 4: Use Backup Account**
```
Email: backup.patient@icare.com
Password: Backup123456
```

**Last Resort:**
- Show screenshots of logged-in dashboard
- Explain: "We have a minor authentication issue, but here's what the dashboard looks like"
- Continue with screenshots

---

### Issue: Video Call Doesn't Start

**Symptoms:**
- Black screen
- "Camera not found" error
- "Permission denied" error

**Quick Fixes:**

**Try 1: Grant Permissions**
1. Browser will ask for camera/microphone permissions
2. Click "Allow"
3. If blocked, click camera icon in address bar
4. Change to "Allow"
5. Refresh page

**Try 2: Check Camera/Microphone**
1. Close other apps using camera (Zoom, Teams, etc.)
2. Refresh browser
3. Try again

**Try 3: Use Different Browser**
1. Chrome works best for WebRTC
2. Try Firefox as backup
3. Avoid Safari/Edge if possible

**Backup Plan:**
- Show pre-recorded video of consultation
- Show screenshots of video call interface
- Say: "Here's what the video consultation looks like in action"
- Continue with other features

---

### Issue: Doctors List is Empty

**Symptoms:**
- "No doctors found" message
- Empty list on Find Doctors page

**Quick Fixes:**

**Check 1: Backend Connection**
```
Open console (F12)
Look for errors
If "404" or "Network error" → Backend issue → Standalone mode
```

**Check 2: Database**
```
If backend is up but no doctors:
- Demo data wasn't loaded
- Use standalone mode (refresh page)
- Doctors will appear from local data
```

**Backup Plan:**
- Show screenshots of doctors list
- Say: "We have 5 doctors in our demo database"
- Show doctor profiles from screenshots
- Continue with appointment booking using screenshots

---

### Issue: Appointment Booking Fails

**Symptoms:**
- "Failed to book appointment" error
- Form doesn't submit
- No confirmation message

**Quick Fixes:**

**Try 1: Check Form Validation**
1. Ensure date is selected
2. Ensure time slot is selected
3. Reason is optional

**Try 2: Try Different Doctor**
1. Go back to doctors list
2. Select different doctor
3. Try booking again

**Try 3: Use Standalone Mode**
1. Refresh page
2. Standalone mode activates
3. Booking will work with local data

**Backup Plan:**
- Show screenshot of successful booking
- Show appointment in dashboard screenshot
- Say: "The booking system creates appointments that appear in both patient and doctor dashboards"
- Continue with doctor acceptance flow

---

### Issue: Chat Messages Don't Send

**Symptoms:**
- Message doesn't appear after sending
- "Failed to send" error
- Spinning loader doesn't stop

**Quick Fixes:**

**Try 1: Refresh Both Browsers**
1. Refresh patient browser
2. Refresh doctor browser
3. Try sending again

**Try 2: Check Backend**
1. If backend is down, chat won't work
2. Use standalone mode (limited chat functionality)

**Backup Plan:**
- Show screenshots of chat interface
- Say: "The chat system allows real-time communication between patients and doctors"
- Show message history screenshot
- Continue with other features

---

### Issue: Dashboard Doesn't Load

**Symptoms:**
- Blank page after login
- Spinning loader forever
- Error message

**Quick Fixes:**

**Try 1: Refresh Page**
```
Press F5 or Ctrl+R
Wait 5 seconds
```

**Try 2: Clear Cache and Retry**
```
Ctrl+Shift+Delete → Clear cache
Close browser
Reopen and login
```

**Try 3: Try Different Browser**
```
If Chrome fails, try Firefox
If Firefox fails, try Edge
```

**Backup Plan:**
- Show screenshots of dashboard
- Walk through features using screenshots
- Say: "Here's the patient dashboard with all key features"
- Continue demo with screenshots

---

### Issue: Mobile APK Won't Install

**Symptoms:**
- "App not installed" error
- "Parse error" message
- Installation blocked

**Quick Fixes:**

**Try 1: Enable Unknown Sources**
```
Settings → Security → Unknown Sources → Enable
Try installing again
```

**Try 2: Uninstall Old Version**
```
If old version exists:
Settings → Apps → iCare → Uninstall
Install new APK
```

**Try 3: Use Different Device**
```
Have backup device ready
Install on backup device
```

**Backup Plan:**
- Show web version on mobile browser
- Say: "The app works on web as well as native mobile"
- Demonstrate responsive design
- Continue with web version

---

### Issue: Internet Connection Lost

**Symptoms:**
- "No internet connection" message
- Pages won't load
- APIs timeout

**Quick Fixes:**

**Try 1: Switch to Mobile Hotspot**
```
Enable mobile hotspot on phone
Connect laptop to hotspot
Continue demo
```

**Try 2: Use Offline Features**
```
Standalone mode works offline
Show cached data
Explain: "The app has offline capabilities"
```

**Backup Plan:**
- Switch to pre-recorded video
- Show screenshots walkthrough
- Discuss architecture and features
- Focus on Q&A

---

## 📱 DEVICE-SPECIFIC ISSUES

### Windows Issues

**Issue: App Won't Start**
```
Error: Missing DLL files
Fix: Install Visual C++ Redistributable
Backup: Use web version
```

**Issue: Slow Performance**
```
Fix: Close other applications
Fix: Restart app
Backup: Use web version
```

### Android Issues

**Issue: App Crashes on Startup**
```
Fix: Clear app data
Fix: Reinstall app
Backup: Use web browser
```

**Issue: Camera Permission Denied**
```
Fix: Settings → Apps → iCare → Permissions → Camera → Allow
Backup: Show screenshots
```

### Browser Issues

**Issue: Chrome - WebRTC Not Working**
```
Fix: Check chrome://settings/content/camera
Fix: Allow camera/microphone for site
Backup: Use Firefox
```

**Issue: Firefox - Slow Loading**
```
Fix: Disable extensions
Fix: Clear cache
Backup: Use Chrome
```

---

## 🎯 DEMO FLOW RECOVERY

### If Patient Journey Fails

**Skip to:**
1. Doctor dashboard (already logged in)
2. Show doctor accepting appointments
3. Show prescription creation
4. Show analytics

**Say:**
"Let me show you the doctor's perspective instead"

---

### If Doctor Journey Fails

**Skip to:**
1. Lab dashboard
2. Show lab workflow
3. Show pharmacy dashboard
4. Show admin controls

**Say:**
"Let me show you how our partner ecosystem works"

---

### If All Live Demo Fails

**Backup Plan:**
1. Open pre-recorded video
2. Play video walkthrough
3. Pause at key points to explain
4. Answer questions
5. Show architecture diagrams
6. Discuss technical implementation

**Say:**
"We have a comprehensive video walkthrough prepared. Let me show you that while we troubleshoot the live environment"

---

## 🔧 TECHNICAL CHECKS

### Pre-Demo (30 minutes before)

```
✅ Backend health check
✅ All demo accounts login successfully
✅ Internet connection stable
✅ Backup internet (hotspot) ready
✅ All browsers open with correct tabs
✅ Screenshots folder ready
✅ Video backup ready
✅ HDMI/screen sharing working
✅ Audio working
✅ Demo device charged
✅ Backup device charged
```

### During Demo (Quick Checks)

**If something seems slow:**
1. Check backend: https://icare-backend-comprehensive.vercel.app/
2. Check internet speed: fast.com
3. Check browser console (F12) for errors

**If something doesn't work:**
1. Don't spend more than 30 seconds troubleshooting
2. Use backup plan immediately
3. Keep demo moving forward

---

## 💬 WHAT TO SAY

### When Backend is Down
✅ "We have a robust fallback system that ensures the app remains functional even when the backend is unavailable. This is great for demos and offline scenarios."

❌ Don't say: "The backend is down" or "There's a problem with our server"

---

### When Feature Doesn't Work
✅ "Let me show you this feature using our prepared materials while we check the live environment."

❌ Don't say: "This isn't working" or "I don't know why this is broken"

---

### When Internet Fails
✅ "The app has offline capabilities. Let me demonstrate those while we switch to our backup connection."

❌ Don't say: "We lost internet" or "This is embarrassing"

---

### When Video Call Fails
✅ "Video consultations use WebRTC technology. Here's a recorded example of a consultation in progress."

❌ Don't say: "The camera isn't working" or "I can't get the video to start"

---

## 🎭 STAYING CALM

### Remember:
1. **Clients expect issues** - No demo is perfect
2. **Preparation shows** - Having backups demonstrates professionalism
3. **Keep moving** - Don't dwell on problems
4. **Stay positive** - Focus on what works
5. **Be honest** - Acknowledge issues but don't apologize excessively

### Body Language:
- ✅ Stay relaxed and confident
- ✅ Smile and maintain eye contact
- ✅ Speak clearly and steadily
- ❌ Don't fidget or show frustration
- ❌ Don't rush through explanations

### Phrases to Use:
- "Let me show you an alternative view of this"
- "Here's what this looks like in action"
- "We have this prepared for you"
- "This demonstrates the feature perfectly"
- "Let's move on to the next section"

---

## 📞 EMERGENCY CONTACTS

**Technical Support (During Demo):**
- Backend Developer: [Phone]
- Frontend Developer: [Phone]
- DevOps: [Phone]

**Quick Commands:**
```
Restart Backend: [Vercel Dashboard]
Check Database: [MongoDB Atlas]
Check Logs: [Vercel Logs]
```

---

## ✅ POST-ISSUE CHECKLIST

After resolving any issue:
- [ ] Note what happened
- [ ] Note how it was resolved
- [ ] Continue demo smoothly
- [ ] Don't mention the issue again
- [ ] Stay focused on features

---

**Remember: The goal is to demonstrate value, not perfection. Clients understand that software has issues. What matters is how you handle them professionally.**

---

## 🎯 PRIORITY MATRIX

**If multiple things go wrong, fix in this order:**

1. **CRITICAL:** Backend completely down
   - Action: Switch to standalone mode immediately
   
2. **HIGH:** Login not working
   - Action: Use backup accounts or screenshots
   
3. **MEDIUM:** Video call not working
   - Action: Show recorded video
   
4. **LOW:** Chat not working
   - Action: Show screenshots, continue with other features

**Don't try to fix everything. Use backups and keep moving forward.**
