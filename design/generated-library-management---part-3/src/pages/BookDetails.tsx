import React from 'react';
import { Link } from 'react-router-dom';
import Header from '../components/Header';

export default function BookDetails() {
  return (
    <div className="bg-background-light font-display text-gray-800 min-h-screen">
      <Header />

      {/* Main Content */}
      <main className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        {/* Breadcrumb */}
        <nav className="flex text-sm text-gray-500 mb-6" aria-label="Breadcrumb">
          <ol className="inline-flex items-center space-x-1 md:space-x-3">
            <li className="inline-flex items-center">
              <a href="#" className="inline-flex items-center hover:text-primary transition-colors">
                <span className="material-symbols-outlined text-sm mr-1">home</span>
                Catalog
              </a>
            </li>
            <li>
              <div className="flex items-center">
                <span className="material-symbols-outlined text-sm mx-1">chevron_right</span>
                <a href="#" className="hover:text-primary transition-colors">Fiction</a>
              </div>
            </li>
            <li aria-current="page">
              <div className="flex items-center">
                <span className="material-symbols-outlined text-sm mx-1">chevron_right</span>
                <span className="text-gray-800 font-medium">The Midnight Library</span>
              </div>
            </li>
          </ol>
        </nav>

        <div className="bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden">
          <div className="flex flex-col md:flex-row">
            {/* Book Cover & Quick Actions */}
            <div className="w-full md:w-1/3 lg:w-1/4 p-8 bg-gray-50 flex flex-col items-center border-r border-gray-100">
              <div className="relative w-48 h-72 rounded-lg shadow-lg overflow-hidden mb-6 group">
                <img src="https://images.unsplash.com/photo-1544947950-fa07a98d237f?q=80&w=400&auto=format&fit=crop" alt="The Midnight Library Cover" className="w-full h-full object-cover transition-transform duration-300 group-hover:scale-105" />
                <div className="absolute inset-0 bg-black/40 opacity-0 group-hover:opacity-100 transition-opacity flex items-center justify-center">
                  <button className="bg-white text-gray-900 rounded-full p-3 shadow-lg hover:text-primary transition-colors">
                    <span className="material-symbols-outlined">zoom_in</span>
                  </button>
                </div>
              </div>

              <div className="w-full space-y-3">
                <button className="w-full py-3 px-4 bg-primary text-white font-semibold rounded-xl hover:bg-primary-dark transition-colors flex items-center justify-center gap-2 shadow-sm">
                  <span className="material-symbols-outlined">bookmark_add</span>
                  Place Hold
                </button>
                <button className="w-full py-3 px-4 bg-white text-gray-700 font-semibold rounded-xl border border-gray-300 hover:bg-gray-50 transition-colors flex items-center justify-center gap-2 shadow-sm">
                  <span className="material-symbols-outlined text-red-500">favorite</span>
                  Add to Wishlist
                </button>
              </div>

              <div className="w-full mt-6 pt-6 border-t border-gray-200">
                <h4 className="text-sm font-bold text-gray-900 mb-3 uppercase tracking-wider">Availability</h4>
                <div className="space-y-2">
                  <div className="flex justify-between items-center text-sm">
                    <span className="text-gray-600">Central Library</span>
                    <span className="inline-flex items-center gap-1 text-green-700 bg-green-50 px-2 py-0.5 rounded font-medium border border-green-200">
                      <span className="material-symbols-outlined text-[14px]">check_circle</span>
                      2 Available
                    </span>
                  </div>
                  <div className="flex justify-between items-center text-sm">
                    <span className="text-gray-600">Northside Branch</span>
                    <span className="inline-flex items-center gap-1 text-red-700 bg-red-50 px-2 py-0.5 rounded font-medium border border-red-200">
                      <span className="material-symbols-outlined text-[14px]">cancel</span>
                      0 Available
                    </span>
                  </div>
                  <div className="flex justify-between items-center text-sm">
                    <span className="text-gray-600">West End Branch</span>
                    <span className="inline-flex items-center gap-1 text-yellow-700 bg-yellow-50 px-2 py-0.5 rounded font-medium border border-yellow-200">
                      <span className="material-symbols-outlined text-[14px]">schedule</span>
                      Due Oct 28
                    </span>
                  </div>
                </div>
              </div>
            </div>

            {/* Book Details */}
            <div className="w-full md:w-2/3 lg:w-3/4 p-8 lg:p-10">
              <div className="flex flex-col sm:flex-row sm:items-start justify-between gap-4 mb-2">
                <h1 className="text-3xl lg:text-4xl font-black text-gray-900 leading-tight">The Midnight Library</h1>
                <div className="flex items-center gap-1 bg-gray-100 px-3 py-1.5 rounded-lg shrink-0">
                  <span className="material-symbols-outlined text-yellow-500 text-lg">star</span>
                  <span className="font-bold text-gray-900">4.8</span>
                  <span className="text-gray-500 text-sm">(12.4k reviews)</span>
                </div>
              </div>
              
              <h2 className="text-xl text-gray-600 font-medium mb-6">by <a href="#" className="text-primary hover:underline">Matt Haig</a></h2>

              <div className="flex flex-wrap gap-2 mb-8">
                <span className="px-3 py-1 bg-gray-100 text-gray-700 rounded-full text-sm font-medium">Fiction</span>
                <span className="px-3 py-1 bg-gray-100 text-gray-700 rounded-full text-sm font-medium">Fantasy</span>
                <span className="px-3 py-1 bg-gray-100 text-gray-700 rounded-full text-sm font-medium">Contemporary</span>
                <span className="px-3 py-1 bg-gray-100 text-gray-700 rounded-full text-sm font-medium">Magical Realism</span>
              </div>

              <div className="prose prose-gray max-w-none mb-8">
                <h3 className="text-lg font-bold text-gray-900 mb-3">Synopsis</h3>
                <p className="text-gray-700 leading-relaxed mb-4">
                  Between life and death there is a library, and within that library, the shelves go on forever. Every book provides a chance to try another life you could have lived. To see how things would be if you had made other choices... Would you have done anything different, if you had the chance to undo your regrets?
                </p>
                <p className="text-gray-700 leading-relaxed">
                  A dazzling novel about all the choices that go into a life well lived, from the internationally bestselling author of Reasons to Stay Alive and How To Stop Time.
                </p>
              </div>

              <div className="grid grid-cols-2 md:grid-cols-4 gap-6 py-6 border-y border-gray-100 mb-8">
                <div>
                  <span className="block text-xs text-gray-500 uppercase tracking-wider mb-1">Publisher</span>
                  <span className="font-medium text-gray-900">Viking</span>
                </div>
                <div>
                  <span className="block text-xs text-gray-500 uppercase tracking-wider mb-1">Publication Date</span>
                  <span className="font-medium text-gray-900">Aug 13, 2020</span>
                </div>
                <div>
                  <span className="block text-xs text-gray-500 uppercase tracking-wider mb-1">Pages</span>
                  <span className="font-medium text-gray-900">304</span>
                </div>
                <div>
                  <span className="block text-xs text-gray-500 uppercase tracking-wider mb-1">ISBN</span>
                  <span className="font-medium text-gray-900 font-mono text-sm">9780525559474</span>
                </div>
              </div>

              {/* Reviews Section */}
              <div>
                <div className="flex items-center justify-between mb-6">
                  <h3 className="text-xl font-bold text-gray-900">Member Reviews</h3>
                  <Link to="/review/1" className="text-primary font-medium hover:underline text-sm">Write a Review</Link>
                </div>

                <div className="space-y-6">
                  {/* Review 1 */}
                  <div className="bg-gray-50 rounded-xl p-5">
                    <div className="flex justify-between items-start mb-3">
                      <div className="flex items-center gap-3">
                        <div className="w-10 h-10 rounded-full bg-primary/10 text-primary flex items-center justify-center font-bold">
                          SJ
                        </div>
                        <div>
                          <h4 className="font-bold text-gray-900 text-sm">Sarah Jenkins</h4>
                          <span className="text-xs text-gray-500">October 12, 2023</span>
                        </div>
                      </div>
                      <div className="flex text-yellow-500">
                        <span className="material-symbols-outlined text-sm">star</span>
                        <span className="material-symbols-outlined text-sm">star</span>
                        <span className="material-symbols-outlined text-sm">star</span>
                        <span className="material-symbols-outlined text-sm">star</span>
                        <span className="material-symbols-outlined text-sm">star</span>
                      </div>
                    </div>
                    <p className="text-gray-700 text-sm leading-relaxed">
                      Absolutely loved this book! It really makes you think about the choices you've made in life and how every little decision can lead to a completely different path. Highly recommend!
                    </p>
                  </div>

                  {/* Review 2 */}
                  <div className="bg-gray-50 rounded-xl p-5">
                    <div className="flex justify-between items-start mb-3">
                      <div className="flex items-center gap-3">
                        <div className="w-10 h-10 rounded-full bg-purple-100 text-purple-700 flex items-center justify-center font-bold">
                          MR
                        </div>
                        <div>
                          <h4 className="font-bold text-gray-900 text-sm">Michael Ross</h4>
                          <span className="text-xs text-gray-500">September 28, 2023</span>
                        </div>
                      </div>
                      <div className="flex text-yellow-500">
                        <span className="material-symbols-outlined text-sm">star</span>
                        <span className="material-symbols-outlined text-sm">star</span>
                        <span className="material-symbols-outlined text-sm">star</span>
                        <span className="material-symbols-outlined text-sm">star</span>
                        <span className="material-symbols-outlined text-gray-300 text-sm">star</span>
                      </div>
                    </div>
                    <p className="text-gray-700 text-sm leading-relaxed">
                      A beautiful concept executed well. The middle dragged a tiny bit for me, but the ending was perfect. A very comforting read.
                    </p>
                  </div>
                </div>
                
                <button className="w-full mt-4 py-2 text-sm font-medium text-gray-600 hover:text-primary transition-colors">
                  View all 12,403 reviews
                </button>
              </div>

            </div>
          </div>
        </div>
      </main>
    </div>
  );
}
