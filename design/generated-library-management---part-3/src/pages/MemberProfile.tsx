import React from 'react';
import { Link } from 'react-router-dom';
import Header from '../components/Header';

export default function MemberProfile() {
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
                <span className="text-gray-800 font-medium">Overview</span>
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
                <Link to="/profile" className="flex items-center gap-3 px-4 py-3 text-sm font-medium rounded-lg bg-blue-50 text-primary transition-colors">
                  <span className="material-symbols-outlined">person</span>
                  Overview
                </Link>
                <Link to="/profile/update" className="flex items-center gap-3 px-4 py-3 text-sm font-medium rounded-lg text-gray-600 hover:bg-gray-50 hover:text-primary transition-colors">
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

          {/* Main Content Area */}
          <div className="flex-1 space-y-6">
            
            {/* Quick Stats */}
            <div className="grid grid-cols-1 sm:grid-cols-3 gap-4">
              <div className="bg-white rounded-xl shadow-sm border border-gray-100 p-5 flex items-center gap-4">
                <div className="w-12 h-12 rounded-full bg-blue-50 text-primary flex items-center justify-center shrink-0">
                  <span className="material-symbols-outlined text-2xl">book</span>
                </div>
                <div>
                  <p className="text-sm font-medium text-gray-500">Current Loans</p>
                  <p className="text-2xl font-bold text-gray-900">4</p>
                </div>
              </div>
              <div className="bg-white rounded-xl shadow-sm border border-gray-100 p-5 flex items-center gap-4">
                <div className="w-12 h-12 rounded-full bg-orange-50 text-orange-600 flex items-center justify-center shrink-0">
                  <span className="material-symbols-outlined text-2xl">hourglass_empty</span>
                </div>
                <div>
                  <p className="text-sm font-medium text-gray-500">Pending Requests</p>
                  <p className="text-2xl font-bold text-gray-900">3</p>
                </div>
              </div>
              <div className="bg-white rounded-xl shadow-sm border border-gray-100 p-5 flex items-center gap-4">
                <div className="w-12 h-12 rounded-full bg-green-50 text-green-600 flex items-center justify-center shrink-0">
                  <span className="material-symbols-outlined text-2xl">history</span>
                </div>
                <div>
                  <p className="text-sm font-medium text-gray-500">Books Read</p>
                  <p className="text-2xl font-bold text-gray-900">42</p>
                </div>
              </div>
            </div>

            {/* Profile Information Card */}
            <div className="bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden">
              <div className="p-6 border-b border-gray-100 flex justify-between items-center">
                <h2 className="text-lg font-bold text-gray-900">Personal Information</h2>
                <button className="text-sm font-medium text-primary hover:underline flex items-center gap-1">
                  <span className="material-symbols-outlined text-[16px]">edit</span>
                  Edit
                </button>
              </div>
              <div className="p-6">
                <dl className="grid grid-cols-1 sm:grid-cols-2 gap-x-4 gap-y-6">
                  <div>
                    <dt className="text-sm font-medium text-gray-500 mb-1">Full Name</dt>
                    <dd className="text-sm font-semibold text-gray-900">Alex Johnson</dd>
                  </div>
                  <div>
                    <dt className="text-sm font-medium text-gray-500 mb-1">Date of Birth</dt>
                    <dd className="text-sm font-semibold text-gray-900">May 15, 1990</dd>
                  </div>
                  <div>
                    <dt className="text-sm font-medium text-gray-500 mb-1">Email Address</dt>
                    <dd className="text-sm font-semibold text-gray-900">alex.johnson@example.com</dd>
                  </div>
                  <div>
                    <dt className="text-sm font-medium text-gray-500 mb-1">Phone Number</dt>
                    <dd className="text-sm font-semibold text-gray-900">+1 (555) 123-4567</dd>
                  </div>
                </dl>
              </div>
            </div>

            {/* Library Card Details */}
            <div className="bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden">
              <div className="p-6 border-b border-gray-100">
                <h2 className="text-lg font-bold text-gray-900">Library Card Details</h2>
              </div>
              <div className="p-6 flex flex-col sm:flex-row gap-8 items-center sm:items-start">
                {/* Digital Card */}
                <div className="w-full sm:w-80 h-48 rounded-xl bg-gradient-to-br from-primary to-blue-800 p-6 text-white shadow-md relative overflow-hidden shrink-0">
                  <div className="absolute top-0 right-0 w-32 h-32 bg-white/10 rounded-full -mr-10 -mt-10"></div>
                  <div className="absolute bottom-0 left-0 w-24 h-24 bg-white/10 rounded-full -ml-8 -mb-8"></div>
                  
                  <div className="relative h-full flex flex-col justify-between z-10">
                    <div className="flex justify-between items-start">
                      <div className="flex items-center gap-2">
                        <span className="material-symbols-outlined text-2xl">menu_book</span>
                        <span className="font-bold tracking-wider">LIBRARY PORTAL</span>
                      </div>
                      <span className="material-symbols-outlined opacity-80">contactless</span>
                    </div>
                    
                    <div>
                      <p className="text-xs text-blue-200 uppercase tracking-widest mb-1">Member Name</p>
                      <p className="font-bold text-lg tracking-wide">ALEX JOHNSON</p>
                    </div>
                    
                    <div className="flex justify-between items-end">
                      <div>
                        <p className="text-xs text-blue-200 uppercase tracking-widest mb-1">Card Number</p>
                        <p className="font-mono text-sm tracking-[0.2em]">2940 1837 5629 0041</p>
                      </div>
                      <div className="bg-white p-1 rounded-sm">
                        <img src="https://api.qrserver.com/v1/create-qr-code/?size=40x40&data=2940183756290041" alt="QR Code" className="w-10 h-10 mix-blend-multiply" />
                      </div>
                    </div>
                  </div>
                </div>

                {/* Card Info */}
                <div className="flex-1 w-full">
                  <dl className="grid grid-cols-1 gap-y-4">
                    <div>
                      <dt className="text-sm font-medium text-gray-500 mb-1">Card Status</dt>
                      <dd className="inline-flex items-center gap-1 bg-green-50 text-green-700 px-2.5 py-1 rounded-full text-xs font-medium border border-green-200">
                        <span className="material-symbols-outlined text-[14px]">check_circle</span>
                        Active
                      </dd>
                    </div>
                    <div>
                      <dt className="text-sm font-medium text-gray-500 mb-1">Home Branch</dt>
                      <dd className="text-sm font-semibold text-gray-900">Central Library</dd>
                    </div>
                    <div>
                      <dt className="text-sm font-medium text-gray-500 mb-1">Expiration Date</dt>
                      <dd className="text-sm font-semibold text-gray-900">December 31, 2025</dd>
                    </div>
                  </dl>
                  <div className="mt-6 flex gap-3">
                    <button className="px-4 py-2 text-sm font-medium text-primary bg-blue-50 hover:bg-blue-100 rounded-lg transition-colors flex items-center gap-2">
                      <span className="material-symbols-outlined text-sm">qr_code_scanner</span>
                      Show Barcode
                    </button>
                    <button className="px-4 py-2 text-sm font-medium text-gray-700 bg-white border border-gray-300 hover:bg-gray-50 rounded-lg transition-colors flex items-center gap-2">
                      <span className="material-symbols-outlined text-sm">report</span>
                      Report Lost
                    </button>
                  </div>
                </div>
              </div>
            </div>

          </div>
        </div>
      </main>
    </div>
  );
}
