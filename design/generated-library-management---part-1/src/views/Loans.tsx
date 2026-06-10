import React, { useState } from 'react';
import { Plus, Search, ChevronDown, Download, ChevronLeft, ChevronRight, BookOpen, AlertCircle, Clock, CheckCircle2, ArrowDownRight } from 'lucide-react';
import { WalkInBorrow } from './WalkInBorrow';
import { ProcessReturn } from './ProcessReturn';

const loans = [
  {
    id: 'L-2023-4892',
    member: 'Emma Thompson',
    book: 'The Great Gatsby',
    borrowDate: 'Oct 12, 2023',
    dueDate: 'Oct 26, 2023',
    returnDate: '-',
    status: 'Active',
    avatar: 'https://i.pravatar.cc/150?u=emma'
  },
  {
    id: 'L-2023-4893',
    member: 'James Wilson',
    book: 'Atomic Habits',
    borrowDate: 'Oct 10, 2023',
    dueDate: 'Oct 24, 2023',
    returnDate: 'Oct 22, 2023',
    status: 'Returned',
    avatar: 'https://i.pravatar.cc/150?u=james'
  },
  {
    id: 'L-2023-4894',
    member: 'Sarah Connor',
    book: 'Project Hail Mary',
    borrowDate: 'Oct 01, 2023',
    dueDate: 'Oct 15, 2023',
    returnDate: '-',
    status: 'Overdue',
    avatar: 'https://i.pravatar.cc/150?u=sarah'
  },
  {
    id: 'L-2023-4895',
    member: 'Michael Chang',
    book: 'Dune',
    borrowDate: 'Oct 15, 2023',
    dueDate: 'Oct 29, 2023',
    returnDate: '-',
    status: 'Active',
    avatar: 'https://i.pravatar.cc/150?u=michael'
  },
  {
    id: 'L-2023-4896',
    member: 'Olivia Martinez',
    book: 'The Midnight Library',
    borrowDate: 'Sep 20, 2023',
    dueDate: 'Oct 04, 2023',
    returnDate: 'Oct 25, 2023',
    status: 'Returned Late',
    avatar: 'https://i.pravatar.cc/150?u=olivia'
  }
];

export function Loans() {
  const [isWalkIn, setIsWalkIn] = useState(false);
  const [isReturning, setIsReturning] = useState(false);

  if (isWalkIn) {
    return <WalkInBorrow onBack={() => setIsWalkIn(false)} />;
  }

  if (isReturning) {
    return <ProcessReturn onBack={() => setIsReturning(false)} />;
  }

  return (
    <div className="p-8 max-w-7xl mx-auto space-y-6">
      <div className="flex flex-col md:flex-row md:items-center justify-between gap-4">
        <div>
          <h1 className="text-3xl font-bold tracking-tight text-slate-900">Borrowing Records</h1>
          <p className="text-slate-500 mt-1">Track active loans, overdue items, and borrowing history.</p>
        </div>
        <div className="flex gap-3">
          <button className="flex items-center gap-2 px-4 py-2.5 bg-white border border-slate-200 text-slate-700 rounded-lg text-sm font-medium hover:bg-slate-50 transition-colors shadow-sm">
            <Download className="w-4 h-4" />
            Export CSV
          </button>
          <button 
            onClick={() => setIsReturning(true)}
            className="flex items-center gap-2 bg-white border border-slate-200 text-slate-700 hover:bg-slate-50 px-4 py-2.5 rounded-lg font-semibold transition-colors shadow-sm"
          >
            <ArrowDownRight className="w-5 h-5" />
            Return Book
          </button>
          <button 
            onClick={() => setIsWalkIn(true)}
            className="flex items-center gap-2 bg-[#137fec] hover:bg-blue-600 text-white px-5 py-2.5 rounded-lg font-semibold transition-colors shadow-sm"
          >
            <Plus className="w-5 h-5" />
            New Walk-in
          </button>
        </div>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
        <div className="bg-white p-6 rounded-2xl border border-slate-200 shadow-sm">
          <div className="flex items-center justify-between mb-4">
            <div className="w-12 h-12 rounded-xl bg-blue-50 text-[#137fec] flex items-center justify-center">
              <BookOpen className="w-6 h-6" />
            </div>
          </div>
          <div>
            <h3 className="text-3xl font-bold text-slate-900">2,845</h3>
            <p className="text-sm text-slate-500 font-medium mt-1">Total Loans (This Month)</p>
          </div>
        </div>
        <div className="bg-white p-6 rounded-2xl border border-slate-200 shadow-sm">
          <div className="flex items-center justify-between mb-4">
            <div className="w-12 h-12 rounded-xl bg-indigo-50 text-indigo-600 flex items-center justify-center">
              <Clock className="w-6 h-6" />
            </div>
          </div>
          <div>
            <h3 className="text-3xl font-bold text-slate-900">842</h3>
            <p className="text-sm text-slate-500 font-medium mt-1">Active Loans</p>
          </div>
        </div>
        <div className="bg-white p-6 rounded-2xl border border-slate-200 shadow-sm">
          <div className="flex items-center justify-between mb-4">
            <div className="w-12 h-12 rounded-xl bg-rose-50 text-rose-600 flex items-center justify-center">
              <AlertCircle className="w-6 h-6" />
            </div>
          </div>
          <div>
            <h3 className="text-3xl font-bold text-slate-900">142</h3>
            <p className="text-sm text-slate-500 font-medium mt-1">Overdue Items</p>
          </div>
        </div>
        <div className="bg-white p-6 rounded-2xl border border-slate-200 shadow-sm">
          <div className="flex items-center justify-between mb-4">
            <div className="w-12 h-12 rounded-xl bg-emerald-50 text-emerald-600 flex items-center justify-center">
              <CheckCircle2 className="w-6 h-6" />
            </div>
          </div>
          <div>
            <h3 className="text-3xl font-bold text-slate-900">56</h3>
            <p className="text-sm text-slate-500 font-medium mt-1">Returned Today</p>
          </div>
        </div>
      </div>

      <div className="bg-white p-4 rounded-xl border border-slate-200 shadow-sm flex flex-col lg:flex-row gap-4">
        <div className="relative flex-1">
          <Search className="w-5 h-5 text-slate-400 absolute left-3 top-1/2 -translate-y-1/2" />
          <input
            type="text"
            placeholder="Search by record ID, member, or book..."
            className="w-full pl-10 pr-4 py-2.5 bg-white border border-slate-200 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-[#137fec] focus:border-transparent"
          />
        </div>
        <div className="flex gap-3 overflow-x-auto pb-2 lg:pb-0">
          <div className="relative min-w-[140px]">
            <select className="w-full appearance-none bg-slate-50 border border-slate-200 text-slate-700 py-2.5 pl-3 pr-10 rounded-lg text-sm font-medium focus:outline-none focus:ring-2 focus:ring-[#137fec]">
              <option>Status: All</option>
            </select>
            <ChevronDown className="w-4 h-4 text-slate-500 absolute right-3 top-1/2 -translate-y-1/2 pointer-events-none" />
          </div>
          <div className="relative min-w-[160px]">
            <select className="w-full appearance-none bg-slate-50 border border-slate-200 text-slate-700 py-2.5 pl-3 pr-10 rounded-lg text-sm font-medium focus:outline-none focus:ring-2 focus:ring-[#137fec]">
              <option>Date Range: Last 30 Days</option>
            </select>
            <ChevronDown className="w-4 h-4 text-slate-500 absolute right-3 top-1/2 -translate-y-1/2 pointer-events-none" />
          </div>
          <button className="flex items-center gap-2 px-4 py-2.5 bg-white border border-slate-200 text-slate-700 rounded-lg text-sm font-medium hover:bg-slate-50 transition-colors whitespace-nowrap">
            More Filters
          </button>
        </div>
      </div>

      <div className="bg-white rounded-xl border border-slate-200 shadow-sm overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full text-left text-sm text-slate-600">
            <thead className="bg-slate-50 text-xs uppercase text-slate-500 border-b border-slate-200">
              <tr>
                <th className="px-6 py-4 font-semibold">Record ID</th>
                <th className="px-6 py-4 font-semibold min-w-[200px]">Member Name</th>
                <th className="px-6 py-4 font-semibold min-w-[200px]">Book Title</th>
                <th className="px-6 py-4 font-semibold">Borrow Date</th>
                <th className="px-6 py-4 font-semibold">Due Date</th>
                <th className="px-6 py-4 font-semibold">Return Date</th>
                <th className="px-6 py-4 font-semibold text-center">Status</th>
                <th className="px-6 py-4 font-semibold text-right">Actions</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100">
              {loans.map((loan) => (
                <tr key={loan.id} className="hover:bg-slate-50 transition-colors">
                  <td className="px-6 py-4 font-mono text-xs font-medium text-slate-600">{loan.id}</td>
                  <td className="px-6 py-4">
                    <div className="flex items-center gap-3">
                      <img src={loan.avatar} alt={loan.member} className="w-8 h-8 rounded-full object-cover shadow-sm border border-slate-200" referrerPolicy="no-referrer" />
                      <span className="text-sm font-semibold text-slate-900">{loan.member}</span>
                    </div>
                  </td>
                  <td className="px-6 py-4 font-medium text-slate-900">{loan.book}</td>
                  <td className="px-6 py-4 text-slate-600">{loan.borrowDate}</td>
                  <td className="px-6 py-4 text-slate-600">{loan.dueDate}</td>
                  <td className="px-6 py-4 text-slate-600">{loan.returnDate}</td>
                  <td className="px-6 py-4 text-center">
                    <span className={`inline-flex items-center rounded-full px-2.5 py-1 text-xs font-medium ring-1 ring-inset ${
                      loan.status === 'Active' ? 'bg-blue-50 text-[#137fec] ring-blue-600/20' :
                      loan.status === 'Returned' ? 'bg-emerald-50 text-emerald-700 ring-emerald-600/20' :
                      loan.status === 'Overdue' ? 'bg-rose-50 text-rose-700 ring-rose-600/20' :
                      'bg-amber-50 text-amber-700 ring-amber-600/20'
                    }`}>
                      {loan.status}
                    </span>
                  </td>
                  <td className="px-6 py-4 text-right">
                    <button className="text-[#137fec] hover:text-blue-700 text-sm font-semibold hover:underline">
                      View Details
                    </button>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
        <div className="flex items-center justify-between border-t border-slate-200 bg-slate-50 px-6 py-3">
          <p className="text-sm text-slate-700">
            Showing <span className="font-medium">1</span> to <span className="font-medium">5</span> of <span className="font-medium">2,845</span> results
          </p>
          <div className="flex gap-1">
            <button className="p-2 rounded-md border border-slate-300 bg-white text-slate-400 hover:bg-slate-50">
              <ChevronLeft className="w-4 h-4" />
            </button>
            <button className="px-3 py-1 rounded-md bg-[#137fec] text-white text-sm font-semibold">1</button>
            <button className="px-3 py-1 rounded-md border border-slate-300 bg-white text-slate-900 text-sm font-semibold hover:bg-slate-50">2</button>
            <button className="px-3 py-1 rounded-md border border-slate-300 bg-white text-slate-900 text-sm font-semibold hover:bg-slate-50">3</button>
            <span className="px-3 py-1 text-slate-700">...</span>
            <button className="px-3 py-1 rounded-md border border-slate-300 bg-white text-slate-900 text-sm font-semibold hover:bg-slate-50">569</button>
            <button className="p-2 rounded-md border border-slate-300 bg-white text-slate-400 hover:bg-slate-50">
              <ChevronRight className="w-4 h-4" />
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}
