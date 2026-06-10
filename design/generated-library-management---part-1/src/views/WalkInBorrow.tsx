import React from 'react';
import { ArrowLeft, Search, Trash2, AlertCircle } from 'lucide-react';

export function WalkInBorrow({ onBack }: { onBack: () => void }) {
  return (
    <div className="p-8 max-w-7xl mx-auto space-y-6">
      <div className="flex items-center gap-4">
        <button onClick={onBack} className="p-2 text-slate-400 hover:text-slate-600 hover:bg-slate-100 rounded-lg transition-colors">
          <ArrowLeft className="w-5 h-5" />
        </button>
        <div>
          <h1 className="text-2xl font-bold tracking-tight text-slate-900">Walk-in Borrow</h1>
          <p className="text-slate-500 text-sm mt-1">Process a new loan for a walk-in member.</p>
        </div>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
        <div className="space-y-6">
          <div className="bg-white rounded-2xl border border-slate-200 shadow-sm p-6">
            <h2 className="text-lg font-bold text-slate-900 mb-4">Member Details</h2>
            <div className="relative mb-6">
              <Search className="w-5 h-5 text-slate-400 absolute left-3 top-1/2 -translate-y-1/2" />
              <input
                type="text"
                placeholder="Scan member card or enter ID..."
                className="w-full pl-10 pr-4 py-2.5 bg-slate-50 border border-slate-200 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-[#137fec] focus:border-transparent"
                defaultValue="MEM-2023-0842"
              />
            </div>

            <div className="flex items-start gap-4 p-4 rounded-xl border border-slate-100 bg-slate-50">
              <img src="https://i.pravatar.cc/150?u=emma" alt="Emma Thompson" className="w-16 h-16 rounded-full object-cover shadow-sm border border-slate-200" referrerPolicy="no-referrer" />
              <div className="flex-1">
                <div className="flex items-center justify-between">
                  <h3 className="text-lg font-bold text-slate-900">Emma Thompson</h3>
                  <span className="inline-flex items-center rounded-full px-2.5 py-1 text-xs font-medium bg-emerald-50 text-emerald-700 ring-1 ring-inset ring-emerald-600/20">
                    Active
                  </span>
                </div>
                <p className="text-sm text-slate-500 mt-1">MEM-2023-0842</p>
                <div className="mt-4 flex items-center gap-6">
                  <div>
                    <p className="text-xs text-slate-500 font-medium">Active Loans</p>
                    <p className="text-sm font-semibold text-slate-900 mt-0.5">2 / 5</p>
                  </div>
                  <div>
                    <p className="text-xs text-slate-500 font-medium">Fines</p>
                    <p className="text-sm font-semibold text-slate-900 mt-0.5">$0.00</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div className="space-y-6">
          <div className="bg-white rounded-2xl border border-slate-200 shadow-sm p-6 flex flex-col h-full">
            <h2 className="text-lg font-bold text-slate-900 mb-4">Selected Books</h2>
            <div className="relative mb-6">
              <Search className="w-5 h-5 text-slate-400 absolute left-3 top-1/2 -translate-y-1/2" />
              <input
                type="text"
                placeholder="Scan book ISBN or enter title..."
                className="w-full pl-10 pr-4 py-2.5 bg-slate-50 border border-slate-200 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-[#137fec] focus:border-transparent"
              />
            </div>

            <div className="flex-1 space-y-3">
              <div className="flex items-center gap-4 p-3 rounded-xl border border-slate-100 hover:border-slate-200 transition-colors">
                <img src="https://picsum.photos/seed/gatsby/100/150" alt="The Great Gatsby" className="w-12 h-16 rounded object-cover shadow-sm" referrerPolicy="no-referrer" />
                <div className="flex-1">
                  <h4 className="text-sm font-semibold text-slate-900">The Great Gatsby</h4>
                  <p className="text-xs text-slate-500 mt-0.5">F. Scott Fitzgerald</p>
                  <p className="text-xs text-slate-400 font-mono mt-1">978-0743273565</p>
                </div>
                <div className="text-right">
                  <p className="text-xs font-medium text-slate-500">Due Date</p>
                  <p className="text-sm font-semibold text-slate-900 mt-0.5">Nov 12, 2023</p>
                </div>
                <button className="p-2 text-slate-400 hover:text-red-600 hover:bg-red-50 rounded-lg transition-colors ml-2">
                  <Trash2 className="w-4 h-4" />
                </button>
              </div>

              <div className="flex items-center gap-4 p-3 rounded-xl border border-slate-100 hover:border-slate-200 transition-colors">
                <img src="https://picsum.photos/seed/1984/100/150" alt="1984" className="w-12 h-16 rounded object-cover shadow-sm" referrerPolicy="no-referrer" />
                <div className="flex-1">
                  <h4 className="text-sm font-semibold text-slate-900">1984</h4>
                  <p className="text-xs text-slate-500 mt-0.5">George Orwell</p>
                  <p className="text-xs text-slate-400 font-mono mt-1">978-0451524935</p>
                </div>
                <div className="text-right">
                  <p className="text-xs font-medium text-slate-500">Due Date</p>
                  <p className="text-sm font-semibold text-slate-900 mt-0.5">Nov 12, 2023</p>
                </div>
                <button className="p-2 text-slate-400 hover:text-red-600 hover:bg-red-50 rounded-lg transition-colors ml-2">
                  <Trash2 className="w-4 h-4" />
                </button>
              </div>
            </div>

            <div className="mt-6 pt-6 border-t border-slate-200">
              <div className="flex items-center justify-between mb-6">
                <span className="text-sm font-medium text-slate-500">Total Items</span>
                <span className="text-lg font-bold text-slate-900">2</span>
              </div>
              <div className="flex items-center justify-end gap-3">
                <button type="button" onClick={onBack} className="px-5 py-2.5 text-sm font-semibold text-slate-700 hover:bg-slate-100 rounded-lg transition-colors">
                  Cancel
                </button>
                <button type="button" className="px-5 py-2.5 text-sm font-semibold text-white bg-[#137fec] hover:bg-blue-600 rounded-lg transition-colors shadow-sm">
                  Process Loan
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
