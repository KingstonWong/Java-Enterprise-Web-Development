import React from 'react';
import { Link } from 'react-router-dom';
import Header from '../components/Header';

export default function DiscoveryHome() {
  return (
    <div className="bg-background-light font-display text-gray-800 min-h-screen">
      <Header />

      {/* Main Content */}
      <main className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        {/* Welcome Section */}
        <div className="mb-10">
          <h1 className="text-3xl font-bold text-gray-900">Welcome back, Alex!</h1>
          <p className="text-gray-600 mt-2">Here's what's happening with your account and some new recommendations.</p>
        </div>

        {/* Quick Stats Grid */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-12">
          {/* Stat Card 1 */}
          <div className="bg-white rounded-2xl p-6 shadow-sm border border-gray-100 flex items-center gap-4 hover:shadow-md transition-shadow cursor-pointer">
            <div className="w-12 h-12 rounded-full bg-blue-50 text-primary flex items-center justify-center shrink-0">
              <span className="material-symbols-outlined text-2xl">menu_book</span>
            </div>
            <div>
              <p className="text-sm font-medium text-gray-500">Current Loans</p>
              <p className="text-2xl font-bold text-gray-900">4 <span className="text-sm font-normal text-gray-500">/ 10 max</span></p>
            </div>
          </div>

          {/* Stat Card 2 */}
          <div className="bg-white rounded-2xl p-6 shadow-sm border border-gray-100 flex items-center gap-4 hover:shadow-md transition-shadow cursor-pointer">
            <div className="w-12 h-12 rounded-full bg-orange-50 text-orange-600 flex items-center justify-center shrink-0">
              <span className="material-symbols-outlined text-2xl">hourglass_empty</span>
            </div>
            <div>
              <p className="text-sm font-medium text-gray-500">Pending Holds</p>
              <p className="text-2xl font-bold text-gray-900">3</p>
            </div>
          </div>

          {/* Stat Card 3 */}
          <div className="bg-white rounded-2xl p-6 shadow-sm border border-gray-100 flex items-center gap-4 hover:shadow-md transition-shadow cursor-pointer">
            <div className="w-12 h-12 rounded-full bg-red-50 text-red-600 flex items-center justify-center shrink-0">
              <span className="material-symbols-outlined text-2xl">warning</span>
            </div>
            <div>
              <p className="text-sm font-medium text-gray-500">Overdue Items</p>
              <p className="text-2xl font-bold text-red-600">1</p>
            </div>
          </div>

          {/* Stat Card 4 */}
          <div className="bg-white rounded-2xl p-6 shadow-sm border border-gray-100 flex items-center gap-4 hover:shadow-md transition-shadow cursor-pointer">
            <div className="w-12 h-12 rounded-full bg-green-50 text-green-600 flex items-center justify-center shrink-0">
              <span className="material-symbols-outlined text-2xl">payments</span>
            </div>
            <div>
              <p className="text-sm font-medium text-gray-500">Fines Balance</p>
              <p className="text-2xl font-bold text-gray-900">$2.50</p>
            </div>
          </div>
        </div>

        {/* Recommended for You */}
        <section className="mb-12">
          <div className="flex justify-between items-end mb-6">
            <div>
              <h2 className="text-2xl font-bold text-gray-900 flex items-center gap-2">
                <span className="material-symbols-outlined text-primary">auto_awesome</span>
                Recommended for You
              </h2>
              <p className="text-gray-600 text-sm mt-1">Based on your recent borrowing history</p>
            </div>
            <a href="#" className="text-primary hover:text-primary-dark font-medium text-sm flex items-center gap-1">
              View all <span className="material-symbols-outlined text-sm">arrow_forward</span>
            </a>
          </div>

          <div className="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-5 gap-6">
            {/* Book Card 1 */}
            <Link to="/book/1" className="group cursor-pointer block">
              <div className="relative aspect-[2/3] rounded-xl overflow-hidden shadow-sm mb-3">
                <img src="https://images.unsplash.com/photo-1544947950-fa07a98d237f?q=80&w=300&auto=format&fit=crop" alt="Book Cover" className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300" />
                <div className="absolute inset-0 bg-black/40 opacity-0 group-hover:opacity-100 transition-opacity flex items-center justify-center gap-2">
                  <button className="bg-white text-gray-900 p-2 rounded-full hover:text-primary transition-colors shadow-lg" title="View Details">
                    <span className="material-symbols-outlined text-sm">visibility</span>
                  </button>
                  <button className="bg-primary text-white p-2 rounded-full hover:bg-primary-dark transition-colors shadow-lg" title="Place Hold">
                    <span className="material-symbols-outlined text-sm">bookmark_add</span>
                  </button>
                </div>
              </div>
              <h3 className="font-bold text-gray-900 line-clamp-1 group-hover:text-primary transition-colors">The Midnight Library</h3>
              <p className="text-sm text-gray-500 line-clamp-1">Matt Haig</p>
            </Link>

            {/* Book Card 2 */}
            <Link to="/book/2" className="group cursor-pointer block">
              <div className="relative aspect-[2/3] rounded-xl overflow-hidden shadow-sm mb-3">
                <img src="https://images.unsplash.com/photo-1589829085413-56de8ae18c73?q=80&w=300&auto=format&fit=crop" alt="Book Cover" className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300" />
                <div className="absolute inset-0 bg-black/40 opacity-0 group-hover:opacity-100 transition-opacity flex items-center justify-center gap-2">
                  <button className="bg-white text-gray-900 p-2 rounded-full hover:text-primary transition-colors shadow-lg" title="View Details">
                    <span className="material-symbols-outlined text-sm">visibility</span>
                  </button>
                  <button className="bg-primary text-white p-2 rounded-full hover:bg-primary-dark transition-colors shadow-lg" title="Place Hold">
                    <span className="material-symbols-outlined text-sm">bookmark_add</span>
                  </button>
                </div>
              </div>
              <h3 className="font-bold text-gray-900 line-clamp-1 group-hover:text-primary transition-colors">Atomic Habits</h3>
              <p className="text-sm text-gray-500 line-clamp-1">James Clear</p>
            </Link>

            {/* Book Card 3 */}
            <Link to="/book/3" className="group cursor-pointer block">
              <div className="relative aspect-[2/3] rounded-xl overflow-hidden shadow-sm mb-3 bg-gray-200 flex items-center justify-center">
                <span className="material-symbols-outlined text-4xl text-gray-400">menu_book</span>
                <div className="absolute inset-0 bg-black/40 opacity-0 group-hover:opacity-100 transition-opacity flex items-center justify-center gap-2">
                  <button className="bg-white text-gray-900 p-2 rounded-full hover:text-primary transition-colors shadow-lg" title="View Details">
                    <span className="material-symbols-outlined text-sm">visibility</span>
                  </button>
                  <button className="bg-primary text-white p-2 rounded-full hover:bg-primary-dark transition-colors shadow-lg" title="Place Hold">
                    <span className="material-symbols-outlined text-sm">bookmark_add</span>
                  </button>
                </div>
              </div>
              <h3 className="font-bold text-gray-900 line-clamp-1 group-hover:text-primary transition-colors">Project Hail Mary</h3>
              <p className="text-sm text-gray-500 line-clamp-1">Andy Weir</p>
            </Link>

            {/* Book Card 4 */}
            <Link to="/book/4" className="group cursor-pointer block">
              <div className="relative aspect-[2/3] rounded-xl overflow-hidden shadow-sm mb-3 bg-gray-200 flex items-center justify-center">
                <span className="material-symbols-outlined text-4xl text-gray-400">menu_book</span>
                <div className="absolute inset-0 bg-black/40 opacity-0 group-hover:opacity-100 transition-opacity flex items-center justify-center gap-2">
                  <button className="bg-white text-gray-900 p-2 rounded-full hover:text-primary transition-colors shadow-lg" title="View Details">
                    <span className="material-symbols-outlined text-sm">visibility</span>
                  </button>
                  <button className="bg-primary text-white p-2 rounded-full hover:bg-primary-dark transition-colors shadow-lg" title="Place Hold">
                    <span className="material-symbols-outlined text-sm">bookmark_add</span>
                  </button>
                </div>
              </div>
              <h3 className="font-bold text-gray-900 line-clamp-1 group-hover:text-primary transition-colors">Dune</h3>
              <p className="text-sm text-gray-500 line-clamp-1">Frank Herbert</p>
            </Link>

            {/* Book Card 5 */}
            <Link to="/book/5" className="group cursor-pointer hidden lg:block">
              <div className="relative aspect-[2/3] rounded-xl overflow-hidden shadow-sm mb-3 bg-gray-200 flex items-center justify-center">
                <span className="material-symbols-outlined text-4xl text-gray-400">menu_book</span>
                <div className="absolute inset-0 bg-black/40 opacity-0 group-hover:opacity-100 transition-opacity flex items-center justify-center gap-2">
                  <button className="bg-white text-gray-900 p-2 rounded-full hover:text-primary transition-colors shadow-lg" title="View Details">
                    <span className="material-symbols-outlined text-sm">visibility</span>
                  </button>
                  <button className="bg-primary text-white p-2 rounded-full hover:bg-primary-dark transition-colors shadow-lg" title="Place Hold">
                    <span className="material-symbols-outlined text-sm">bookmark_add</span>
                  </button>
                </div>
              </div>
              <h3 className="font-bold text-gray-900 line-clamp-1 group-hover:text-primary transition-colors">1984</h3>
              <p className="text-sm text-gray-500 line-clamp-1">George Orwell</p>
            </Link>
          </div>
        </section>

        {/* New Arrivals & Upcoming Events */}
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
          {/* New Arrivals List */}
          <div className="lg:col-span-2 bg-white rounded-2xl shadow-sm border border-gray-100 p-6">
            <div className="flex justify-between items-center mb-6">
              <h2 className="text-xl font-bold text-gray-900 flex items-center gap-2">
                <span className="material-symbols-outlined text-primary">new_releases</span>
                New Arrivals
              </h2>
              <a href="#" className="text-primary hover:text-primary-dark font-medium text-sm">View all</a>
            </div>
            
            <div className="space-y-4">
              {/* List Item 1 */}
              <Link to="/book/6" className="flex gap-4 items-center p-3 hover:bg-gray-50 rounded-xl transition-colors cursor-pointer block">
                <div className="w-16 h-24 bg-gray-200 rounded shrink-0 overflow-hidden">
                  <img src="https://images.unsplash.com/photo-1544947950-fa07a98d237f?q=80&w=100&auto=format&fit=crop" alt="Cover" className="w-full h-full object-cover" />
                </div>
                <div className="flex-1">
                  <h3 className="font-bold text-gray-900">The Silent Patient</h3>
                  <p className="text-sm text-gray-500">Alex Michaelides</p>
                  <div className="mt-2 flex items-center gap-2">
                    <span className="inline-flex items-center gap-1 px-2 py-0.5 rounded text-xs font-medium bg-green-50 text-green-700 border border-green-200">
                      Available
                    </span>
                    <span className="text-xs text-gray-400">Added 2 days ago</span>
                  </div>
                </div>
                <button className="p-2 text-gray-400 hover:text-primary transition-colors" onClick={(e) => e.preventDefault()}>
                  <span className="material-symbols-outlined">bookmark_add</span>
                </button>
              </Link>

              {/* List Item 2 */}
              <Link to="/book/7" className="flex gap-4 items-center p-3 hover:bg-gray-50 rounded-xl transition-colors cursor-pointer block">
                <div className="w-16 h-24 bg-gray-200 rounded shrink-0 overflow-hidden flex items-center justify-center">
                  <span className="material-symbols-outlined text-gray-400">menu_book</span>
                </div>
                <div className="flex-1">
                  <h3 className="font-bold text-gray-900">Educated</h3>
                  <p className="text-sm text-gray-500">Tara Westover</p>
                  <div className="mt-2 flex items-center gap-2">
                    <span className="inline-flex items-center gap-1 px-2 py-0.5 rounded text-xs font-medium bg-yellow-50 text-yellow-700 border border-yellow-200">
                      Waitlist
                    </span>
                    <span className="text-xs text-gray-400">Added 5 days ago</span>
                  </div>
                </div>
                <button className="p-2 text-gray-400 hover:text-primary transition-colors" onClick={(e) => e.preventDefault()}>
                  <span className="material-symbols-outlined">bookmark_add</span>
                </button>
              </Link>
            </div>
          </div>

          {/* Upcoming Events */}
          <div className="bg-white rounded-2xl shadow-sm border border-gray-100 p-6">
            <div className="flex justify-between items-center mb-6">
              <h2 className="text-xl font-bold text-gray-900 flex items-center gap-2">
                <span className="material-symbols-outlined text-primary">event</span>
                Upcoming Events
              </h2>
            </div>

            <div className="space-y-4">
              {/* Event 1 */}
              <div className="flex gap-4">
                <div className="flex flex-col items-center justify-center w-14 h-14 rounded-lg bg-blue-50 text-primary shrink-0 border border-blue-100">
                  <span className="text-xs font-bold uppercase">Oct</span>
                  <span className="text-xl font-black leading-none">28</span>
                </div>
                <div>
                  <h3 className="font-bold text-gray-900 text-sm">Author Talk: Matt Haig</h3>
                  <p className="text-xs text-gray-500 mt-1 flex items-center gap-1">
                    <span className="material-symbols-outlined text-[14px]">schedule</span> 6:00 PM
                  </p>
                  <p className="text-xs text-gray-500 flex items-center gap-1 mt-0.5">
                    <span className="material-symbols-outlined text-[14px]">location_on</span> Main Auditorium
                  </p>
                </div>
              </div>

              {/* Event 2 */}
              <div className="flex gap-4">
                <div className="flex flex-col items-center justify-center w-14 h-14 rounded-lg bg-blue-50 text-primary shrink-0 border border-blue-100">
                  <span className="text-xs font-bold uppercase">Nov</span>
                  <span className="text-xl font-black leading-none">02</span>
                </div>
                <div>
                  <h3 className="font-bold text-gray-900 text-sm">Sci-Fi Book Club</h3>
                  <p className="text-xs text-gray-500 mt-1 flex items-center gap-1">
                    <span className="material-symbols-outlined text-[14px]">schedule</span> 7:00 PM
                  </p>
                  <p className="text-xs text-gray-500 flex items-center gap-1 mt-0.5">
                    <span className="material-symbols-outlined text-[14px]">location_on</span> Room 204
                  </p>
                </div>
              </div>
            </div>

            <button className="w-full mt-6 py-2 border border-gray-300 rounded-lg text-sm font-medium text-gray-700 hover:bg-gray-50 transition-colors">
              View Calendar
            </button>
          </div>
        </div>
      </main>
    </div>
  );
}
