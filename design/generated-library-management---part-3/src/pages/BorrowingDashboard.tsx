import React from 'react';
import { Link } from 'react-router-dom';
import Header from '../components/Header';

export default function BorrowingDashboard() {
  return (
    <div className="bg-background-light font-display text-gray-800 min-h-screen">
      <Header />

      {/* Main Content */}
      <main className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        {/* Breadcrumb */}
        <nav className="flex text-sm text-gray-500 mb-6" aria-label="Breadcrumb">
          <ol className="inline-flex items-center space-x-1 md:space-x-3">
            <li className="inline-flex items-center">
              <Link to="/" className="inline-flex items-center hover:text-primary transition-colors">
                <span className="material-symbols-outlined text-sm mr-1">home</span>
                Home
              </Link>
            </li>
            <li>
              <div className="flex items-center">
                <span className="material-symbols-outlined text-sm mx-1">chevron_right</span>
                <span className="hover:text-primary transition-colors cursor-default">My Borrowing</span>
              </div>
            </li>
            <li aria-current="page">
              <div className="flex items-center">
                <span className="material-symbols-outlined text-sm mx-1">chevron_right</span>
                <span className="text-gray-800 font-medium">Dashboard</span>
              </div>
            </li>
          </ol>
        </nav>

        <div className="flex flex-col md:flex-row gap-8">
          {/* Sidebar */}
          <aside className="w-full md:w-64 shrink-0">
            <div className="bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden">
              <nav className="p-2">
                <Link to="/borrowing/dashboard" className="flex items-center gap-3 px-4 py-3 text-sm font-medium rounded-lg bg-blue-50 text-primary transition-colors">
                  <span className="material-symbols-outlined">dashboard</span>
                  Dashboard
                </Link>
                <Link to="/borrowing/loans" className="flex items-center gap-3 px-4 py-3 text-sm font-medium rounded-lg text-gray-600 hover:bg-gray-50 hover:text-primary transition-colors">
                  <span className="material-symbols-outlined">book</span>
                  Current Loans
                </Link>
                <Link to="/borrowing/requests" className="flex items-center justify-between px-4 py-3 text-sm font-medium rounded-lg text-gray-600 hover:bg-gray-50 hover:text-primary transition-colors">
                  <div className="flex items-center gap-3">
                    <span className="material-symbols-outlined">hourglass_empty</span>
                    Pending Requests
                  </div>
                  <span className="bg-gray-100 text-gray-600 text-xs py-0.5 px-2 rounded-full">3</span>
                </Link>
                <Link to="/borrowing/history" className="flex items-center gap-3 px-4 py-3 text-sm font-medium rounded-lg text-gray-600 hover:bg-gray-50 hover:text-primary transition-colors">
                  <span className="material-symbols-outlined">history</span>
                  Borrowing History
                </Link>
                <Link to="/borrowing/fines" className="flex items-center gap-3 px-4 py-3 text-sm font-medium rounded-lg text-gray-600 hover:bg-gray-50 hover:text-primary transition-colors">
                  <span className="material-symbols-outlined">payments</span>
                  Fines & Fees
                </Link>
              </nav>
            </div>
          </aside>

          {/* Main Content Area */}
          <div className="flex-1">
            <div className="mb-8">
              <h1 className="text-2xl font-bold text-gray-900">Borrowing Dashboard</h1>
              <p className="text-sm text-gray-500 mt-1">Welcome back, Alex! Here's an overview of your library activity.</p>
            </div>

            {/* Overview Cards */}
            <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4 mb-8">
              <Link to="/borrowing/loans" className="bg-white p-6 rounded-xl shadow-sm border border-gray-100 hover:shadow-md transition-shadow group">
                <div className="flex items-center justify-between mb-4">
                  <div className="w-10 h-10 rounded-full bg-blue-50 text-blue-600 flex items-center justify-center group-hover:bg-blue-100 transition-colors">
                    <span className="material-symbols-outlined">book</span>
                  </div>
                  <span className="text-2xl font-bold text-gray-900">2</span>
                </div>
                <h3 className="text-gray-600 font-medium text-sm">Current Loans</h3>
                <p className="text-xs text-red-500 mt-1 font-medium">1 Overdue</p>
              </Link>

              <Link to="/borrowing/requests" className="bg-white p-6 rounded-xl shadow-sm border border-gray-100 hover:shadow-md transition-shadow group">
                <div className="flex items-center justify-between mb-4">
                  <div className="w-10 h-10 rounded-full bg-purple-50 text-purple-600 flex items-center justify-center group-hover:bg-purple-100 transition-colors">
                    <span className="material-symbols-outlined">hourglass_empty</span>
                  </div>
                  <span className="text-2xl font-bold text-gray-900">3</span>
                </div>
                <h3 className="text-gray-600 font-medium text-sm">Pending Requests</h3>
                <p className="text-xs text-gray-500 mt-1">1 Ready for pickup</p>
              </Link>

              <Link to="/borrowing/history" className="bg-white p-6 rounded-xl shadow-sm border border-gray-100 hover:shadow-md transition-shadow group">
                <div className="flex items-center justify-between mb-4">
                  <div className="w-10 h-10 rounded-full bg-green-50 text-green-600 flex items-center justify-center group-hover:bg-green-100 transition-colors">
                    <span className="material-symbols-outlined">history</span>
                  </div>
                  <span className="text-2xl font-bold text-gray-900">42</span>
                </div>
                <h3 className="text-gray-600 font-medium text-sm">Items Borrowed</h3>
                <p className="text-xs text-gray-500 mt-1">Lifetime total</p>
              </Link>

              <Link to="/borrowing/fines" className="bg-white p-6 rounded-xl shadow-sm border border-gray-100 hover:shadow-md transition-shadow group">
                <div className="flex items-center justify-between mb-4">
                  <div className="w-10 h-10 rounded-full bg-red-50 text-red-600 flex items-center justify-center group-hover:bg-red-100 transition-colors">
                    <span className="material-symbols-outlined">payments</span>
                  </div>
                  <span className="text-2xl font-bold text-gray-900">$4.50</span>
                </div>
                <h3 className="text-gray-600 font-medium text-sm">Fines & Fees</h3>
                <p className="text-xs text-red-500 mt-1 font-medium">Action required</p>
              </Link>
            </div>

            {/* Recent Activity */}
            <div className="bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden">
              <div className="p-6 border-b border-gray-100 flex justify-between items-center">
                <h2 className="text-lg font-bold text-gray-900">Recent Activity</h2>
                <Link to="/borrowing/history" className="text-sm font-medium text-primary hover:underline">View All</Link>
              </div>
              <div className="divide-y divide-gray-100">
                <div className="p-4 sm:p-6 flex items-start gap-4 hover:bg-gray-50 transition-colors">
                  <div className="w-10 h-10 rounded-full bg-red-50 text-red-600 flex items-center justify-center shrink-0 mt-1">
                    <span className="material-symbols-outlined text-sm">warning</span>
                  </div>
                  <div>
                    <p className="text-sm text-gray-900 font-medium">Item Overdue: Educated</p>
                    <p className="text-sm text-gray-500 mt-1">Your loan for "Educated" by Tara Westover is now overdue. Please return it as soon as possible to avoid further fines.</p>
                    <span className="text-xs text-gray-400 mt-2 block">2 days ago</span>
                  </div>
                </div>
                <div className="p-4 sm:p-6 flex items-start gap-4 hover:bg-gray-50 transition-colors">
                  <div className="w-10 h-10 rounded-full bg-green-50 text-green-600 flex items-center justify-center shrink-0 mt-1">
                    <span className="material-symbols-outlined text-sm">check_circle</span>
                  </div>
                  <div>
                    <p className="text-sm text-gray-900 font-medium">Item Returned: The Midnight Library</p>
                    <p className="text-sm text-gray-500 mt-1">You successfully returned "The Midnight Library" by Matt Haig.</p>
                    <span className="text-xs text-gray-400 mt-2 block">Oct 15, 2023</span>
                  </div>
                </div>
                <div className="p-4 sm:p-6 flex items-start gap-4 hover:bg-gray-50 transition-colors">
                  <div className="w-10 h-10 rounded-full bg-blue-50 text-blue-600 flex items-center justify-center shrink-0 mt-1">
                    <span className="material-symbols-outlined text-sm">book</span>
                  </div>
                  <div>
                    <p className="text-sm text-gray-900 font-medium">Item Borrowed: The Silent Patient</p>
                    <p className="text-sm text-gray-500 mt-1">You checked out "The Silent Patient" by Alex Michaelides. It is due on Nov 03, 2023.</p>
                    <span className="text-xs text-gray-400 mt-2 block">Oct 20, 2023</span>
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
