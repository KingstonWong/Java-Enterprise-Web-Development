import { Mail, Lock, User, Shield, BookOpen, HelpCircle, ShieldCheck, Headset } from 'lucide-react';
import { Link } from 'react-router-dom';

export default function Login() {
  return (
    <div className="min-h-[calc(100vh-73px)] bg-slate-50 flex items-center justify-center p-6">
      <div className="max-w-5xl w-full bg-white rounded-2xl shadow-sm overflow-hidden flex flex-col md:flex-row min-h-[600px]">
        {/* Left Side */}
        <div className="w-full md:w-1/2 bg-[#255b98] text-white p-12 flex flex-col justify-between relative overflow-hidden">
          <div className="absolute inset-0 bg-gradient-to-br from-[#1877f2]/20 to-slate-900/40 mix-blend-multiply"></div>
          <div className="relative z-10">
            <div className="w-12 h-12 bg-white/20 rounded-xl flex items-center justify-center mb-8 backdrop-blur-sm">
              <BookOpen className="w-6 h-6 text-white" />
            </div>
            <h1 className="text-4xl md:text-5xl font-bold leading-tight mb-6">
              Digital Access to Infinite Knowledge.
            </h1>
            <p className="text-blue-100 text-lg max-w-md">
              Manage your loans, explore our catalog, and access thousands of digital resources from anywhere.
            </p>
          </div>
          <div className="relative z-10 flex gap-2 mt-12">
            <div className="w-8 h-1.5 bg-white rounded-full"></div>
            <div className="w-1.5 h-1.5 bg-white/40 rounded-full"></div>
            <div className="w-1.5 h-1.5 bg-white/40 rounded-full"></div>
          </div>
        </div>

        {/* Right Side */}
        <div className="w-full md:w-1/2 p-12 flex flex-col justify-center">
          <div className="max-w-md w-full mx-auto">
            <h2 className="text-3xl font-bold text-slate-900 mb-2">Welcome Back</h2>
            <p className="text-slate-500 mb-8">Please enter your details to sign in.</p>

            <div className="flex p-1 bg-slate-100 rounded-lg mb-8">
              <button className="flex-1 flex items-center justify-center gap-2 py-2 bg-white rounded-md shadow-sm text-sm font-medium text-[#1877f2]">
                <User className="w-4 h-4" />
                Member
              </button>
              <Link to="/admin/login" className="flex-1 flex items-center justify-center gap-2 py-2 text-sm font-medium text-slate-500 hover:text-slate-700">
                <Shield className="w-4 h-4" />
                Admin
              </Link>
            </div>

            <form className="space-y-5">
              <div>
                <label className="block text-sm font-medium text-slate-700 mb-1.5">Email or Member ID</label>
                <div className="relative">
                  <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                    <Mail className="w-5 h-5 text-slate-400" />
                  </div>
                  <input
                    type="text"
                    className="block w-full pl-10 pr-3 py-2.5 border border-slate-200 rounded-lg focus:ring-2 focus:ring-[#1877f2] focus:border-transparent outline-none text-sm transition-all"
                    placeholder="Enter your email or ID"
                  />
                </div>
              </div>

              <div>
                <label className="block text-sm font-medium text-slate-700 mb-1.5">Password</label>
                <div className="relative">
                  <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                    <Lock className="w-5 h-5 text-slate-400" />
                  </div>
                  <input
                    type="password"
                    className="block w-full pl-10 pr-3 py-2.5 border border-slate-200 rounded-lg focus:ring-2 focus:ring-[#1877f2] focus:border-transparent outline-none text-sm transition-all"
                    placeholder="••••••••"
                  />
                </div>
              </div>

              <div className="flex items-center justify-between">
                <label className="flex items-center gap-2 cursor-pointer">
                  <input type="checkbox" className="w-4 h-4 rounded border-slate-300 text-[#1877f2] focus:ring-[#1877f2]" />
                  <span className="text-sm text-slate-600">Remember me</span>
                </label>
                <Link to="/forgot-password" className="text-sm font-medium text-[#1877f2] hover:text-blue-700">
                  Forgot password?
                </Link>
              </div>

              <button type="button" className="w-full py-2.5 px-4 bg-[#1877f2] hover:bg-blue-600 text-white font-medium rounded-lg transition-colors">
                Sign in
              </button>
            </form>

            <p className="text-center text-sm text-slate-600 mt-8">
              Don't have an account? <Link to="/register" className="font-medium text-[#1877f2] hover:text-blue-700">Register here</Link>
            </p>

            <div className="flex justify-center gap-6 mt-12 text-slate-400">
              <HelpCircle className="w-5 h-5 cursor-pointer hover:text-slate-600" />
              <ShieldCheck className="w-5 h-5 cursor-pointer hover:text-slate-600" />
              <Headset className="w-5 h-5 cursor-pointer hover:text-slate-600" />
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
