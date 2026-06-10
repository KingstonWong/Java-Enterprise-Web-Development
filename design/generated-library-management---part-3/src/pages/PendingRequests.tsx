import React from 'react';
import { Link } from 'react-router-dom';
import Header from '../components/Header';

export default function PendingRequests() {
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
                <a href="#" className="hover:text-primary transition-colors">My Borrowing</a>
              </div>
            </li>
            <li aria-current="page">
              <div className="flex items-center">
                <span className="material-symbols-outlined text-sm mx-1">chevron_right</span>
                <span className="text-gray-800 font-medium">Pending Requests</span>
              </div>
            </li>
          </ol>
        </nav>

        <div className="flex flex-col md:flex-row gap-8">
          {/* Sidebar */}
          <aside className="w-full md:w-64 shrink-0">
            <div className="bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden">
              <nav className="p-2">
                <Link to="/borrowing/dashboard" className="flex items-center gap-3 px-4 py-3 text-sm font-medium rounded-lg text-gray-600 hover:bg-gray-50 hover:text-primary transition-colors">
                  <span className="material-symbols-outlined">dashboard</span>
                  Dashboard
                </Link>
                <Link to="/borrowing/loans" className="flex items-center gap-3 px-4 py-3 text-sm font-medium rounded-lg text-gray-600 hover:bg-gray-50 hover:text-primary transition-colors">
                  <span className="material-symbols-outlined">book</span>
                  Current Loans
                </Link>
                <Link to="/borrowing/requests" className="flex items-center justify-between px-4 py-3 text-sm font-medium rounded-lg bg-blue-50 text-primary transition-colors">
                  <div className="flex items-center gap-3">
                    <span className="material-symbols-outlined">hourglass_empty</span>
                    Pending Requests
                  </div>
                  <span className="bg-primary text-white text-xs py-0.5 px-2 rounded-full">3</span>
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
            <div className="bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden">
              <div className="p-6 border-b border-gray-100 flex flex-col sm:flex-row sm:items-center justify-between gap-4">
                <div>
                  <h1 className="text-2xl font-bold text-gray-900">Pending Requests</h1>
                  <p className="text-sm text-gray-500 mt-1">Track the status of your requested books.</p>
                </div>
                <div className="flex items-center gap-2">
                  <div className="relative">
                    <span className="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-gray-400 text-sm">search</span>
                    <input type="text" placeholder="Search requests..." className="pl-9 pr-4 py-2 border border-gray-300 rounded-lg text-sm focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none w-full sm:w-64" />
                  </div>
                  <button className="p-2 border border-gray-300 rounded-lg text-gray-600 hover:bg-gray-50 transition-colors" title="Filter">
                    <span className="material-symbols-outlined text-sm">filter_list</span>
                  </button>
                </div>
              </div>

              {/* Requests List */}
              <div className="divide-y divide-gray-100">
                
                {/* Request Item 1 */}
                <div className="p-6 hover:bg-gray-50 transition-colors">
                  <div className="flex flex-col sm:flex-row gap-6">
                    <div className="w-24 h-36 bg-gray-200 rounded-md shrink-0 overflow-hidden shadow-sm">
                      <img src="https://images.unsplash.com/photo-1544947950-fa07a98d237f?q=80&w=200&auto=format&fit=crop" alt="Book Cover" className="w-full h-full object-cover" />
                    </div>
                    <div className="flex-1 flex flex-col justify-between">
                      <div>
                        <div className="flex justify-between items-start mb-2">
                          <div>
                            <h3 className="text-lg font-bold text-gray-900 line-clamp-1">The Midnight Library</h3>
                            <p className="text-sm text-gray-600">by Matt Haig</p>
                          </div>
                          <span className="inline-flex items-center gap-1 px-2.5 py-1 rounded-full text-xs font-medium bg-yellow-50 text-yellow-700 border border-yellow-200">
                            <span className="material-symbols-outlined text-[14px]">pending</span>
                            Processing
                          </span>
                        </div>
                        <div className="grid grid-cols-2 gap-y-2 gap-x-4 mt-4 text-sm">
                          <div>
                            <span className="text-gray-500 block text-xs">Request Date</span>
                            <span className="font-medium text-gray-900">Oct 24, 2023</span>
                          </div>
                          <div>
                            <span className="text-gray-500 block text-xs">Request ID</span>
                            <span className="font-medium text-gray-900 font-mono">REQ-8472</span>
                          </div>
                          <div>
                            <span className="text-gray-500 block text-xs">Pickup Branch</span>
                            <span className="font-medium text-gray-900">Central Library</span>
                          </div>
                          <div>
                            <span className="text-gray-500 block text-xs">Estimated Availability</span>
                            <span className="font-medium text-gray-900">Oct 28 - Oct 30</span>
                          </div>
                        </div>
                      </div>
                      <div className="mt-4 pt-4 border-t border-gray-100 flex justify-end gap-3">
                        <button className="px-4 py-2 text-sm font-medium text-red-600 bg-red-50 hover:bg-red-100 rounded-lg transition-colors">
                          Cancel Request
                        </button>
                        <button className="px-4 py-2 text-sm font-medium text-gray-700 bg-white border border-gray-300 hover:bg-gray-50 rounded-lg transition-colors">
                          View Details
                        </button>
                      </div>
                    </div>
                  </div>
                </div>

                {/* Request Item 2 */}
                <div className="p-6 hover:bg-gray-50 transition-colors">
                  <div className="flex flex-col sm:flex-row gap-6">
                    <div className="w-24 h-36 bg-gray-200 rounded-md shrink-0 overflow-hidden shadow-sm">
                      <img src="https://images.unsplash.com/photo-1589829085413-56de8ae18c73?q=80&w=200&auto=format&fit=crop" alt="Book Cover" className="w-full h-full object-cover" />
                    </div>
                    <div className="flex-1 flex flex-col justify-between">
                      <div>
                        <div className="flex justify-between items-start mb-2">
                          <div>
                            <h3 className="text-lg font-bold text-gray-900 line-clamp-1">Atomic Habits</h3>
                            <p className="text-sm text-gray-600">by James Clear</p>
                          </div>
                          <span className="inline-flex items-center gap-1 px-2.5 py-1 rounded-full text-xs font-medium bg-blue-50 text-blue-700 border border-blue-200">
                            <span className="material-symbols-outlined text-[14px]">local_shipping</span>
                            In Transit
                          </span>
                        </div>
                        <div className="grid grid-cols-2 gap-y-2 gap-x-4 mt-4 text-sm">
                          <div>
                            <span className="text-gray-500 block text-xs">Request Date</span>
                            <span className="font-medium text-gray-900">Oct 20, 2023</span>
                          </div>
                          <div>
                            <span className="text-gray-500 block text-xs">Request ID</span>
                            <span className="font-medium text-gray-900 font-mono">REQ-8415</span>
                          </div>
                          <div>
                            <span className="text-gray-500 block text-xs">Pickup Branch</span>
                            <span className="font-medium text-gray-900">Northside Branch</span>
                          </div>
                          <div>
                            <span className="text-gray-500 block text-xs">Estimated Availability</span>
                            <span className="font-medium text-gray-900">Tomorrow</span>
                          </div>
                        </div>
                      </div>
                      <div className="mt-4 pt-4 border-t border-gray-100 flex justify-end gap-3">
                        <button className="px-4 py-2 text-sm font-medium text-gray-700 bg-white border border-gray-300 hover:bg-gray-50 rounded-lg transition-colors">
                          View Details
                        </button>
                      </div>
                    </div>
                  </div>
                </div>

                {/* Request Item 3 */}
                <div className="p-6 hover:bg-gray-50 transition-colors">
                  <div className="flex flex-col sm:flex-row gap-6">
                    <div className="w-24 h-36 bg-gray-200 rounded-md shrink-0 overflow-hidden shadow-sm flex items-center justify-center text-gray-400">
                      <span className="material-symbols-outlined text-4xl">menu_book</span>
                    </div>
                    <div className="flex-1 flex flex-col justify-between">
                      <div>
                        <div className="flex justify-between items-start mb-2">
                          <div>
                            <h3 className="text-lg font-bold text-gray-900 line-clamp-1">Project Hail Mary</h3>
                            <p className="text-sm text-gray-600">by Andy Weir</p>
                          </div>
                          <span className="inline-flex items-center gap-1 px-2.5 py-1 rounded-full text-xs font-medium bg-green-50 text-green-700 border border-green-200">
                            <span className="material-symbols-outlined text-[14px]">check_circle</span>
                            Ready for Pickup
                          </span>
                        </div>
                        <div className="grid grid-cols-2 gap-y-2 gap-x-4 mt-4 text-sm">
                          <div>
                            <span className="text-gray-500 block text-xs">Request Date</span>
                            <span className="font-medium text-gray-900">Oct 15, 2023</span>
                          </div>
                          <div>
                            <span className="text-gray-500 block text-xs">Request ID</span>
                            <span className="font-medium text-gray-900 font-mono">REQ-8302</span>
                          </div>
                          <div>
                            <span className="text-gray-500 block text-xs">Pickup Branch</span>
                            <span className="font-medium text-gray-900">Central Library</span>
                          </div>
                          <div>
                            <span className="text-gray-500 block text-xs">Hold Expires</span>
                            <span className="font-medium text-red-600">Oct 28, 2023</span>
                          </div>
                        </div>
                      </div>
                      <div className="mt-4 pt-4 border-t border-gray-100 flex justify-between items-center">
                        <div className="text-sm text-gray-600 flex items-center gap-1">
                          <span className="material-symbols-outlined text-sm text-primary">info</span>
                          Please pick up at the front desk.
                        </div>
                        <div className="flex gap-3">
                          <button className="px-4 py-2 text-sm font-medium text-red-600 bg-red-50 hover:bg-red-100 rounded-lg transition-colors">
                            Cancel Hold
                          </button>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

              </div>
              
              {/* Pagination */}
              <div className="p-4 border-t border-gray-100 flex items-center justify-between text-sm">
                <span className="text-gray-500">Showing 1 to 3 of 3 requests</span>
                <div className="flex gap-1">
                  <button className="p-1 rounded text-gray-400 cursor-not-allowed" disabled>
                    <span className="material-symbols-outlined">chevron_left</span>
                  </button>
                  <button className="p-1 rounded text-gray-400 cursor-not-allowed" disabled>
                    <span className="material-symbols-outlined">chevron_right</span>
                  </button>
                </div>
              </div>

            </div>
          </div>
        </div>
      </main>
    </div>
  );
}
