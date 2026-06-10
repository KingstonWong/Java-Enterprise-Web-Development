import { RotateCcw, Mail, ArrowRight } from 'lucide-react';
import { Link } from 'react-router-dom';

export default function ForgotPassword() {
  return (
    <div className="min-h-[calc(100vh-73px)] bg-slate-50 flex flex-col items-center justify-center p-6">
      <div className="max-w-md w-full bg-white rounded-2xl shadow-sm p-8 md:p-10 border border-slate-100">
        <div className="flex flex-col items-center text-center mb-8">
          <div className="w-14 h-14 bg-blue-50 rounded-full flex items-center justify-center mb-6">
            <RotateCcw className="w-6 h-6 text-[#1877f2]" />
          </div>
          <h1 className="text-2xl font-bold text-slate-900 mb-3">Reset Your Password</h1>
          <p className="text-slate-500 text-sm">
            Enter your email address and we will send you a link to reset your password.
          </p>
        </div>

        <form className="space-y-6">
          <div>
            <label className="block text-sm font-medium text-slate-900 mb-2">Email Address</label>
            <div className="relative">
              <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                <Mail className="w-5 h-5 text-slate-400" />
              </div>
              <input
                type="email"
                className="block w-full pl-10 pr-3 py-2.5 border border-slate-200 rounded-lg focus:ring-2 focus:ring-[#1877f2] focus:border-transparent outline-none text-sm transition-all"
                placeholder="name@library.edu"
              />
            </div>
          </div>

          <button type="button" className="w-full flex items-center justify-center gap-2 py-3 px-4 bg-[#1877f2] hover:bg-blue-600 text-white font-medium rounded-lg transition-colors">
            Send Reset Link
            <ArrowRight className="w-4 h-4" />
          </button>
        </form>

        <div className="mt-8 pt-6 border-t border-slate-100 text-center">
          <p className="text-sm text-slate-500">
            Remember your password? <Link to="/login" className="font-bold text-[#1877f2] hover:underline">Back to Login</Link>
          </p>
        </div>
      </div>
      
      <div className="mt-12 text-sm text-slate-500">
        © 2023 Library Management System. All rights reserved.
      </div>
    </div>
  );
}
