// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyC82W6GY0tVCF4HOrdAs50teWm3YtK575U",
  authDomain: "ghofrane-medic-app.firebaseapp.com",
  projectId: "ghofrane-medic-app",
  storageBucket: "ghofrane-medic-app.appspot.com",
  messagingSenderId: "540683505568",
  appId: "1:540683505568:web:53eaa689b9e55f5988dec5",
  measurementId: "G-CX28LZM0BQ"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);
