import React from 'react';
import { ArrowLeft, Upload } from 'lucide-react';

export function EditBook({ onBack, book }: { onBack: () => void, book?: any }) {
  return (
    <div className="p-8 max-w-4xl mx-auto space-y-6">
      <div className="flex items-center gap-4">
        <button onClick={onBack} className="p-2 text-slate-400 hover:text-slate-600 hover:bg-slate-100 rounded-lg transition-colors">
          <ArrowLeft className="w-5 h-5" />
        </button>
        <div>
          <h1 className="text-2xl font-bold tracking-tight text-slate-900">Edit Book</h1>
          <p className="text-slate-500 text-sm mt-1">Update the details of the book in the inventory.</p>
        </div>
      </div>

      <div className="bg-white rounded-2xl border border-slate-200 shadow-sm p-8">
        <form className="space-y-8">
          <div className="flex flex-col md:flex-row gap-8">
            <div className="w-full md:w-1/3 space-y-4">
              <label className="block text-sm font-semibold text-slate-900">Book Cover</label>
              <div className="border-2 border-dashed border-slate-300 rounded-xl p-8 flex flex-col items-center justify-center text-center hover:bg-slate-50 transition-colors cursor-pointer aspect-[2/3] relative overflow-hidden">
                {book?.cover ? (
                  <img src={book.cover} alt="Cover" className="absolute inset-0 w-full h-full object-cover opacity-30" referrerPolicy="no-referrer" />
                ) : null}
                <div className="relative z-10 flex flex-col items-center">
                  <div className="w-12 h-12 rounded-full bg-blue-50 text-[#137fec] flex items-center justify-center mb-4">
                    <Upload className="w-6 h-6" />
                  </div>
                  <p className="text-sm font-medium text-[#137fec]">Click to upload</p>
                  <p className="text-xs text-slate-500 mt-1">or drag and drop</p>
                </div>
              </div>
            </div>

            <div className="w-full md:w-2/3 space-y-6">
              <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div className="space-y-2">
                  <label className="block text-sm font-semibold text-slate-900">Book Title *</label>
                  <input type="text" defaultValue={book?.title} className="w-full px-4 py-2.5 bg-white border border-slate-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-[#137fec] focus:border-transparent" />
                </div>
                <div className="space-y-2">
                  <label className="block text-sm font-semibold text-slate-900">Author *</label>
                  <input type="text" defaultValue={book?.author} className="w-full px-4 py-2.5 bg-white border border-slate-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-[#137fec] focus:border-transparent" />
                </div>
                <div className="space-y-2">
                  <label className="block text-sm font-semibold text-slate-900">ISBN *</label>
                  <input type="text" defaultValue={book?.isbn} className="w-full px-4 py-2.5 bg-white border border-slate-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-[#137fec] focus:border-transparent" />
                </div>
                <div className="space-y-2">
                  <label className="block text-sm font-semibold text-slate-900">Category *</label>
                  <select defaultValue={book?.category?.toLowerCase().includes('fiction') ? 'fiction' : ''} className="w-full px-4 py-2.5 bg-white border border-slate-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-[#137fec] focus:border-transparent text-slate-700">
                    <option value="">Select category</option>
                    <option value="fiction">Fiction</option>
                    <option value="non-fiction">Non-Fiction</option>
                    <option value="science">Science</option>
                  </select>
                </div>
                <div className="space-y-2">
                  <label className="block text-sm font-semibold text-slate-900">Number of Copies *</label>
                  <input type="number" min="1" defaultValue={book?.copies} className="w-full px-4 py-2.5 bg-white border border-slate-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-[#137fec] focus:border-transparent" />
                </div>
              </div>
            </div>
          </div>

          <div className="flex items-center justify-end gap-3 pt-6 border-t border-slate-200">
            <button type="button" onClick={onBack} className="px-5 py-2.5 text-sm font-semibold text-slate-700 hover:bg-slate-100 rounded-lg transition-colors">
              Cancel
            </button>
            <button type="button" onClick={onBack} className="px-5 py-2.5 text-sm font-semibold text-white bg-[#137fec] hover:bg-blue-600 rounded-lg transition-colors shadow-sm">
              Save Changes
            </button>
          </div>
        </form>
      </div>
    </div>
  );
}
