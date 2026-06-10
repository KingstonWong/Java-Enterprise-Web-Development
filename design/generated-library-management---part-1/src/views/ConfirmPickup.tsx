import React from 'react';
import { ArrowLeft, CheckCircle, Calendar, User, BookOpen } from 'lucide-react';

export function ConfirmPickup({ request, onBack }: { request: any, onBack: () => void }) {
  return (
    <div className="p-8 max-w-3xl mx-auto space-y-6">
      <div className="flex items-center gap-4">
        <button onClick={onBack} className="p-2 text-slate-400 hover:text-slate-600 hover:bg-slate-100 rounded-lg transition-colors">
          <ArrowLeft className="w-5 h-5" />
        </button>
        <div>
          <h1 className="text-2xl font-bold tracking-tight text-slate-900">Confirm Pickup</h1>
          <p className="text-slate-500 text-sm mt-1">Verify member details and confirm the book handover.</p>
        </div>
      </div>

      <div className="bg-white rounded-2xl border border-slate-200 shadow-sm overflow-hidden">
        <div className="p-6 border-b border-slate-200 bg-slate-50/50">
          <div className="flex items-center justify-between">
            <div className="flex items-center gap-3">
              <div className="w-10 h-10 rounded-full bg-blue-100 text-[#137fec] flex items-center justify-center">
                <BookOpen className="w-5 h-5" />
              </div>
              <div>
                <p className="text-sm font-medium text-slate-500">Request ID</p>
                <p className="text-lg font-bold text-slate-900">{request.id}</p>
              </div>
            </div>
            <span className="inline-flex items-center rounded-full px-3 py-1 text-sm font-medium bg-emerald-100 text-emerald-700">
              Ready for Pickup
            </span>
          </div>
        </div>

        <div className="p-6 space-y-8">
          <div className="flex flex-col md:flex-row gap-8">
            <div className="flex-1 space-y-4">
              <h3 className="text-sm font-semibold text-slate-900 uppercase tracking-wider flex items-center gap-2">
                <User className="w-4 h-4 text-slate-400" />
                Member Details
              </h3>
              <div className="flex items-center gap-4 p-4 rounded-xl border border-slate-100 bg-slate-50">
                <img src={request.avatar} alt={request.member} className="w-12 h-12 rounded-full object-cover shadow-sm" referrerPolicy="no-referrer" />
                <div>
                  <p className="font-bold text-slate-900">{request.member}</p>
                  <p className="text-sm text-slate-500">Member ID: {request.memberId || 'MEM-2023-0842'}</p>
                </div>
              </div>
            </div>

            <div className="flex-1 space-y-4">
              <h3 className="text-sm font-semibold text-slate-900 uppercase tracking-wider flex items-center gap-2">
                <BookOpen className="w-4 h-4 text-slate-400" />
                Book Details
              </h3>
              <div className="flex items-start gap-4 p-4 rounded-xl border border-slate-100 bg-slate-50">
                <img src={request.cover} alt={request.book} className="w-12 h-16 rounded object-cover shadow-sm" referrerPolicy="no-referrer" />
                <div>
                  <p className="font-bold text-slate-900">{request.book}</p>
                  <p className="text-sm text-slate-500">{request.author || 'Author Name'}</p>
                  <p className="text-xs text-slate-400 font-mono mt-1">ISBN: {request.isbn || '978-0000000000'}</p>
                </div>
              </div>
            </div>
          </div>

          <div className="border-t border-slate-200 pt-6">
            <div className="bg-blue-50 border border-blue-100 rounded-xl p-4 flex items-start gap-3">
              <CheckCircle className="w-5 h-5 text-[#137fec] shrink-0 mt-0.5" />
              <div>
                <p className="text-sm font-semibold text-slate-900">Pickup Instructions</p>
                <p className="text-sm text-slate-600 mt-1">Please verify the member's identity using their library card or a valid ID before handing over the book. The loan period will start immediately upon confirmation.</p>
              </div>
            </div>
          </div>
        </div>

        <div className="p-6 border-t border-slate-200 bg-slate-50 flex items-center justify-end gap-3">
          <button onClick={onBack} className="px-5 py-2.5 text-sm font-semibold text-slate-700 hover:bg-slate-200 bg-white border border-slate-300 rounded-lg transition-colors">
            Cancel
          </button>
          <button onClick={onBack} className="px-5 py-2.5 text-sm font-semibold text-white bg-[#137fec] hover:bg-blue-600 rounded-lg transition-colors shadow-sm flex items-center gap-2">
            <CheckCircle className="w-4 h-4" />
            Confirm Handover
          </button>
        </div>
      </div>
    </div>
  );
}
