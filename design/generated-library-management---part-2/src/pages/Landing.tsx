import { Search, Book, Cloud, Sparkles, Globe, Mail, MapPin, BookOpen } from 'lucide-react';
import { Link } from 'react-router-dom';

export default function Landing() {
  return (
    <div className="bg-slate-50 min-h-screen font-sans">
      {/* Hero Section */}
      <section className="max-w-7xl mx-auto px-6 py-16 md:py-24 flex flex-col md:flex-row items-center gap-12">
        <div className="flex-1 space-y-8">
          <div className="inline-block px-4 py-1.5 bg-blue-100 text-blue-700 text-sm font-medium rounded-full">
            Empowering Lifelong Learning
          </div>
          <h1 className="text-5xl md:text-7xl font-extrabold text-slate-900 leading-tight tracking-tight">
            Unlock Your World <br />
            of <span className="text-[#1877f2]">Knowledge</span>
          </h1>
          <p className="text-lg text-slate-600 max-w-lg leading-relaxed">
            Experience a seamless way to discover, manage, and enjoy our vast collection of books and digital resources through our modern member portal.
          </p>
          <div className="flex flex-wrap gap-4">
            <Link to="/login" className="px-6 py-3 bg-[#1877f2] hover:bg-blue-600 text-white font-semibold rounded-lg transition-colors">
              Sign In Now
            </Link>
            <Link to="/register" className="px-6 py-3 bg-white border border-slate-200 hover:border-slate-300 text-slate-900 font-semibold rounded-lg transition-colors shadow-sm">
              Register Account
            </Link>
          </div>
        </div>
        <div className="flex-1 w-full">
          <img 
            src="https://images.unsplash.com/photo-1568667256549-094345857637?q=80&w=1000&auto=format&fit=crop" 
            alt="Library Interior" 
            className="w-full h-[500px] object-cover rounded-2xl shadow-xl"
            referrerPolicy="no-referrer"
          />
        </div>
      </section>

      {/* Features Section */}
      <section className="bg-white py-24">
        <div className="max-w-7xl mx-auto px-6">
          <div className="text-center max-w-2xl mx-auto mb-16">
            <h2 className="text-3xl font-bold text-slate-900 mb-4">Experience Smarter Reading</h2>
            <p className="text-slate-600">Our member portal is designed with you in mind, making library access more efficient and enjoyable than ever before.</p>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
            {[
              { icon: Search, title: 'Easy Book Discovery', desc: 'Find your next favorite read in seconds with our powerful AI-driven search engine.' },
              { icon: Book, title: 'Manage Your Loans', desc: 'Keep track of due dates, renew books instantly, and manage holds with one tap.' },
              { icon: Cloud, title: 'Digital Resources', desc: 'Access thousands of e-books, journals, and databases from any device, anywhere.' },
              { icon: Sparkles, title: 'Smart Suggestions', desc: 'Get personalized recommendations based on your reading history and interests.' },
            ].map((feature, i) => (
              <div key={i} className="p-8 rounded-2xl bg-slate-50 border border-slate-100 hover:shadow-md transition-shadow">
                <div className="w-10 h-10 bg-blue-100 text-blue-600 rounded-lg flex items-center justify-center mb-6">
                  <feature.icon className="w-5 h-5" />
                </div>
                <h3 className="text-xl font-bold text-slate-900 mb-3">{feature.title}</h3>
                <p className="text-slate-600 text-sm leading-relaxed">{feature.desc}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Mission Section */}
      <section className="py-24 bg-slate-50">
        <div className="max-w-7xl mx-auto px-6">
          <div className="bg-white rounded-3xl p-12 md:p-20 shadow-sm border border-slate-100 flex flex-col md:flex-row items-center gap-16">
            <div className="flex-1 space-y-6">
              <h2 className="text-3xl md:text-4xl font-bold text-slate-900">Our Mission</h2>
              <p className="text-slate-600 leading-relaxed text-lg">
                At LibManage, we are dedicated to empowering our community by providing equitable access to information. We believe that access to books and digital media is a fundamental right that fosters a love for reading and supports lifelong learning.
              </p>
              <p className="text-slate-600 leading-relaxed text-lg">
                Our portal bridges the gap between traditional library values and modern technology, ensuring that every member can navigate our vast collections with ease and inspiration.
              </p>
            </div>
            <div className="flex-1 w-full flex justify-center">
              <div className="w-full max-w-md aspect-square bg-[#45a29e] rounded-2xl flex items-center justify-center p-8 text-center shadow-lg">
                <h3 className="text-4xl md:text-5xl font-light text-white tracking-widest uppercase leading-tight">
                  Our<br/>Community
                </h3>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* CTA Section */}
      <section className="py-24 bg-slate-50">
        <div className="max-w-4xl mx-auto px-6">
          <div className="bg-[#1877f2] rounded-3xl p-12 md:p-16 text-center text-white shadow-xl">
            <h2 className="text-3xl md:text-4xl font-bold mb-6">Ready to start your journey?</h2>
            <p className="text-blue-100 text-lg mb-10 max-w-2xl mx-auto">
              Join thousands of readers today. Create your free account and get instant access to our entire digital catalog.
            </p>
            <div className="flex flex-wrap justify-center gap-4">
              <Link to="/register" className="px-8 py-3 bg-white text-[#1877f2] font-bold rounded-lg hover:bg-slate-50 transition-colors">
                Join Now
              </Link>
              <Link to="#" className="px-8 py-3 bg-transparent border border-white/30 hover:bg-white/10 text-white font-bold rounded-lg transition-colors">
                View Catalog
              </Link>
            </div>
          </div>
        </div>
      </section>

      {/* Footer */}
      <footer className="bg-white border-t border-slate-200 pt-16 pb-8">
        <div className="max-w-7xl mx-auto px-6">
          <div className="grid grid-cols-1 md:grid-cols-4 gap-12 mb-16">
            <div className="space-y-4">
              <div className="flex items-center gap-2 text-[#1877f2] mb-6">
                <BookOpen className="w-6 h-6" fill="currentColor" />
                <span className="text-xl font-bold text-slate-900">LibManage</span>
              </div>
              <p className="text-slate-500 text-sm max-w-xs">
                A complete solution for modern libraries and eager learners.
              </p>
            </div>
            
            <div>
              <h4 className="font-bold text-slate-900 mb-6">Portal</h4>
              <ul className="space-y-4 text-sm text-slate-500">
                <li><a href="#" className="hover:text-[#1877f2]">Digital Books</a></li>
                <li><a href="#" className="hover:text-[#1877f2]">Audiobooks</a></li>
                <li><a href="#" className="hover:text-[#1877f2]">Research Papers</a></li>
                <li><a href="#" className="hover:text-[#1877f2]">Journals</a></li>
              </ul>
            </div>

            <div>
              <h4 className="font-bold text-slate-900 mb-6">Support</h4>
              <ul className="space-y-4 text-sm text-slate-500">
                <li><a href="#" className="hover:text-[#1877f2]">Help Center</a></li>
                <li><a href="#" className="hover:text-[#1877f2]">Loan Policy</a></li>
                <li><a href="#" className="hover:text-[#1877f2]">Membership Tiers</a></li>
                <li><a href="#" className="hover:text-[#1877f2]">Contact Support</a></li>
              </ul>
            </div>

            <div>
              <h4 className="font-bold text-slate-900 mb-6">Legal</h4>
              <ul className="space-y-4 text-sm text-slate-500">
                <li><a href="#" className="hover:text-[#1877f2]">Privacy Policy</a></li>
                <li><a href="#" className="hover:text-[#1877f2]">Terms of Service</a></li>
                <li><a href="#" className="hover:text-[#1877f2]">Cookie Policy</a></li>
              </ul>
            </div>
          </div>

          <div className="flex flex-col md:flex-row items-center justify-between pt-8 border-t border-slate-100 text-sm text-slate-500">
            <p>© 2024 LibManage Member Portal. All rights reserved.</p>
            <div className="flex gap-4 mt-4 md:mt-0">
              <Globe className="w-5 h-5 hover:text-slate-900 cursor-pointer" />
              <Mail className="w-5 h-5 hover:text-slate-900 cursor-pointer" />
              <MapPin className="w-5 h-5 hover:text-slate-900 cursor-pointer" />
            </div>
          </div>
        </div>
      </footer>
    </div>
  );
}
