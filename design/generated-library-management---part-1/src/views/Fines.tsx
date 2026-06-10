import React, { useState } from 'react';
import { DollarSign, AlertCircle, Clock, Search, Download, ChevronLeft, ChevronRight, CheckCircle2, X } from 'lucide-react';

const initialFines = [
  {
    id: 'F-1042',
    member: 'Sarah Connor',
    memberId: 'MEM-2023-0844',
    book: 'Project Hail Mary',
    daysOverdue: 14,
    amount: 7.00,
    status: 'Unpaid',
    avatar: 'https://i.pravatar.cc/150?u=sarah'
  },
  {
    id: 'F-1043',
    member: 'Michael Chang',
    memberId: 'MEM-2023-0845',
    book: 'Dune',
    daysOverdue: 3,
    amount: 1.50,
    status: 'Unpaid',
    avatar: 'https://i.pravatar.cc/150?u=michael'
  },
  {
    id: 'F-1044',
    member: 'Olivia Martinez',
    memberId: 'MEM-2023-0846',
    book: 'The Midnight Library',
    daysOverdue: 21,
    amount: 10.50,
    status: 'Paid',
    avatar: 'https://i.pravatar.cc/150?u=olivia'
  },
  {
    id: 'F-1045',
    member: 'James Wilson',
    memberId: 'MEM-2023-0843',
    book: 'Atomic Habits',
    daysOverdue: 5,
    amount: 2.50,
    status: 'Unpaid',
    avatar: 'https://i.pravatar.cc/150?u=james'
  },
  {
    id: 'F-1046',
    member: 'Emma Thompson',
    memberId: 'MEM-2023-0842',
    book: 'The Great Gatsby',
    daysOverdue: 1,
    amount: 0.50,
    status: 'Paid',
    avatar: 'https://i.pravatar.cc/150?u=emma'
  }
];

export function Fines() {
  const [fines, setFines] = useState(initialFines);
  const [payingFine, setPayingFine] = useState<any>(null);
  const [viewingReceipt, setViewingReceipt] = useState<any>(null);

  const handlePayment = () => {
    if (payingFine) {
      setFines(fines.map(fine => 
        fine.id === payingFine.id ? { ...fine, status: 'Paid' } : fine
      ));
      setPayingFine(null);
    }
  };

  return (
    <div className="p-8 max-w-7xl mx-auto space-y-6">
      <div className="flex flex-col md:flex-row md:items-center justify-between gap-4">
        <div>
          <h1 className="text-3xl font-bold tracking-tight text-slate-900">Fines Management</h1>
          <p className="text-slate-500 mt-1">Track overdue items and manage fine payments.</p>
        </div>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
        <div className="bg-white p-6 rounded-2xl border border-slate-200 shadow-sm flex items-center gap-4">
          <div className="w-12 h-12 rounded-xl bg-rose-50 text-rose-600 flex items-center justify-center">
            <DollarSign className="w-6 h-6" />
          </div>
          <div>
            <p className="text-sm font-medium text-slate-500">Total Outstanding Fines</p>
            <h3 className="text-2xl font-bold text-slate-900">$342.50</h3>
          </div>
        </div>
        <div className="bg-white p-6 rounded-2xl border border-slate-200 shadow-sm flex items-center gap-4">
          <div className="w-12 h-12 rounded-xl bg-emerald-50 text-emerald-600 flex items-center justify-center">
            <CheckCircle2 className="w-6 h-6" />
          </div>
          <div>
            <p className="text-sm font-medium text-slate-500">Fines Collected Today</p>
            <h3 className="text-2xl font-bold text-slate-900">$45.00</h3>
          </div>
        </div>
        <div className="bg-white p-6 rounded-2xl border border-slate-200 shadow-sm flex items-center gap-4">
          <div className="w-12 h-12 rounded-xl bg-amber-50 text-amber-600 flex items-center justify-center">
            <AlertCircle className="w-6 h-6" />
          </div>
          <div>
            <p className="text-sm font-medium text-slate-500">Total Overdue Items</p>
            <h3 className="text-2xl font-bold text-slate-900">142</h3>
          </div>
        </div>
      </div>

      <div className="bg-white p-4 rounded-xl border border-slate-200 shadow-sm flex flex-col lg:flex-row gap-4 items-center justify-between">
        <div className="flex items-center gap-4 w-full lg:w-auto">
          <label className="flex items-center gap-2 cursor-pointer">
            <input type="checkbox" className="w-4 h-4 rounded border-slate-300 text-[#137fec] focus:ring-[#137fec]" defaultChecked />
            <span className="text-sm font-medium text-slate-700">Unpaid Only</span>
          </label>
          <button className="text-sm text-[#137fec] hover:underline font-medium">Clear Filters</button>
        </div>
        <div className="flex gap-3 w-full lg:w-auto overflow-x-auto pb-2 lg:pb-0">
          <div className="relative flex-1 lg:w-64">
            <Search className="w-5 h-5 text-slate-400 absolute left-3 top-1/2 -translate-y-1/2" />
            <input
              type="text"
              placeholder="Search by member or book..."
              className="w-full pl-10 pr-4 py-2.5 bg-white border border-slate-200 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-[#137fec] focus:border-transparent"
            />
          </div>
          <button className="flex items-center gap-2 px-4 py-2.5 bg-white border border-slate-200 text-slate-700 rounded-lg text-sm font-medium hover:bg-slate-50 transition-colors whitespace-nowrap">
            <Download className="w-4 h-4" />
            Export
          </button>
        </div>
      </div>

      <div className="bg-white rounded-xl border border-slate-200 shadow-sm overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full text-left text-sm text-slate-600">
            <thead className="bg-slate-50 text-xs uppercase text-slate-500 border-b border-slate-200">
              <tr>
                <th className="px-6 py-4 font-semibold min-w-[200px]">Member Name</th>
                <th className="px-6 py-4 font-semibold min-w-[200px]">Book Title</th>
                <th className="px-6 py-4 font-semibold text-center">Days Overdue</th>
                <th className="px-6 py-4 font-semibold text-right">Fine Amount</th>
                <th className="px-6 py-4 font-semibold text-center">Status</th>
                <th className="px-6 py-4 font-semibold text-right">Actions</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100">
              {fines.map((fine) => (
                <tr key={fine.id} className="hover:bg-slate-50 transition-colors">
                  <td className="px-6 py-4">
                    <div className="flex items-center gap-3">
                      <img src={fine.avatar} alt={fine.member} className="w-8 h-8 rounded-full object-cover shadow-sm border border-slate-200" referrerPolicy="no-referrer" />
                      <div className="flex flex-col">
                        <span className="text-sm font-semibold text-slate-900">{fine.member}</span>
                        <span className="text-xs text-slate-500">{fine.memberId}</span>
                      </div>
                    </div>
                  </td>
                  <td className="px-6 py-4 font-medium text-slate-900">{fine.book}</td>
                  <td className="px-6 py-4 text-center">
                    <span className={`inline-flex items-center gap-1 font-medium ${fine.daysOverdue > 7 ? 'text-rose-600' : 'text-amber-600'}`}>
                      <Clock className="w-3.5 h-3.5" />
                      {fine.daysOverdue} days
                    </span>
                  </td>
                  <td className="px-6 py-4 text-right font-semibold text-slate-900">
                    ${fine.amount.toFixed(2)}
                  </td>
                  <td className="px-6 py-4 text-center">
                    <span className={`inline-flex items-center rounded-full px-2.5 py-1 text-xs font-medium ring-1 ring-inset ${
                      fine.status === 'Paid' ? 'bg-emerald-50 text-emerald-700 ring-emerald-600/20' :
                      'bg-rose-50 text-rose-700 ring-rose-600/20'
                    }`}>
                      {fine.status}
                    </span>
                  </td>
                  <td className="px-6 py-4 text-right">
                    {fine.status === 'Unpaid' ? (
                      <button 
                        onClick={() => setPayingFine(fine)}
                        className="px-3 py-1.5 bg-[#137fec] text-white text-xs font-semibold rounded-md hover:bg-blue-600 transition-colors shadow-sm"
                      >
                        Collect Payment
                      </button>
                    ) : (
                      <button 
                        onClick={() => setViewingReceipt(fine)}
                        className="px-3 py-1.5 bg-slate-100 text-slate-600 text-xs font-semibold rounded-md hover:bg-slate-200 transition-colors"
                      >
                        View Receipt
                      </button>
                    )}
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
        <div className="flex items-center justify-between border-t border-slate-200 bg-slate-50 px-6 py-3">
          <p className="text-sm text-slate-700">
            Showing <span className="font-medium">1</span> to <span className="font-medium">5</span> of <span className="font-medium">24</span> results
          </p>
          <div className="flex gap-1">
            <button className="p-2 rounded-md border border-slate-300 bg-white text-slate-400 hover:bg-slate-50">
              <ChevronLeft className="w-4 h-4" />
            </button>
            <button className="px-3 py-1 rounded-md bg-[#137fec] text-white text-sm font-semibold">1</button>
            <button className="px-3 py-1 rounded-md border border-slate-300 bg-white text-slate-900 text-sm font-semibold hover:bg-slate-50">2</button>
            <button className="p-2 rounded-md border border-slate-300 bg-white text-slate-400 hover:bg-slate-50">
              <ChevronRight className="w-4 h-4" />
            </button>
          </div>
        </div>
      </div>

      {payingFine && (
        <div className="fixed inset-0 bg-slate-900/50 flex items-center justify-center z-50">
          <div className="bg-white rounded-2xl p-6 max-w-md w-full mx-4 shadow-xl">
            <div className="flex justify-between items-center mb-4">
              <h3 className="text-lg font-bold text-slate-900">Confirm Payment</h3>
              <button onClick={() => setPayingFine(null)} className="text-slate-400 hover:text-slate-600">
                <X className="w-5 h-5" />
              </button>
            </div>
            <div className="space-y-4 mb-6">
              <div className="bg-slate-50 p-4 rounded-xl border border-slate-100">
                <div className="flex justify-between items-center mb-2">
                  <span className="text-sm text-slate-500">Member</span>
                  <span className="text-sm font-semibold text-slate-900">{payingFine.member}</span>
                </div>
                <div className="flex justify-between items-center mb-2">
                  <span className="text-sm text-slate-500">Book</span>
                  <span className="text-sm font-semibold text-slate-900">{payingFine.book}</span>
                </div>
                <div className="flex justify-between items-center pt-2 border-t border-slate-200 mt-2">
                  <span className="text-sm font-semibold text-slate-900">Total Amount</span>
                  <span className="text-lg font-bold text-[#137fec]">${payingFine.amount.toFixed(2)}</span>
                </div>
              </div>
              <p className="text-sm text-slate-600">Please confirm that you have received the payment of ${payingFine.amount.toFixed(2)} from {payingFine.member}.</p>
            </div>
            <div className="flex justify-end gap-3">
              <button onClick={() => setPayingFine(null)} className="px-4 py-2 text-sm font-semibold text-slate-700 hover:bg-slate-100 rounded-lg transition-colors">Cancel</button>
              <button onClick={handlePayment} className="px-4 py-2 text-sm font-semibold text-white bg-[#137fec] hover:bg-blue-600 rounded-lg transition-colors shadow-sm">Confirm Payment</button>
            </div>
          </div>
        </div>
      )}

      {viewingReceipt && (
        <div className="fixed inset-0 bg-slate-900/50 flex items-center justify-center z-50">
          <div className="bg-white rounded-2xl p-6 max-w-md w-full mx-4 shadow-xl">
            <div className="flex justify-between items-center mb-4">
              <h3 className="text-lg font-bold text-slate-900">Payment Receipt</h3>
              <button onClick={() => setViewingReceipt(null)} className="text-slate-400 hover:text-slate-600">
                <X className="w-5 h-5" />
              </button>
            </div>
            <div className="bg-slate-50 p-6 rounded-xl border border-slate-100 mb-6 text-center space-y-4">
              <div className="w-12 h-12 rounded-full bg-emerald-100 text-emerald-600 flex items-center justify-center mx-auto mb-2">
                <CheckCircle2 className="w-6 h-6" />
              </div>
              <h4 className="text-xl font-bold text-slate-900">Payment Successful</h4>
              <p className="text-sm text-slate-500">Receipt #{viewingReceipt.id}</p>
              
              <div className="text-left space-y-2 pt-4 border-t border-slate-200">
                <div className="flex justify-between">
                  <span className="text-sm text-slate-500">Member</span>
                  <span className="text-sm font-medium text-slate-900">{viewingReceipt.member}</span>
                </div>
                <div className="flex justify-between">
                  <span className="text-sm text-slate-500">Book</span>
                  <span className="text-sm font-medium text-slate-900">{viewingReceipt.book}</span>
                </div>
                <div className="flex justify-between">
                  <span className="text-sm text-slate-500">Date Paid</span>
                  <span className="text-sm font-medium text-slate-900">{new Date().toLocaleDateString()}</span>
                </div>
                <div className="flex justify-between pt-2 border-t border-slate-200">
                  <span className="text-sm font-bold text-slate-900">Amount Paid</span>
                  <span className="text-sm font-bold text-slate-900">${viewingReceipt.amount.toFixed(2)}</span>
                </div>
              </div>
            </div>
            <div className="flex justify-end gap-3">
              <button className="px-4 py-2 text-sm font-semibold text-slate-700 hover:bg-slate-100 border border-slate-200 rounded-lg transition-colors flex items-center gap-2">
                <Download className="w-4 h-4" />
                Download PDF
              </button>
              <button onClick={() => setViewingReceipt(null)} className="px-4 py-2 text-sm font-semibold text-white bg-[#137fec] hover:bg-blue-600 rounded-lg transition-colors shadow-sm">Close</button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
