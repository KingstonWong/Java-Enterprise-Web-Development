import React, { useState } from 'react';
import { Link } from 'react-router-dom';

export default function WriteReview() {
  const [rating, setRating] = useState(0);
  const [hoverRating, setHoverRating] = useState(0);

  return (
    <div className="bg-background-light font-display text-gray-800 min-h-screen flex flex-col items-center justify-center p-4 sm:p-8">
      
      <div className="w-full max-w-3xl bg-white rounded-2xl shadow-xl border border-gray-100 overflow-hidden">
        {/* Header */}
        <div className="bg-gradient-to-r from-primary to-blue-600 p-6 text-white flex justify-between items-center">
          <div className="flex items-center gap-2">
            <span className="material-symbols-outlined text-3xl">rate_review</span>
            <h1 className="text-2xl font-bold tracking-tight">Write your review</h1>
          </div>
          <Link to="/book/1" className="text-white/80 hover:text-white transition-colors">
            <span className="material-symbols-outlined">close</span>
          </Link>
        </div>

        <div className="p-8">
          {/* Book Info */}
          <div className="flex flex-col sm:flex-row gap-6 mb-8 pb-8 border-b border-gray-100">
            <div className="w-24 h-36 bg-gray-200 rounded-lg shadow-md overflow-hidden shrink-0">
              <img src="https://images.unsplash.com/photo-1544947950-fa07a98d237f?q=80&w=200&auto=format&fit=crop" alt="Book Cover" className="w-full h-full object-cover" />
            </div>
            <div className="flex flex-col justify-center">
              <h2 className="text-2xl font-bold text-gray-900 mb-1">The Midnight Library</h2>
              <p className="text-gray-600 font-medium mb-3">by Matt Haig</p>
              <div className="flex items-center gap-2 text-sm text-gray-500">
                <span className="material-symbols-outlined text-[16px]">calendar_today</span>
                Borrowed: Oct 01, 2023
              </div>
            </div>
          </div>

          <form className="space-y-8">
            {/* Rating */}
            <div>
              <label className="block text-lg font-bold text-gray-900 mb-2">Overall Rating</label>
              <p className="text-sm text-gray-500 mb-4">Click to rate this book</p>
              <div className="flex gap-2">
                {[1, 2, 3, 4, 5].map((star) => (
                  <button
                    key={star}
                    type="button"
                    className="text-4xl transition-transform hover:scale-110 focus:outline-none"
                    onMouseEnter={() => setHoverRating(star)}
                    onMouseLeave={() => setHoverRating(0)}
                    onClick={() => setRating(star)}
                  >
                    <span className={`material-symbols-outlined ${star <= (hoverRating || rating) ? 'text-yellow-400 fill-current' : 'text-gray-300'}`} style={{ fontVariationSettings: star <= (hoverRating || rating) ? "'FILL' 1" : "'FILL' 0" }}>
                      star
                    </span>
                  </button>
                ))}
              </div>
              {rating > 0 && (
                <p className="text-sm font-medium text-primary mt-2">
                  {['Poor', 'Fair', 'Good', 'Very Good', 'Excellent'][rating - 1]}
                </p>
              )}
            </div>

            {/* Review Title */}
            <div>
              <label htmlFor="title" className="block text-sm font-bold text-gray-900 mb-2">Review Title</label>
              <input 
                type="text" 
                id="title" 
                name="title" 
                placeholder="Summarize your thoughts in a short phrase" 
                className="w-full px-4 py-3 rounded-xl border border-gray-300 focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none transition-all text-gray-800 placeholder-gray-400"
              />
            </div>

            {/* Review Body */}
            <div>
              <label htmlFor="review" className="block text-sm font-bold text-gray-900 mb-2">Your Review</label>
              <p className="text-xs text-gray-500 mb-2">What did you like or dislike? What should other readers know?</p>
              <textarea 
                id="review" 
                name="review" 
                rows={6} 
                placeholder="Write your review here..." 
                className="w-full px-4 py-3 rounded-xl border border-gray-300 focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none transition-all text-gray-800 placeholder-gray-400 resize-y"
              ></textarea>
              <div className="flex justify-between items-center mt-2">
                <span className="text-xs text-gray-400">Minimum 50 characters</span>
                <span className="text-xs text-gray-400">0 / 2000</span>
              </div>
            </div>

            {/* Spoiler Toggle */}
            <div className="flex items-center gap-3 bg-gray-50 p-4 rounded-xl border border-gray-100">
              <div className="relative inline-block w-12 mr-2 align-middle select-none transition duration-200 ease-in">
                <input type="checkbox" name="toggle" id="toggle" className="toggle-checkbox absolute block w-6 h-6 rounded-full bg-white border-4 appearance-none cursor-pointer border-gray-300 checked:right-0 checked:border-primary transition-all duration-200" style={{ right: '24px' }} />
                <label htmlFor="toggle" className="toggle-label block overflow-hidden h-6 rounded-full bg-gray-300 cursor-pointer transition-colors duration-200"></label>
              </div>
              <div>
                <label htmlFor="toggle" className="text-sm font-bold text-gray-900 cursor-pointer">Contains Spoilers</label>
                <p className="text-xs text-gray-500">Hide this review behind a spoiler warning</p>
              </div>
              <style dangerouslySetInnerHTML={{__html: `
                .toggle-checkbox:checked { right: 0; border-color: #137fec; }
                .toggle-checkbox:checked + .toggle-label { background-color: #137fec; }
              `}} />
            </div>

            {/* Form Actions */}
            <div className="flex items-center justify-end gap-4 pt-6 border-t border-gray-100">
              <Link to="/book/1" className="px-6 py-3 text-sm font-bold text-gray-600 hover:text-gray-900 transition-colors">
                Cancel
              </Link>
              <button type="submit" className="px-8 py-3 text-sm font-bold text-white bg-primary rounded-xl hover:bg-primary-dark focus:outline-none focus:ring-4 focus:ring-primary/30 transition-all shadow-lg shadow-primary/30 flex items-center gap-2 disabled:opacity-50 disabled:cursor-not-allowed">
                Submit Review
                <span className="material-symbols-outlined text-sm">send</span>
              </button>
            </div>
          </form>
        </div>
      </div>
      
      <p className="text-sm text-gray-500 mt-6 flex items-center gap-1">
        <span className="material-symbols-outlined text-[16px]">info</span>
        Reviews are public and must follow our community guidelines.
      </p>
    </div>
  );
}
