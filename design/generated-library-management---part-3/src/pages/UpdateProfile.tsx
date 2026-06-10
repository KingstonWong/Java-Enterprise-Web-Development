import React from 'react';
import { Link } from 'react-router-dom';
import Header from '../components/Header';

export default function UpdateProfile() {
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
                <span className="text-gray-800 font-medium">Update Profile</span>
              </div>
            </li>
          </ol>
        </nav>

        <div className="flex flex-col md:flex-row gap-8">
          {/* Sidebar */}
          <aside className="w-full md:w-64 shrink-0">
            <div className="bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden">
              <div className="p-6 text-center border-b border-gray-100">
                <div className="relative inline-block mb-4">
                  <img src="https://ui-avatars.com/api/?name=Alex+Johnson&background=137fec&color=fff&size=128" alt="Profile Picture" className="w-24 h-24 rounded-full border-4 border-white shadow-md mx-auto" />
                  <button className="absolute bottom-0 right-0 bg-white rounded-full p-1.5 shadow-sm border border-gray-200 text-gray-600 hover:text-primary hover:border-primary transition-colors">
                    <span className="material-symbols-outlined text-sm">photo_camera</span>
                  </button>
                </div>
                <h2 className="text-lg font-bold text-gray-900">Alex Johnson</h2>
                <p className="text-sm text-gray-500">Member since 2021</p>
                <div className="mt-3 inline-flex items-center gap-1 bg-green-50 text-green-700 px-2.5 py-1 rounded-full text-xs font-medium border border-green-200">
                  <span className="material-symbols-outlined text-[14px]">check_circle</span>
                  Active Account
                </div>
              </div>
              <nav className="p-2">
                <Link to="/profile" className="flex items-center gap-3 px-4 py-3 text-sm font-medium rounded-lg text-gray-600 hover:bg-gray-50 hover:text-primary transition-colors">
                  <span className="material-symbols-outlined">person</span>
                  Overview
                </Link>
                <Link to="/profile/update" className="flex items-center gap-3 px-4 py-3 text-sm font-medium rounded-lg bg-blue-50 text-primary transition-colors">
                  <span className="material-symbols-outlined">edit_square</span>
                  Update Profile
                </Link>
                <Link to="/profile/password" className="flex items-center gap-3 px-4 py-3 text-sm font-medium rounded-lg text-gray-600 hover:bg-gray-50 hover:text-primary transition-colors">
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
            <div className="bg-white rounded-xl shadow-sm border border-gray-100">
              <div className="p-6 border-b border-gray-100">
                <h1 className="text-2xl font-bold text-gray-900">Update Profile</h1>
                <p className="text-sm text-gray-500 mt-1">Manage your personal information and contact details.</p>
              </div>

              <form className="p-6 space-y-8">
                {/* Personal Information Section */}
                <section>
                  <h3 className="text-lg font-semibold text-gray-900 mb-4 flex items-center gap-2">
                    <span className="material-symbols-outlined text-primary">badge</span>
                    Personal Information
                  </h3>
                  <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div>
                      <label htmlFor="firstName" className="block text-sm font-medium text-gray-700 mb-1">First Name</label>
                      <input type="text" id="firstName" name="firstName" defaultValue="Alex" className="w-full px-4 py-2.5 rounded-lg border border-gray-300 focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none transition-all" />
                    </div>
                    <div>
                      <label htmlFor="lastName" className="block text-sm font-medium text-gray-700 mb-1">Last Name</label>
                      <input type="text" id="lastName" name="lastName" defaultValue="Johnson" className="w-full px-4 py-2.5 rounded-lg border border-gray-300 focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none transition-all" />
                    </div>
                    <div>
                      <label htmlFor="dob" className="block text-sm font-medium text-gray-700 mb-1">Date of Birth</label>
                      <div className="relative">
                        <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                          <span className="material-symbols-outlined text-gray-400 text-sm">calendar_today</span>
                        </div>
                        <input type="date" id="dob" name="dob" defaultValue="1990-05-15" className="w-full pl-10 px-4 py-2.5 rounded-lg border border-gray-300 focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none transition-all text-gray-700" />
                      </div>
                    </div>
                    <div>
                      <label htmlFor="gender" className="block text-sm font-medium text-gray-700 mb-1">Gender</label>
                      <select id="gender" name="gender" defaultValue="female" className="w-full px-4 py-2.5 rounded-lg border border-gray-300 focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none transition-all bg-white">
                        <option value="male">Male</option>
                        <option value="female">Female</option>
                        <option value="other">Other</option>
                        <option value="prefer-not">Prefer not to say</option>
                      </select>
                    </div>
                  </div>
                </section>

                <hr className="border-gray-100" />

                {/* Contact Information Section */}
                <section>
                  <h3 className="text-lg font-semibold text-gray-900 mb-4 flex items-center gap-2">
                    <span className="material-symbols-outlined text-primary">contact_mail</span>
                    Contact Information
                  </h3>
                  <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div className="md:col-span-2">
                      <label htmlFor="email" className="block text-sm font-medium text-gray-700 mb-1">Email Address</label>
                      <div className="relative">
                        <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                          <span className="material-symbols-outlined text-gray-400 text-sm">mail</span>
                        </div>
                        <input type="email" id="email" name="email" defaultValue="alex.johnson@example.com" className="w-full pl-10 px-4 py-2.5 rounded-lg border border-gray-300 focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none transition-all" />
                      </div>
                      <p className="mt-1 text-xs text-gray-500">We'll use this for important account notifications.</p>
                    </div>
                    <div>
                      <label htmlFor="phone" className="block text-sm font-medium text-gray-700 mb-1">Phone Number</label>
                      <div className="relative">
                        <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                          <span className="material-symbols-outlined text-gray-400 text-sm">call</span>
                        </div>
                        <input type="tel" id="phone" name="phone" defaultValue="+1 (555) 123-4567" className="w-full pl-10 px-4 py-2.5 rounded-lg border border-gray-300 focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none transition-all" />
                      </div>
                    </div>
                  </div>
                </section>

                {/* Form Actions */}
                <div className="flex items-center justify-end gap-4 pt-4 border-t border-gray-100">
                  <button type="button" className="px-6 py-2.5 text-sm font-medium text-gray-700 bg-white border border-gray-300 rounded-lg hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-gray-200 transition-colors">
                    Cancel
                  </button>
                  <button type="submit" className="px-6 py-2.5 text-sm font-medium text-white bg-primary rounded-lg hover:bg-primary-dark focus:outline-none focus:ring-2 focus:ring-primary/50 transition-colors shadow-sm flex items-center gap-2">
                    <span className="material-symbols-outlined text-sm">save</span>
                    Save Changes
                  </button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </main>
    </div>
  );
}
