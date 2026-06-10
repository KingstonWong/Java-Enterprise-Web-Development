import React, { useState, useRef, useEffect } from 'react';
import { Link } from 'react-router-dom';

export default function Header() {
  const [isDropdownOpen, setIsDropdownOpen] = useState(false);
  const dropdownRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    function handleClickOutside(event: MouseEvent) {
      if (dropdownRef.current && !dropdownRef.current.contains(event.target as Node)) {
        setIsDropdownOpen(false);
      }
    }
    document.addEventListener("mousedown", handleClickOutside);
    return () => document.removeEventListener("mousedown", handleClickOutside);
  }, []);

  return (
    <header className="bg-white shadow-sm sticky top-0 z-50">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex justify-between items-center h-16">
          <Link to="/" className="flex items-center gap-2">
            <span className="material-symbols-outlined text-primary text-3xl">menu_book</span>
            <span className="text-xl font-bold text-gray-900">Library Portal</span>
          </Link>
          <div className="flex-1 max-w-2xl mx-8 hidden md:block">
            <div className="relative">
              <span className="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-gray-400">search</span>
              <input type="text" placeholder="Search books, authors, ISBN..." className="w-full pl-10 pr-4 py-2 bg-gray-100 border-transparent rounded-full focus:bg-white focus:border-primary focus:ring-2 focus:ring-primary/20 outline-none transition-all" />
            </div>
          </div>
          <div className="flex items-center gap-4">
            <div className="relative">
              <span className="material-symbols-outlined text-gray-500 hover:text-primary cursor-pointer transition-colors">notifications</span>
              <span className="absolute -top-1 -right-1 bg-red-500 text-white text-[10px] font-bold px-1.5 py-0.5 rounded-full">3</span>
            </div>
            <div className="relative" ref={dropdownRef}>
              <div 
                className="flex items-center gap-2 cursor-pointer group"
                onClick={() => setIsDropdownOpen(!isDropdownOpen)}
              >
                <img src="https://ui-avatars.com/api/?name=Alex+Johnson&background=137fec&color=fff" alt="Profile" className="w-8 h-8 rounded-full border-2 border-transparent group-hover:border-primary transition-colors" />
                <span className="text-sm font-medium text-gray-700 group-hover:text-primary transition-colors hidden sm:block">Alex J.</span>
                <span className="material-symbols-outlined text-gray-400 group-hover:text-primary transition-colors">expand_more</span>
              </div>
              
              {isDropdownOpen && (
                <div className="absolute right-0 mt-2 w-48 bg-white rounded-xl shadow-lg border border-gray-100 py-1 z-50">
                  <Link to="/profile" className="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-50 hover:text-primary" onClick={() => setIsDropdownOpen(false)}>
                    Profile
                  </Link>
                  <Link to="/borrowing/dashboard" className="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-50 hover:text-primary" onClick={() => setIsDropdownOpen(false)}>
                    Borrowing Dashboard
                  </Link>
                  <Link to="/profile/password" className="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-50 hover:text-primary" onClick={() => setIsDropdownOpen(false)}>
                    Change Password
                  </Link>
                  <div className="border-t border-gray-100 my-1"></div>
                  <button className="block w-full text-left px-4 py-2 text-sm text-red-600 hover:bg-red-50" onClick={() => setIsDropdownOpen(false)}>
                    Sign Out
                  </button>
                </div>
              )}
            </div>
          </div>
        </div>
      </div>
    </header>
  );
}
