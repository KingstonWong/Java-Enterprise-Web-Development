import { BookOpen, AtSign, Lock, Eye, Shield, ArrowRight, ShieldCheck, Database } from 'lucide-react';
import { Link } from 'react-router-dom';

export default function AdminLogin() {
  return (
    <div className="flex min-h-screen font-sans bg-white">
      {/* Left Side: Visual/Hero Section */}
      <div className="hidden lg:flex lg:w-1/2 relative overflow-hidden bg-[#1a4b7c]">
        <img 
          src="https://images.unsplash.com/photo-1507842217343-583bb7270b66?q=80&w=2000&auto=format&fit=crop"
          alt="Library Background"
          className="absolute inset-0 w-full h-full object-cover z-0"
          referrerPolicy="no-referrer"
        />
        <div className="absolute inset-0 bg-[#1a4b7c]/80 z-10 mix-blend-multiply"></div>
        
        <div className="relative z-20 flex flex-col justify-between p-12 text-white w-full h-full">
          <div className="flex items-center gap-3">
            <div className="bg-white/20 p-2.5 rounded-xl backdrop-blur-md">
              <BookOpen className="w-6 h-6 text-white" />
            </div>
            <span className="text-2xl font-bold tracking-tight">LMS Pro</span>
          </div>
          
          <div className="max-w-md mt-auto mb-32">
            <h1 className="text-5xl font-extrabold leading-tight mb-6 tracking-tight">
              Empowering<br/>Knowledge<br/>Management
            </h1>
            <p className="text-lg text-white/90 leading-relaxed font-medium">
              Access the central nervous system of your library. Manage collections, track circulations, and support your community with our advanced administrative suite.
            </p>
          </div>
          
          <div className="flex items-center gap-4 text-sm font-medium text-white/80">
            <span className="flex items-center gap-2">
              <ShieldCheck className="w-4 h-4" /> Secure SSL
            </span>
            <span className="w-1 h-1 rounded-full bg-white/40"></span>
            <span className="flex items-center gap-2">
              <Database className="w-4 h-4" /> Real-time Sync
            </span>
          </div>
        </div>
      </div>

      {/* Right Side: Login Form */}
      <div className="w-full lg:w-1/2 flex flex-col items-center justify-center p-8 md:p-16 lg:p-24 bg-white">
        <div className="w-full max-w-md space-y-8">
          {/* Mobile Logo */}
          <div className="lg:hidden flex items-center gap-3 mb-8">
            <div className="bg-[#1877f2] p-2.5 rounded-xl">
              <BookOpen className="w-6 h-6 text-white" />
            </div>
            <span className="text-2xl font-bold tracking-tight text-slate-900">LMS Pro</span>
          </div>

          <div>
            <h2 className="text-3xl font-extrabold text-slate-900 tracking-tight">Admin Portal</h2>
            <p className="mt-3 text-slate-500 text-sm">Please enter your administrative credentials to continue.</p>
          </div>

          <form className="mt-8 space-y-5">
            <div className="space-y-5">
              {/* Admin ID or Email */}
              <div className="flex flex-col gap-1.5">
                <label htmlFor="admin-id" className="text-sm font-semibold text-slate-900">Admin ID or Email</label>
                <div className="relative group">
                  <div className="absolute inset-y-0 left-0 pl-3.5 flex items-center pointer-events-none text-slate-400 group-focus-within:text-[#1877f2] transition-colors">
                    <AtSign className="w-5 h-5" />
                  </div>
                  <input 
                    id="admin-id" 
                    type="text" 
                    placeholder="admin@library.com" 
                    className="block w-full pl-11 pr-4 py-3 bg-slate-50 border border-slate-200 rounded-xl text-slate-900 placeholder:text-slate-400 focus:ring-2 focus:ring-[#1877f2]/20 focus:border-[#1877f2] focus:bg-white transition-all outline-none text-sm"
                    required 
                  />
                </div>
              </div>

              {/* Password */}
              <div className="flex flex-col gap-1.5">
                <label htmlFor="password" className="text-sm font-semibold text-slate-900">Password</label>
                <div className="relative group">
                  <div className="absolute inset-y-0 left-0 pl-3.5 flex items-center pointer-events-none text-slate-400 group-focus-within:text-[#1877f2] transition-colors">
                    <Lock className="w-5 h-5" />
                  </div>
                  <input 
                    id="password" 
                    type="password" 
                    placeholder="••••••••" 
                    className="block w-full pl-11 pr-12 py-3 bg-slate-50 border border-slate-200 rounded-xl text-slate-900 placeholder:text-slate-400 focus:ring-2 focus:ring-[#1877f2]/20 focus:border-[#1877f2] focus:bg-white transition-all outline-none text-sm"
                    required 
                  />
                  <button type="button" className="absolute inset-y-0 right-0 pr-3.5 flex items-center text-slate-400 hover:text-slate-600 transition-colors">
                    <Eye className="w-5 h-5" />
                  </button>
                </div>
              </div>
            </div>

            <div className="flex items-center justify-between pt-2">
              <div className="flex items-center">
                <input 
                  id="remember-me" 
                  name="remember-me" 
                  type="checkbox" 
                  className="h-4 w-4 text-[#1877f2] focus:ring-[#1877f2] border-slate-300 rounded transition-all cursor-pointer" 
                />
                <label htmlFor="remember-me" className="ml-2 block text-sm text-slate-600 cursor-pointer">
                  Remember me
                </label>
              </div>
              <div className="text-sm">
                <Link to="/forgot-password" className="font-semibold text-[#1877f2] hover:text-blue-700 transition-colors">
                  Forgot Password?
                </Link>
              </div>
            </div>

            <button 
              type="button" 
              className="group relative w-full flex justify-center items-center gap-2 py-3.5 px-4 border border-transparent text-sm font-bold rounded-xl text-white bg-[#1877f2] hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-[#1877f2] transition-all mt-6"
            >
              <Shield className="w-4 h-4 text-white/70 group-hover:text-white transition-colors absolute left-4" />
              Login as Admin
            </button>
          </form>

          <div className="mt-10 flex flex-col items-center gap-6">
            <div className="relative w-full">
              <div className="absolute inset-0 flex items-center">
                <div className="w-full border-t border-slate-200"></div>
              </div>
              <div className="relative flex justify-center text-sm">
                <span className="px-4 bg-white text-slate-500">Not an administrator?</span>
              </div>
            </div>
            
            <Link 
              to="/login" 
              className="flex items-center gap-2 px-6 py-2.5 rounded-full border border-slate-200 text-sm font-medium text-slate-700 hover:bg-slate-50 hover:border-slate-300 transition-all"
            >
              Go to Member Login
              <ArrowRight className="w-4 h-4" />
            </Link>
          </div>

          <p className="mt-12 text-center text-xs text-slate-400 leading-relaxed">
            © 2024 Library Management System. All rights reserved. <br/>
            Unauthorized access is strictly prohibited.
          </p>
        </div>
      </div>
    </div>
  );
}
