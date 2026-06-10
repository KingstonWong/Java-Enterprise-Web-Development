import React from 'react';
import { Link } from 'react-router-dom';
import Header from '../components/Header';

export default function CurrentLoans() {
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
                <span className="text-gray-800 font-medium">Current Loans</span>
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
                <Link to="/borrowing/loans" className="flex items-center gap-3 px-4 py-3 text-sm font-medium rounded-lg bg-blue-50 text-primary transition-colors">
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
            <div className="bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden">
              <div className="p-6 border-b border-gray-100 flex flex-col sm:flex-row sm:items-center justify-between gap-4">
                <div>
                  <h1 className="text-2xl font-bold text-gray-900">Current Loans</h1>
                  <p className="text-sm text-gray-500 mt-1">Items you currently have checked out.</p>
                </div>
                <div className="flex items-center gap-2">
                  <div className="relative">
                    <span className="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-gray-400 text-sm">search</span>
                    <input type="text" placeholder="Search loans..." className="pl-9 pr-4 py-2 border border-gray-300 rounded-lg text-sm focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none w-full sm:w-64" />
                  </div>
                </div>
              </div>

              {/* Loans Table */}
              <div className="overflow-x-auto">
                <table className="w-full text-left border-collapse">
                  <thead>
                    <tr className="bg-gray-50 border-b border-gray-200 text-xs uppercase tracking-wider text-gray-500 font-semibold">
                      <th className="p-4 pl-6">Item Details</th>
                      <th className="p-4">Borrowed</th>
                      <th className="p-4">Due Date</th>
                      <th className="p-4">Status</th>
                      <th className="p-4 pr-6 text-right">Actions</th>
                    </tr>
                  </thead>
                  <tbody className="divide-y divide-gray-100 text-sm">
                    {/* Row 1 */}
                    <tr className="hover:bg-gray-50 transition-colors">
                      <td className="p-4 pl-6">
                        <div className="flex items-center gap-4">
                          <div className="w-12 h-16 bg-gray-200 rounded shrink-0 overflow-hidden shadow-sm hidden sm:block">
                            <img src="https://images.unsplash.com/photo-1544947950-fa07a98d237f?q=80&w=100&auto=format&fit=crop" alt="Cover" className="w-full h-full object-cover" />
                          </div>
                          <div>
                            <h3 className="font-bold text-gray-900 line-clamp-1">The Silent Patient</h3>
                            <p className="text-gray-500 text-xs mt-0.5">Alex Michaelides</p>
                            <p className="text-gray-400 text-xs font-mono mt-0.5">ISBN: 9781250301697</p>
                          </div>
                        </div>
                      </td>
                      <td className="p-4 text-gray-600">
                        Oct 20, 2023
                      </td>
                      <td className="p-4 text-gray-900 font-medium">
                        Nov 03, 2023
                      </td>
                      <td className="p-4">
                        <span className="inline-flex items-center gap-1 px-2.5 py-1 rounded-full text-xs font-medium bg-green-50 text-green-700 border border-green-200">
                          <span className="material-symbols-outlined text-[14px]">schedule</span>
                          On Time
                        </span>
                      </td>
                      <td className="p-4 pr-6 text-right">
                        <button className="text-primary hover:text-primary-dark font-medium text-sm flex items-center justify-end gap-1 ml-auto">
                          <span className="material-symbols-outlined text-[16px]">autorenew</span>
                          Renew
                        </button>
                      </td>
                    </tr>

                    {/* Row 2 */}
                    <tr className="hover:bg-gray-50 transition-colors">
                      <td className="p-4 pl-6">
                        <div className="flex items-center gap-4">
                          <div className="w-12 h-16 bg-gray-200 rounded shrink-0 overflow-hidden shadow-sm hidden sm:block flex items-center justify-center">
                            <span className="material-symbols-outlined text-gray-400">menu_book</span>
                          </div>
                          <div>
                            <h3 className="font-bold text-gray-900 line-clamp-1">Educated</h3>
                            <p className="text-gray-500 text-xs mt-0.5">Tara Westover</p>
                            <p className="text-gray-400 text-xs font-mono mt-0.5">ISBN: 9780399590504</p>
                          </div>
                        </div>
                      </td>
                      <td className="p-4 text-gray-600">
                        Oct 15, 2023
                      </td>
                      <td className="p-4 text-red-600 font-bold">
                        Oct 29, 2023
                      </td>
                      <td className="p-4">
                        <span className="inline-flex items-center gap-1 px-2.5 py-1 rounded-full text-xs font-medium bg-red-50 text-red-700 border border-red-200">
                          <span className="material-symbols-outlined text-[14px]">warning</span>
                          Overdue
                        </span>
                      </td>
                      <td className="p-4 pr-6 text-right">
                        <button className="text-gray-400 hover:text-gray-600 font-medium text-sm flex items-center justify-end gap-1 ml-auto disabled:opacity-50" disabled title="Cannot renew overdue item">
                          <span className="material-symbols-outlined text-[16px]">autorenew</span>
                          Renew
                        </button>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
              
              {/* Pagination */}
              <div className="p-4 border-t border-gray-100 flex items-center justify-between text-sm">
                <span className="text-gray-500">Showing 1 to 2 of 2 records</span>
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
