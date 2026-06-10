import React from 'react';
import { Search, Bell, MessageSquare } from 'lucide-react';

export function Header() {
  return (
    <header className="h-16 bg-white border-b border-slate-200 flex items-center justify-between px-8 sticky top-0 z-10">
      <div className="flex-1 max-w-xl">
        <div className="relative">
          <Search className="w-5 h-5 text-slate-400 absolute left-3 top-1/2 -translate-y-1/2" />
          <input
            type="text"
            placeholder="Search books, members, or ISBN..."
            className="w-full pl-10 pr-4 py-2 bg-slate-50 border border-slate-200 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-[#137fec] focus:border-transparent transition-all"
          />
        </div>
      </div>

      <div className="flex items-center gap-6 ml-4">
        <button className="relative p-2 text-slate-400 hover:text-slate-600 transition-colors">
          <Bell className="w-5 h-5" />
          <span className="absolute top-1.5 right-1.5 w-2 h-2 bg-red-500 rounded-full border-2 border-white"></span>
        </button>
        <button className="relative p-2 text-slate-400 hover:text-slate-600 transition-colors">
          <MessageSquare className="w-5 h-5" />
        </button>
        
        <div className="h-8 w-px bg-slate-200"></div>

        <div className="flex items-center gap-3 cursor-pointer">
          <img
            src="https://i.pravatar.cc/150?u=admin"
            alt="Admin"
            className="w-8 h-8 rounded-full border border-slate-200"
            referrerPolicy="no-referrer"
          />
          <div className="hidden md:block text-sm">
            <p className="font-medium text-slate-700">Sarah Jenkins</p>
            <p className="text-xs text-slate-500">Head Librarian</p>
          </div>
        </div>
      </div>
    </header>
  );
}
