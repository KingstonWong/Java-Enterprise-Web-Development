import React, { useState } from 'react';
import { Plus, Search, ChevronDown, Edit2, Trash2, ChevronLeft, ChevronRight } from 'lucide-react';
import { AddBook } from './AddBook';
import { EditBook } from './EditBook';

const books = [
  {
    id: 1,
    title: 'The Great Gatsby',
    author: 'F. Scott Fitzgerald',
    isbn: '978-0743273565',
    category: 'Classic Fiction',
    copies: 12,
    status: 'Available',
    cover: 'https://picsum.photos/seed/gatsby/100/150'
  },
  {
    id: 2,
    title: '1984',
    author: 'George Orwell',
    isbn: '978-0451524935',
    category: 'Dystopian',
    copies: 3,
    status: 'Low Stock',
    cover: 'https://picsum.photos/seed/1984/100/150'
  },
  {
    id: 3,
    title: 'To Kill a Mockingbird',
    author: 'Harper Lee',
    isbn: '978-0061120084',
    category: 'Classic Fiction',
    copies: 15,
    status: 'Available',
    cover: 'https://picsum.photos/seed/mockingbird/100/150'
  },
  {
    id: 4,
    title: 'The Hobbit',
    author: 'J.R.R. Tolkien',
    isbn: '978-0547928227',
    category: 'Fantasy',
    copies: 0,
    status: 'Out of Stock',
    cover: 'https://picsum.photos/seed/hobbit/100/150'
  },
  {
    id: 5,
    title: 'Becoming',
    author: 'Michelle Obama',
    isbn: '978-1524763138',
    category: 'Biography',
    copies: 20,
    status: 'Available',
    cover: 'https://picsum.photos/seed/becoming/100/150'
  }
];

export function Inventory() {
  const [isAddingBook, setIsAddingBook] = useState(false);
  const [editingBook, setEditingBook] = useState<any>(null);
  const [deletingBook, setDeletingBook] = useState<any>(null);

  if (isAddingBook) {
    return <AddBook onBack={() => setIsAddingBook(false)} />;
  }

  if (editingBook) {
    return <EditBook book={editingBook} onBack={() => setEditingBook(null)} />;
  }

  return (
    <div className="p-8 max-w-7xl mx-auto space-y-6">
      <div className="flex flex-col md:flex-row md:items-center justify-between gap-4">
        <div>
          <h1 className="text-3xl font-bold tracking-tight text-slate-900">Inventory Management</h1>
          <p className="text-slate-500 mt-1">Manage the library catalog, add new books, and update stock levels.</p>
        </div>
        <button 
          onClick={() => setIsAddingBook(true)}
          className="flex items-center gap-2 bg-[#137fec] hover:bg-blue-600 text-white px-5 py-2.5 rounded-lg font-semibold transition-colors shadow-sm"
        >
          <Plus className="w-5 h-5" />
          Add New Book
        </button>
      </div>

      <div className="bg-white p-4 rounded-xl border border-slate-200 shadow-sm flex flex-col lg:flex-row gap-4">
        <div className="relative flex-1">
          <Search className="w-5 h-5 text-slate-400 absolute left-3 top-1/2 -translate-y-1/2" />
          <input
            type="text"
            placeholder="Search by title, author, or ISBN..."
            className="w-full pl-10 pr-4 py-2.5 bg-white border border-slate-200 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-[#137fec] focus:border-transparent"
          />
        </div>
        <div className="flex gap-3 overflow-x-auto pb-2 lg:pb-0">
          <div className="relative min-w-[140px]">
            <select className="w-full appearance-none bg-slate-50 border border-slate-200 text-slate-700 py-2.5 pl-3 pr-10 rounded-lg text-sm font-medium focus:outline-none focus:ring-2 focus:ring-[#137fec]">
              <option>Genre: All</option>
            </select>
            <ChevronDown className="w-4 h-4 text-slate-500 absolute right-3 top-1/2 -translate-y-1/2 pointer-events-none" />
          </div>
          <div className="relative min-w-[140px]">
            <select className="w-full appearance-none bg-slate-50 border border-slate-200 text-slate-700 py-2.5 pl-3 pr-10 rounded-lg text-sm font-medium focus:outline-none focus:ring-2 focus:ring-[#137fec]">
              <option>Language: All</option>
            </select>
            <ChevronDown className="w-4 h-4 text-slate-500 absolute right-3 top-1/2 -translate-y-1/2 pointer-events-none" />
          </div>
          <div className="relative min-w-[150px]">
            <select className="w-full appearance-none bg-slate-50 border border-slate-200 text-slate-700 py-2.5 pl-3 pr-10 rounded-lg text-sm font-medium focus:outline-none focus:ring-2 focus:ring-[#137fec]">
              <option>Availability: All</option>
            </select>
            <ChevronDown className="w-4 h-4 text-slate-500 absolute right-3 top-1/2 -translate-y-1/2 pointer-events-none" />
          </div>
        </div>
      </div>

      <div className="bg-white rounded-xl border border-slate-200 shadow-sm overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full text-left text-sm text-slate-600">
            <thead className="bg-slate-50 text-xs uppercase text-slate-500 border-b border-slate-200">
              <tr>
                <th className="px-6 py-4 font-semibold w-16">Cover</th>
                <th className="px-6 py-4 font-semibold min-w-[200px]">Title / Author</th>
                <th className="px-6 py-4 font-semibold">ISBN</th>
                <th className="px-6 py-4 font-semibold">Category</th>
                <th className="px-6 py-4 font-semibold text-center">Copies</th>
                <th className="px-6 py-4 font-semibold">Status</th>
                <th className="px-6 py-4 font-semibold text-right">Actions</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100">
              {books.map((book) => (
                <tr key={book.id} className="hover:bg-slate-50 transition-colors">
                  <td className="px-6 py-4">
                    <img src={book.cover} alt={book.title} className="w-8 h-12 rounded object-cover shadow-sm" referrerPolicy="no-referrer" />
                  </td>
                  <td className="px-6 py-4">
                    <div className="flex flex-col">
                      <span className="text-sm font-semibold text-slate-900">{book.title}</span>
                      <span className="text-xs text-slate-500">{book.author}</span>
                    </div>
                  </td>
                  <td className="px-6 py-4 font-mono text-xs text-slate-500">{book.isbn}</td>
                  <td className="px-6 py-4">
                    <span className="inline-flex items-center rounded-md bg-slate-100 px-2 py-1 text-xs font-medium text-slate-600 ring-1 ring-inset ring-slate-500/10">
                      {book.category}
                    </span>
                  </td>
                  <td className="px-6 py-4 text-center font-medium text-slate-900">{book.copies}</td>
                  <td className="px-6 py-4">
                    <span className={`inline-flex items-center rounded-full px-2 py-1 text-xs font-medium ring-1 ring-inset ${
                      book.status === 'Available' ? 'bg-emerald-50 text-emerald-700 ring-emerald-600/20' :
                      book.status === 'Low Stock' ? 'bg-amber-50 text-amber-700 ring-amber-600/20' :
                      'bg-rose-50 text-rose-700 ring-rose-600/20'
                    }`}>
                      {book.status}
                    </span>
                  </td>
                  <td className="px-6 py-4 text-right">
                    <div className="flex items-center justify-end gap-2">
                      <button 
                        onClick={() => setEditingBook(book)}
                        className="p-1 text-slate-400 hover:text-[#137fec] hover:bg-blue-50 rounded transition-colors"
                      >
                        <Edit2 className="w-5 h-5" />
                      </button>
                      <button 
                        onClick={() => setDeletingBook(book)}
                        className="p-1 text-slate-400 hover:text-red-600 hover:bg-red-50 rounded transition-colors"
                      >
                        <Trash2 className="w-5 h-5" />
                      </button>
                    </div>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
        <div className="flex items-center justify-between border-t border-slate-200 bg-slate-50 px-6 py-3">
          <p className="text-sm text-slate-700">
            Showing <span className="font-medium">1</span> to <span className="font-medium">5</span> of <span className="font-medium">97</span> results
          </p>
          <div className="flex gap-1">
            <button className="p-2 rounded-md border border-slate-300 bg-white text-slate-400 hover:bg-slate-50">
              <ChevronLeft className="w-4 h-4" />
            </button>
            <button className="px-3 py-1 rounded-md bg-[#137fec] text-white text-sm font-semibold">1</button>
            <button className="px-3 py-1 rounded-md border border-slate-300 bg-white text-slate-900 text-sm font-semibold hover:bg-slate-50">2</button>
            <button className="px-3 py-1 rounded-md border border-slate-300 bg-white text-slate-900 text-sm font-semibold hover:bg-slate-50">3</button>
            <span className="px-3 py-1 text-slate-700">...</span>
            <button className="px-3 py-1 rounded-md border border-slate-300 bg-white text-slate-900 text-sm font-semibold hover:bg-slate-50">10</button>
            <button className="p-2 rounded-md border border-slate-300 bg-white text-slate-400 hover:bg-slate-50">
              <ChevronRight className="w-4 h-4" />
            </button>
          </div>
        </div>
      </div>

      {deletingBook && (
        <div className="fixed inset-0 bg-slate-900/50 flex items-center justify-center z-50">
          <div className="bg-white rounded-2xl p-6 max-w-md w-full mx-4 shadow-xl">
            <h3 className="text-lg font-bold text-slate-900 mb-2">Delete Book</h3>
            <p className="text-slate-500 text-sm mb-6">Are you sure you want to delete "{deletingBook.title}"? This action cannot be undone.</p>
            <div className="flex justify-end gap-3">
              <button onClick={() => setDeletingBook(null)} className="px-4 py-2 text-sm font-semibold text-slate-700 hover:bg-slate-100 rounded-lg transition-colors">Cancel</button>
              <button onClick={() => setDeletingBook(null)} className="px-4 py-2 text-sm font-semibold text-white bg-red-600 hover:bg-red-700 rounded-lg transition-colors">Delete</button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
