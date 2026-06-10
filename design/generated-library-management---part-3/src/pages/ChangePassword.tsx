import React from 'react';
import { Link } from 'react-router-dom';
import Header from '../components/Header';

export default function ChangePassword() {
  return (
    <div className="bg-background-light font-display text-gray-800 min-h-screen">
      <Header />

      {/* Main Content */}
      <main className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        {/* Breadcrumb */}
        <nav className="flex text-sm text-gray-500 mb-6" aria-label="Breadcrumb">
          <ol className="inline-flex items-center space-x-1 md:space-x-3">
            <li className="inline-flex items-center">
              <a href="#" className="inline-flex items-center hover:text-primary transition-colors">
                <span className="material-symbols-outlined text-sm mr-1">home</span>
                Home
              </a>
            </li>
            <li>
              <div className="flex items-center">
                <span className="material-symbols-outlined text-sm mx-1">chevron_right</span>
                <a href="#" className="hover:text-primary transition-colors">Profile</a>
              </div>
            </li>
            <li aria-current="page">
              <div className="flex items-center">
                <span className="material-symbols-outlined text-sm mx-1">chevron_right</span>
                <span className="text-gray-800 font-medium">Change Password</span>
              </div>
            </li>
          </ol>
        </nav>

        <div className="flex flex-col md:flex-row gap-8">
          {/* Sidebar */}
          <aside className="w-full md:w-64 shrink-0">
            <div className="bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden">
              <nav className="p-2">
                <Link to="/profile" className="flex items-center gap-3 px-4 py-3 text-sm font-medium rounded-lg text-gray-600 hover:bg-gray-50 hover:text-primary transition-colors">
                  <span className="material-symbols-outlined">person</span>
                  Overview
                </Link>
                <Link to="/profile/update" className="flex items-center gap-3 px-4 py-3 text-sm font-medium rounded-lg text-gray-600 hover:bg-gray-50 hover:text-primary transition-colors">
                  <span className="material-symbols-outlined">edit_square</span>
                  Update Profile
                </Link>
                <Link to="/profile/password" className="flex items-center gap-3 px-4 py-3 text-sm font-medium rounded-lg bg-blue-50 text-primary transition-colors">
                  <span className="material-symbols-outlined">lock</span>
                  Change Password
                </Link>
                <Link to="#" className="flex items-center gap-3 px-4 py-3 text-sm font-medium rounded-lg text-gray-600 hover:bg-gray-50 hover:text-primary transition-colors">
                  <span className="material-symbols-outlined">notifications_active</span>
                  Notification Preferences
                </Link>
              </nav>
            </div>
          </aside>

          {/* Form Content */}
          <div className="flex-1">
            <div className="bg-white rounded-xl shadow-sm border border-gray-100 max-w-2xl">
              <div className="p-6 border-b border-gray-100">
                <h1 className="text-2xl font-bold text-gray-900 flex items-center gap-2">
                  <span className="material-symbols-outlined text-primary text-2xl">lock_reset</span>
                  Change Password
                </h1>
                <p className="text-sm text-gray-500 mt-1">Ensure your account is using a long, random password to stay secure.</p>
              </div>

              <form className="p-6 space-y-6">
                {/* Current Password */}
                <div>
                  <label htmlFor="currentPassword" className="block text-sm font-medium text-gray-700 mb-1">Current Password</label>
                  <div className="relative">
                    <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                      <span className="material-symbols-outlined text-gray-400 text-sm">key</span>
                    </div>
                    <input type="password" id="currentPassword" name="currentPassword" placeholder="Enter your current password" required className="w-full pl-10 pr-10 px-4 py-2.5 rounded-lg border border-gray-300 focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none transition-all" />
                    <button type="button" className="absolute inset-y-0 right-0 pr-3 flex items-center text-gray-400 hover:text-primary transition-colors">
                      <span className="material-symbols-outlined text-sm">visibility_off</span>
                    </button>
                  </div>
                  <div className="mt-2 text-right">
                    <a href="#" className="text-sm text-primary hover:underline font-medium">Forgot password?</a>
                  </div>
                </div>

                <hr className="border-gray-100" />

                {/* New Password */}
                <div>
                  <label htmlFor="newPassword" className="block text-sm font-medium text-gray-700 mb-1">New Password</label>
                  <div className="relative">
                    <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                      <span className="material-symbols-outlined text-gray-400 text-sm">lock</span>
                    </div>
                    <input type="password" id="newPassword" name="newPassword" placeholder="Enter new password" required className="w-full pl-10 pr-10 px-4 py-2.5 rounded-lg border border-gray-300 focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none transition-all" />
                    <button type="button" className="absolute inset-y-0 right-0 pr-3 flex items-center text-gray-400 hover:text-primary transition-colors">
                      <span className="material-symbols-outlined text-sm">visibility_off</span>
                    </button>
                  </div>
                  
                  {/* Password Strength Indicator */}
                  <div className="mt-3">
                    <div className="flex justify-between items-center mb-1">
                      <span className="text-xs font-medium text-gray-500">Password strength:</span>
                      <span className="text-xs font-bold text-orange-500">Medium</span>
                    </div>
                    <div className="flex gap-1 h-1.5">
                      <div className="flex-1 bg-orange-500 rounded-full"></div>
                      <div className="flex-1 bg-orange-500 rounded-full"></div>
                      <div className="flex-1 bg-gray-200 rounded-full"></div>
                      <div className="flex-1 bg-gray-200 rounded-full"></div>
                    </div>
                  </div>

                  {/* Password Requirements */}
                  <div className="mt-4 bg-gray-50 rounded-lg p-4 border border-gray-100">
                    <h4 className="text-xs font-semibold text-gray-700 uppercase tracking-wider mb-2">Password Requirements:</h4>
                    <ul className="text-sm text-gray-600 space-y-1.5">
                      <li className="flex items-center gap-2 text-green-600">
                        <span className="material-symbols-outlined text-[16px]">check_circle</span>
                        Minimum 8 characters
                      </li>
                      <li className="flex items-center gap-2 text-gray-500">
                        <span className="material-symbols-outlined text-[16px]">radio_button_unchecked</span>
                        At least one uppercase letter
                      </li>
                      <li className="flex items-center gap-2 text-gray-500">
                        <span className="material-symbols-outlined text-[16px]">radio_button_unchecked</span>
                        At least one number
                      </li>
                      <li className="flex items-center gap-2 text-gray-500">
                        <span className="material-symbols-outlined text-[16px]">radio_button_unchecked</span>
                        At least one special character (!@#$%^&*)
                      </li>
                    </ul>
                  </div>
                </div>

                {/* Confirm New Password */}
                <div>
                  <label htmlFor="confirmPassword" className="block text-sm font-medium text-gray-700 mb-1">Confirm New Password</label>
                  <div className="relative">
                    <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                      <span className="material-symbols-outlined text-gray-400 text-sm">lock_clock</span>
                    </div>
                    <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm new password" required className="w-full pl-10 pr-10 px-4 py-2.5 rounded-lg border border-gray-300 focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none transition-all" />
                    <button type="button" className="absolute inset-y-0 right-0 pr-3 flex items-center text-gray-400 hover:text-primary transition-colors">
                      <span className="material-symbols-outlined text-sm">visibility_off</span>
                    </button>
                  </div>
                </div>

                {/* Form Actions */}
                <div className="flex items-center justify-end gap-4 pt-6 border-t border-gray-100">
                  <button type="button" className="px-6 py-2.5 text-sm font-medium text-gray-700 bg-white border border-gray-300 rounded-lg hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-gray-200 transition-colors">
                    Cancel
                  </button>
                  <button type="submit" className="px-6 py-2.5 text-sm font-medium text-white bg-primary rounded-lg hover:bg-primary-dark focus:outline-none focus:ring-2 focus:ring-primary/50 transition-colors shadow-sm flex items-center gap-2 disabled:opacity-50 disabled:cursor-not-allowed">
                    <span className="material-symbols-outlined text-sm">update</span>
                    Update Password
                  </button>
                </div>
              </form>
            </div>
            
            {/* Security Notice */}
            <div className="mt-6 bg-blue-50 border border-blue-100 rounded-xl p-4 flex gap-3 max-w-2xl">
              <span className="material-symbols-outlined text-primary shrink-0">security</span>
              <div>
                <h4 className="text-sm font-bold text-blue-900">Security Tip</h4>
                <p className="text-sm text-blue-800 mt-1">We recommend changing your password every 90 days. Never share your password with anyone, including library staff.</p>
              </div>
            </div>
          </div>
        </div>
      </main>
    </div>
  );
}
