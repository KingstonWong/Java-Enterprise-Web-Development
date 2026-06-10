/**
 * @license
 * SPDX-License-Identifier: Apache-2.0
 */

import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import Navbar from './components/Navbar';
import Landing from './pages/Landing';
import Login from './pages/Login';
import Register from './pages/Register';
import ForgotPassword from './pages/ForgotPassword';
import AdminLogin from './pages/AdminLogin';

export default function App() {
  return (
    <Router>
      <div className="min-h-screen bg-slate-50 flex flex-col font-sans">
        <Routes>
          <Route path="/admin/login" element={<AdminLogin />} />
          <Route path="*" element={
            <>
              <Navbar />
              <main className="flex-grow">
                <Routes>
                  <Route path="/" element={<Landing />} />
                  <Route path="/login" element={<Login />} />
                  <Route path="/register" element={<Register />} />
                  <Route path="/forgot-password" element={<ForgotPassword />} />
                </Routes>
              </main>
            </>
          } />
        </Routes>
      </div>
    </Router>
  );
}
