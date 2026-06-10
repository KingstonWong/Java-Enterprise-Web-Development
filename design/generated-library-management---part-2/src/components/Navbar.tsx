import { Link, useLocation } from 'react-router-dom';
import { BookOpen } from 'lucide-react';

export default function Navbar() {
  const location = useLocation();
  const isLanding = location.pathname === '/';
  
  let logoText = "LibManage";
  if (location.pathname === '/register') logoText = "Library Management System";
  if (location.pathname === '/forgot-password') logoText = "Library System";

  return (
    <header className="flex items-center justify-between px-6 py-4 bg-white border-b border-slate-200 sticky top-0 z-50">
      <Link to="/" className="flex items-center gap-2 text-[#1877f2]">
        <BookOpen className="w-7 h-7" fill="currentColor" />
        <span className="text-xl font-bold text-slate-900 tracking-tight">{logoText}</span>
      </Link>

      {isLanding ? (
        <>
          <nav className="hidden md:flex items-center gap-8 text-sm font-medium text-slate-600">
            <Link to="/" className="text-slate-900">Home</Link>
            <Link to="#" className="hover:text-slate-900">Catalog</Link>
            <Link to="#" className="hover:text-slate-900">About</Link>
            <Link to="#" className="hover:text-slate-900">Contact</Link>
          </nav>
          <div className="flex items-center gap-6">
            <Link to="/login" className="text-sm font-medium text-slate-600 hover:text-slate-900">Login</Link>
            <Link to="/register" className="px-5 py-2.5 text-sm font-medium text-white bg-[#1877f2] rounded-lg hover:bg-blue-600 transition-colors">Get Started</Link>
          </div>
        </>
      ) : (
        <div className="flex items-center gap-6">
          {location.pathname === '/login' && (
            <>
              <nav className="hidden md:flex items-center gap-8 text-sm font-medium text-slate-600 mr-2">
                <Link to="/" className="text-slate-900">Home</Link>
                <Link to="#" className="hover:text-slate-900">Catalog</Link>
                <Link to="#" className="hover:text-slate-900">About Us</Link>
                <Link to="#" className="hover:text-slate-900">Contact</Link>
              </nav>
              <Link to="/register" className="px-5 py-2.5 text-sm font-medium text-white bg-[#1877f2] rounded-lg hover:bg-blue-600 transition-colors">Register</Link>
            </>
          )}
          {location.pathname === '/register' && (
            <Link to="/login" className="px-5 py-2.5 text-sm font-medium text-white bg-[#1877f2] rounded-lg hover:bg-blue-600 transition-colors">Login</Link>
          )}
          {location.pathname === '/forgot-password' && (
             <div className="flex items-center gap-6">
                <Link to="#" className="text-sm font-medium text-slate-600 hover:text-slate-900">Help</Link>
                <Link to="/login" className="px-5 py-2.5 text-sm font-medium text-white bg-[#1877f2] rounded-lg hover:bg-blue-600 transition-colors">Login</Link>
             </div>
          )}
        </div>
      )}
    </header>
  );
}
