import React from 'react';
import { ArrowLeft, Search, Trash2, Calendar, Clock } from 'lucide-react';

export function ProcessReturn({ onBack }: { onBack: () => void }) {
  return (
    <div className="p-8 max-w-7xl mx-auto space-y-6">
      <div className="flex items-center gap-4">
        <button onClick={onBack} className="p-2 text-slate-400 hover:text-slate-600 hover:bg-slate-100 rounded-lg transition-colors">
          <ArrowLeft className="w-5 h-5" />
        </button>
        <div>
          <h1 className="text-2xl font-bold tracking-tight text-slate-900">Process Returns</h1>
          <p className="text-slate-500 text-sm mt-1">Scan returned items and process any applicable fines.</p>
        </div>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
        <div className="lg:col-span-2 space-y-6">
          <div className="bg-white rounded-2xl border border-slate-200 shadow-sm p-6">
            <h2 className="text-lg font-bold text-slate-900 mb-4">Scan Items</h2>
            <div className="relative mb-6">
              <Search className="w-5 h-5 text-slate-400 absolute left-3 top-1/2 -translate-y-1/2" />
              <input
                type="text"
                placeholder="Scan book ISBN or enter record ID..."
                className="w-full pl-10 pr-4 py-3 bg-slate-50 border border-slate-200 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-[#137fec] focus:border-transparent"
                autoFocus
              />
            </div>

            <div className="space-y-4">
              <div className="flex items-start gap-4 p-4 rounded-xl border border-emerald-200 bg-emerald-50/50">
                <img src="https://picsum.photos/seed/gatsby/100/150" alt="The Great Gatsby" className="w-16 h-24 rounded object-cover shadow-sm" referrerPolicy="no-referrer" />
                <div className="flex-1">
                  <div className="flex items-start justify-between">
                    <div>
                      <h3 className="text-base font-bold text-slate-900">The Great Gatsby</h3>
                      <p className="text-sm text-slate-500 mt-0.5">F. Scott Fitzgerald</p>
                      <p className="text-xs text-slate-400 font-mono mt-1">L-2023-4892</p>
                    </div>
                    <span className="inline-flex items-center rounded-full px-2.5 py-1 text-xs font-medium bg-emerald-100 text-emerald-700">
                      Returned On Time
                    </span>
                  </div>
                  <div className="mt-4 flex items-center gap-6">
                    <div className="flex items-center gap-2">
                      <img src="https://i.pravatar.cc/150?u=emma" alt="Emma Thompson" className="w-6 h-6 rounded-full" referrerPolicy="no-referrer" />
                      <span className="text-sm font-medium text-slate-700">Emma Thompson</span>
                    </div>
                    <div className="flex items-center gap-1.5 text-sm text-slate-500">
                      <Calendar className="w-4 h-4" />
                      Due: Oct 26, 2023
                    </div>
                  </div>
                </div>
                <button className="p-2 text-slate-400 hover:text-red-600 hover:bg-red-50 rounded-lg transition-colors">
                  <Trash2 className="w-5 h-5" />
                </button>
              </div>

              <div className="flex items-start gap-4 p-4 rounded-xl border border-rose-200 bg-rose-50/50">
                <img src="https://picsum.photos/seed/mockingbird/100/150" alt="To Kill a Mockingbird" className="w-16 h-24 rounded object-cover shadow-sm" referrerPolicy="no-referrer" />
                <div className="flex-1">
                  <div className="flex items-start justify-between">
                    <div>
                      <h3 className="text-base font-bold text-slate-900">To Kill a Mockingbird</h3>
                      <p className="text-sm text-slate-500 mt-0.5">Harper Lee</p>
                      <p className="text-xs text-slate-400 font-mono mt-1">L-2023-4811</p>
                    </div>
                    <span className="inline-flex items-center rounded-full px-2.5 py-1 text-xs font-medium bg-rose-100 text-rose-700">
                      Overdue (14 days)
                    </span>
                  </div>
                  <div className="mt-4 flex items-center gap-6">
                    <div className="flex items-center gap-2">
                      <img src="https://i.pravatar.cc/150?u=sarah" alt="Sarah Connor" className="w-6 h-6 rounded-full" referrerPolicy="no-referrer" />
                      <span className="text-sm font-medium text-slate-700">Sarah Connor</span>
                    </div>
                    <div className="flex items-center gap-1.5 text-sm text-rose-600 font-medium">
                      <Clock className="w-4 h-4" />
                      Due: Oct 12, 2023
                    </div>
                  </div>
                </div>
                <button className="p-2 text-slate-400 hover:text-red-600 hover:bg-red-50 rounded-lg transition-colors">
                  <Trash2 className="w-5 h-5" />
                </button>
              </div>
            </div>
          </div>
        </div>

        <div className="space-y-6">
          <div className="bg-white rounded-2xl border border-slate-200 shadow-sm p-6 sticky top-24">
            <h2 className="text-lg font-bold text-slate-900 mb-6">Return Summary</h2>
            
            <div className="space-y-4 mb-6">
              <div className="flex items-center justify-between text-sm">
                <span className="text-slate-500">Items Scanned</span>
                <span className="font-semibold text-slate-900">2</span>
              </div>
              <div className="flex items-center justify-between text-sm">
                <span className="text-slate-500">On Time</span>
                <span className="font-semibold text-emerald-600">1</span>
              </div>
              <div className="flex items-center justify-between text-sm">
                <span className="text-slate-500">Overdue</span>
                <span className="font-semibold text-rose-600">1</span>
              </div>
            </div>

            <div className="pt-4 border-t border-slate-200 mb-8">
              <div className="flex items-center justify-between mb-2">
                <span className="text-sm font-semibold text-slate-900">Total Fines Generated</span>
                <span className="text-xl font-bold text-rose-600">$7.00</span>
              </div>
              <p className="text-xs text-slate-500">Fines will be automatically added to member accounts.</p>
            </div>

            <div className="space-y-3">
              <button className="w-full py-3 px-4 bg-[#137fec] hover:bg-blue-600 text-white text-sm font-semibold rounded-xl transition-colors shadow-sm">
                Complete Return Process
              </button>
              <button onClick={onBack} className="w-full py-3 px-4 bg-white border border-slate-200 text-slate-700 hover:bg-slate-50 text-sm font-semibold rounded-xl transition-colors">
                Cancel
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
