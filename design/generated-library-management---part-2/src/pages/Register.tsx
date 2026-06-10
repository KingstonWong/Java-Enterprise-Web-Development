import { BookOpen } from 'lucide-react';
import { Link } from 'react-router-dom';

export default function Register() {
  return (
    <div className="min-h-[calc(100vh-73px)] bg-slate-50 flex items-center justify-center p-6">
      <div className="max-w-5xl w-full bg-white rounded-2xl shadow-sm overflow-hidden flex flex-col md:flex-row min-h-[650px]">
        {/* Left Side - Form */}
        <div className="w-full md:w-[60%] p-8 md:p-12 flex flex-col justify-center">
          <div className="max-w-md w-full mx-auto">
            <h1 className="text-3xl md:text-4xl font-extrabold text-slate-900 mb-3 tracking-tight">Member Registration</h1>
            <p className="text-slate-500 mb-8 text-sm">Create an account to borrow books and access digital resources.</p>

            <form className="space-y-5">
              <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
                <div>
                  <label className="block text-sm font-medium text-slate-900 mb-1.5">Full Name</label>
                  <input type="text" className="w-full px-3 py-2.5 border border-slate-200 rounded-lg focus:ring-2 focus:ring-[#1877f2] focus:border-transparent outline-none text-sm" placeholder="Enter your full name" />
                </div>
                <div>
                  <label className="block text-sm font-medium text-slate-900 mb-1.5">Email Address</label>
                  <input type="email" className="w-full px-3 py-2.5 border border-slate-200 rounded-lg focus:ring-2 focus:ring-[#1877f2] focus:border-transparent outline-none text-sm" placeholder="Enter your email" />
                </div>
              </div>

              <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
                <div>
                  <label className="block text-sm font-medium text-slate-900 mb-1.5">Phone Number</label>
                  <input type="tel" className="w-full px-3 py-2.5 border border-slate-200 rounded-lg focus:ring-2 focus:ring-[#1877f2] focus:border-transparent outline-none text-sm" placeholder="Enter phone number" />
                </div>
                <div>
                  <label className="block text-sm font-medium text-slate-900 mb-1.5">Library Card ID <span className="text-slate-400 font-normal">(Optional)</span></label>
                  <input type="text" className="w-full px-3 py-2.5 border border-slate-200 rounded-lg focus:ring-2 focus:ring-[#1877f2] focus:border-transparent outline-none text-sm" placeholder="Enter ID if applicable" />
                </div>
              </div>

              <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
                <div>
                  <label className="block text-sm font-medium text-slate-900 mb-1.5">Create Password</label>
                  <input type="password" className="w-full px-3 py-2.5 border border-slate-200 rounded-lg focus:ring-2 focus:ring-[#1877f2] focus:border-transparent outline-none text-sm" placeholder="Enter password" />
                </div>
                <div>
                  <label className="block text-sm font-medium text-slate-900 mb-1.5">Confirm Password</label>
                  <input type="password" className="w-full px-3 py-2.5 border border-slate-200 rounded-lg focus:ring-2 focus:ring-[#1877f2] focus:border-transparent outline-none text-sm" placeholder="Confirm password" />
                </div>
              </div>

              <div className="flex items-start gap-2 pt-2">
                <input type="checkbox" id="terms" className="mt-1 w-4 h-4 rounded border-slate-300 text-[#1877f2] focus:ring-[#1877f2]" />
                <label htmlFor="terms" className="text-sm text-slate-600">
                  I agree to the <a href="#" className="text-[#1877f2] font-medium hover:underline">Terms and Conditions</a> and <a href="#" className="text-[#1877f2] font-medium hover:underline">Privacy Policy</a>
                </label>
              </div>

              <button type="button" className="w-full py-3 px-4 bg-[#1877f2] hover:bg-blue-600 text-white font-bold rounded-lg transition-colors mt-2">
                Create Account
              </button>
            </form>

            <p className="text-center text-sm text-slate-500 mt-6">
              Already have an account? <Link to="/login" className="font-bold text-[#1877f2] hover:underline">Log in</Link>
            </p>
          </div>
        </div>

        {/* Right Side - Visual */}
        <div className="hidden md:flex w-[40%] bg-[#cce4ff] flex-col items-center justify-center p-12 text-center relative overflow-hidden">
          <div className="absolute inset-0 bg-gradient-to-b from-blue-100/50 to-transparent"></div>
          <div className="relative z-10 flex flex-col items-center">
            <div className="w-20 h-20 bg-white rounded-2xl flex items-center justify-center mb-8 shadow-sm">
              <BookOpen className="w-10 h-10 text-[#1877f2]" />
            </div>
            <h2 className="text-2xl font-bold text-slate-900 mb-4">Expand Your Knowledge</h2>
            <p className="text-slate-600 max-w-xs mb-12">
              Join thousands of members accessing our vast collection of physical and digital materials.
            </p>
            <div className="flex gap-2">
              <div className="w-2 h-2 bg-[#1877f2] rounded-full"></div>
              <div className="w-2 h-2 bg-blue-300 rounded-full"></div>
              <div className="w-2 h-2 bg-blue-300 rounded-full"></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
