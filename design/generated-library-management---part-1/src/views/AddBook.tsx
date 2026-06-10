import React from 'react';
import { ArrowLeft, Upload, BookOpen } from 'lucide-react';

export function AddBook({ onBack }: { onBack: () => void }) {
  return (
    <div className="p-8 max-w-4xl mx-auto space-y-6">
      <div className="flex items-center gap-4">
        <button onClick={onBack} className="p-2 text-slate-400 hover:text-slate-600 hover:bg-slate-100 rounded-lg transition-colors">
          <ArrowLeft className="w-5 h-5" />
        </button>
        <div>
          <h1 className="text-2xl font-bold tracking-tight text-slate-900">Add New Book</h1>
          <p className="text-slate-500 text-sm mt-1">Enter the details of the new book to add to inventory.</p>
        </div>
      </div>

      <div className="bg-white rounded-2xl border border-slate-200 shadow-sm p-8">
        <form className="space-y-8">
          <div className="flex flex-col md:flex-row gap-8">
            <div className="w-full md:w-1/3 space-y-4">
              <label className="block text-sm font-semibold text-slate-900">Book Cover</label>
              <div className="border-2 border-dashed border-slate-300 rounded-xl p-8 flex flex-col items-center justify-center text-center hover:bg-slate-50 transition-colors cursor-pointer aspect-[2/3]">
                <div className="w-12 h-12 rounded-full bg-blue-50 text-[#137fec] flex items-center justify-center mb-4">
                  <Upload className="w-6 h-6" />
                </div>
                <p className="text-sm font-medium text-[#137fec]">Click to upload</p>
                <p className="text-xs text-slate-500 mt-1">or drag and drop</p>
                <p className="text-xs text-slate-400 mt-4">PNG, JPG up to 5MB</p>
              </div>
            </div>

            <div className="w-full md:w-2/3 space-y-6">
              <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div className="space-y-2">
                  <label className="block text-sm font-semibold text-slate-900">Book Title *</label>
                  <input type="text" className="w-full px-4 py-2.5 bg-white border border-slate-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-[#137fec] focus:border-transparent" placeholder="Enter book title" />
                </div>
                <div className="space-y-2">
                  <label className="block text-sm font-semibold text-slate-900">Author *</label>
                  <input type="text" className="w-full px-4 py-2.5 bg-white border border-slate-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-[#137fec] focus:border-transparent" placeholder="Enter author name" />
                </div>
                <div className="space-y-2">
                  <label className="block text-sm font-semibold text-slate-900">ISBN *</label>
                  <input type="text" className="w-full px-4 py-2.5 bg-white border border-slate-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-[#137fec] focus:border-transparent" placeholder="e.g. 978-0-123456-47-2" />
                </div>
                <div className="space-y-2">
                  <label className="block text-sm font-semibold text-slate-900">Publisher</label>
                  <input type="text" className="w-full px-4 py-2.5 bg-white border border-slate-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-[#137fec] focus:border-transparent" placeholder="Enter publisher" />
                </div>
                <div className="space-y-2">
                  <label className="block text-sm font-semibold text-slate-900">Publication Date</label>
                  <input type="date" className="w-full px-4 py-2.5 bg-white border border-slate-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-[#137fec] focus:border-transparent text-slate-500" />
                </div>
                <div className="space-y-2">
                  <label className="block text-sm font-semibold text-slate-900">Category *</label>
                  <select className="w-full px-4 py-2.5 bg-white border border-slate-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-[#137fec] focus:border-transparent text-slate-700">
                    <option value="">Select category</option>
                    <option value="fiction">Fiction</option>
                    <option value="non-fiction">Non-Fiction</option>
                    <option value="science">Science</option>
                  </select>
                </div>
                <div className="space-y-2">
                  <label className="block text-sm font-semibold text-slate-900">Language</label>
                  <select className="w-full px-4 py-2.5 bg-white border border-slate-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-[#137fec] focus:border-transparent text-slate-700">
                    <option value="english">English</option>
                    <option value="spanish">Spanish</option>
                    <option value="french">French</option>
                  </select>
                </div>
                <div className="space-y-2">
                  <label className="block text-sm font-semibold text-slate-900">Number of Copies *</label>
                  <input type="number" min="1" className="w-full px-4 py-2.5 bg-white border border-slate-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-[#137fec] focus:border-transparent" placeholder="1" />
                </div>
                <div className="space-y-2 md:col-span-2">
                  <label className="block text-sm font-semibold text-slate-900">Shelf Location</label>
                  <input type="text" className="w-full px-4 py-2.5 bg-white border border-slate-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-[#137fec] focus:border-transparent" placeholder="e.g. A-12-3" />
                </div>
                <div className="space-y-2 md:col-span-2">
                  <label className="block text-sm font-semibold text-slate-900">Description</label>
                  <textarea rows={4} className="w-full px-4 py-2.5 bg-white border border-slate-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-[#137fec] focus:border-transparent resize-none" placeholder="Enter book description..."></textarea>
                </div>
              </div>
            </div>
          </div>

          <div className="flex items-center justify-end gap-3 pt-6 border-t border-slate-200">
            <button type="button" onClick={onBack} className="px-5 py-2.5 text-sm font-semibold text-slate-700 hover:bg-slate-100 rounded-lg transition-colors">
              Cancel
            </button>
            <button type="button" className="px-5 py-2.5 text-sm font-semibold text-white bg-[#137fec] hover:bg-blue-600 rounded-lg transition-colors shadow-sm">
              Save Book
            </button>
          </div>
        </form>
      </div>
    </div>
  );
}
