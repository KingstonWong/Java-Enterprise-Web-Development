import React, { useState } from 'react';
import { BookOpen, Users, AlertCircle, Clock, ArrowUpRight, ArrowDownRight, MoreHorizontal, ChevronLeft, ChevronRight } from 'lucide-react';
import { WalkInBorrow } from './WalkInBorrow';
import { ProcessReturn } from './ProcessReturn';
import { AddBook } from './AddBook';
import { RegisterMember } from './RegisterMember';

const stats = [
  { label: 'Total Books', value: '12,485', change: '+124', trend: 'up', icon: BookOpen, color: 'bg-blue-50 text-[#137fec]' },
  { label: 'Active Members', value: '3,842', change: '+45', trend: 'up', icon: Users, color: 'bg-indigo-50 text-indigo-600' },
  { label: 'Overdue Books', value: '142', change: '-12', trend: 'down', icon: AlertCircle, color: 'bg-rose-50 text-rose-600' },
  { label: 'Pending Requests', value: '56', change: '+8', trend: 'up', icon: Clock, color: 'bg-amber-50 text-amber-600' },
];

const recentActivity = [
  { id: 1, action: 'Borrowed', book: 'The Midnight Library', user: 'Emma Thompson', time: '10 mins ago', status: 'success' },
  { id: 2, action: 'Returned', book: 'Atomic Habits', user: 'James Wilson', time: '25 mins ago', status: 'info' },
  { id: 3, action: 'Overdue', book: 'Project Hail Mary', user: 'Sarah Connor', time: '1 hour ago', status: 'warning' },
  { id: 4, action: 'Reserved', book: 'Dune', user: 'Michael Chang', time: '2 hours ago', status: 'success' },
];

export function Dashboard() {
  const [isWalkIn, setIsWalkIn] = useState(false);
  const [isReturning, setIsReturning] = useState(false);
  const [isAddingBook, setIsAddingBook] = useState(false);
  const [isRegistering, setIsRegistering] = useState(false);

  if (isWalkIn) {
    return <WalkInBorrow onBack={() => setIsWalkIn(false)} />;
  }

  if (isReturning) {
    return <ProcessReturn onBack={() => setIsReturning(false)} />;
  }

  if (isAddingBook) {
    return <AddBook onBack={() => setIsAddingBook(false)} />;
  }

  if (isRegistering) {
    return <RegisterMember onBack={() => setIsRegistering(false)} />;
  }

  return (
    <div className="p-8 space-y-8 max-w-7xl mx-auto">
      <div className="flex flex-col md:flex-row md:items-center justify-between gap-4">
        <div>
          <h1 className="text-3xl font-bold tracking-tight text-slate-900">Dashboard Overview</h1>
          <p className="text-slate-500 mt-1">Welcome back, Sarah. Here's what's happening today.</p>
        </div>
        <div className="flex gap-3">
          <button className="px-4 py-2 bg-white border border-slate-200 text-slate-700 rounded-lg text-sm font-medium hover:bg-slate-50 transition-colors shadow-sm">
            Generate Report
          </button>
          <button 
            onClick={() => setIsReturning(true)}
            className="px-4 py-2 bg-white border border-slate-200 text-slate-700 rounded-lg text-sm font-medium hover:bg-slate-50 transition-colors shadow-sm flex items-center gap-2"
          >
            <ArrowDownRight className="w-4 h-4" />
            Return Book
          </button>
          <button 
            onClick={() => setIsWalkIn(true)}
            className="px-4 py-2 bg-[#137fec] text-white rounded-lg text-sm font-medium hover:bg-blue-600 transition-colors shadow-sm"
          >
            + New Walk-in
          </button>
        </div>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
        {stats.map((stat) => {
          const Icon = stat.icon;
          return (
            <div key={stat.label} className="bg-white p-6 rounded-2xl border border-slate-200 shadow-sm">
              <div className="flex items-center justify-between mb-4">
                <div className={`w-12 h-12 rounded-xl flex items-center justify-center ${stat.color}`}>
                  <Icon className="w-6 h-6" />
                </div>
                <div className={`flex items-center gap-1 text-sm font-medium ${stat.trend === 'up' ? 'text-emerald-600' : 'text-rose-600'}`}>
                  {stat.trend === 'up' ? <ArrowUpRight className="w-4 h-4" /> : <ArrowDownRight className="w-4 h-4" />}
                  {stat.change}
                </div>
              </div>
              <div>
                <h3 className="text-3xl font-bold text-slate-900">{stat.value}</h3>
                <p className="text-sm text-slate-500 font-medium mt-1">{stat.label}</p>
              </div>
            </div>
          );
        })}
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
        <div className="lg:col-span-2 bg-white rounded-2xl border border-slate-200 shadow-sm p-6">
          <div className="flex items-center justify-between mb-6">
            <h2 className="text-lg font-bold text-slate-900">Recent Activity</h2>
            <button className="text-sm font-medium text-[#137fec] hover:text-blue-700">View All</button>
          </div>
          <div className="space-y-6">
            {recentActivity.map((activity) => (
              <div key={activity.id} className="flex items-center justify-between">
                <div className="flex items-center gap-4">
                  <div className={`w-2 h-2 rounded-full ${
                    activity.status === 'success' ? 'bg-emerald-500' :
                    activity.status === 'info' ? 'bg-blue-500' : 'bg-rose-500'
                  }`} />
                  <div>
                    <p className="text-sm font-medium text-slate-900">
                      <span className="text-slate-500 font-normal">{activity.action}</span> {activity.book}
                    </p>
                    <p className="text-xs text-slate-500 mt-0.5">by {activity.user}</p>
                  </div>
                </div>
                <span className="text-xs font-medium text-slate-400">{activity.time}</span>
              </div>
            ))}
          </div>
        </div>

        <div className="space-y-8">
          <div className="bg-white rounded-2xl border border-slate-200 shadow-sm p-6">
            <div className="flex items-center justify-between mb-6">
              <h2 className="text-lg font-bold text-slate-900">Quick Actions</h2>
              <button className="text-slate-400 hover:text-slate-600"><MoreHorizontal className="w-5 h-5" /></button>
            </div>
            <div className="space-y-3">
              <button 
                onClick={() => setIsAddingBook(true)}
                className="w-full flex items-center justify-between p-4 rounded-xl border border-slate-100 hover:border-blue-100 hover:bg-blue-50/50 transition-all group"
              >
                <div className="flex items-center gap-3">
                  <div className="w-10 h-10 rounded-lg bg-blue-100 text-[#137fec] flex items-center justify-center group-hover:bg-blue-200 transition-colors">
                    <BookOpen className="w-5 h-5" />
                  </div>
                  <div className="text-left">
                    <p className="text-sm font-semibold text-slate-900">Add New Book</p>
                    <p className="text-xs text-slate-500">Register to inventory</p>
                  </div>
                </div>
              </button>
              <button 
                onClick={() => setIsRegistering(true)}
                className="w-full flex items-center justify-between p-4 rounded-xl border border-slate-100 hover:border-emerald-100 hover:bg-emerald-50/50 transition-all group"
              >
                <div className="flex items-center gap-3">
                  <div className="w-10 h-10 rounded-lg bg-emerald-100 text-emerald-600 flex items-center justify-center group-hover:bg-emerald-200 transition-colors">
                    <Users className="w-5 h-5" />
                  </div>
                  <div className="text-left">
                    <p className="text-sm font-semibold text-slate-900">Register Member</p>
                    <p className="text-xs text-slate-500">Create new account</p>
                  </div>
                </div>
              </button>
              <button 
                onClick={() => setIsReturning(true)}
                className="w-full flex items-center justify-between p-4 rounded-xl border border-slate-100 hover:border-orange-100 hover:bg-orange-50/50 transition-all group"
              >
                <div className="flex items-center gap-3">
                  <div className="w-10 h-10 rounded-lg bg-orange-100 text-orange-600 flex items-center justify-center group-hover:bg-orange-200 transition-colors">
                    <ArrowDownRight className="w-5 h-5" />
                  </div>
                  <div className="text-left">
                    <p className="text-sm font-semibold text-slate-900">Return Book</p>
                    <p className="text-xs text-slate-500">Process returned items</p>
                  </div>
                </div>
              </button>
            </div>
          </div>

          <div className="bg-white rounded-2xl border border-slate-200 shadow-sm p-6">
            <div className="flex items-center justify-between mb-6">
              <h2 className="text-lg font-bold text-slate-900">Library Schedule</h2>
              <button className="text-slate-400 hover:text-slate-600"><MoreHorizontal className="w-5 h-5" /></button>
            </div>
            <div className="space-y-4">
              <div className="flex items-center justify-between">
                <span className="text-sm font-semibold text-slate-900">October 2023</span>
                <div className="flex gap-2">
                  <button className="p-1 text-slate-400 hover:text-slate-600"><ChevronLeft className="w-4 h-4" /></button>
                  <button className="p-1 text-slate-400 hover:text-slate-600"><ChevronRight className="w-4 h-4" /></button>
                </div>
              </div>
              <div className="grid grid-cols-7 gap-1 text-center text-xs font-medium text-slate-500 mb-2">
                <div>Su</div><div>Mo</div><div>Tu</div><div>We</div><div>Th</div><div>Fr</div><div>Sa</div>
              </div>
              <div className="grid grid-cols-7 gap-1 text-center text-sm">
                <div className="p-2 text-slate-300">1</div><div className="p-2 text-slate-300">2</div><div className="p-2 text-slate-300">3</div><div className="p-2 text-slate-300">4</div><div className="p-2 text-slate-300">5</div><div className="p-2 text-slate-300">6</div><div className="p-2 text-slate-300">7</div>
                <div className="p-2 text-slate-700">8</div><div className="p-2 text-slate-700">9</div><div className="p-2 text-slate-700">10</div><div className="p-2 text-slate-700">11</div><div className="p-2 bg-[#137fec] text-white rounded-lg font-bold">12</div><div className="p-2 text-slate-700">13</div><div className="p-2 text-slate-700">14</div>
                <div className="p-2 text-slate-700">15</div><div className="p-2 text-slate-700">16</div><div className="p-2 text-slate-700">17</div><div className="p-2 text-slate-700">18</div><div className="p-2 text-slate-700">19</div><div className="p-2 text-slate-700">20</div><div className="p-2 text-slate-700">21</div>
                <div className="p-2 text-slate-700">22</div><div className="p-2 text-slate-700">23</div><div className="p-2 text-slate-700">24</div><div className="p-2 text-slate-700">25</div><div className="p-2 text-slate-700">26</div><div className="p-2 text-slate-700">27</div><div className="p-2 text-slate-700">28</div>
                <div className="p-2 text-slate-700">29</div><div className="p-2 text-slate-700">30</div><div className="p-2 text-slate-700">31</div><div className="p-2 text-slate-300">1</div><div className="p-2 text-slate-300">2</div><div className="p-2 text-slate-300">3</div><div className="p-2 text-slate-300">4</div>
              </div>
              <div className="mt-4 space-y-3">
                <div className="flex items-center gap-3">
                  <div className="w-2 h-2 rounded-full bg-[#137fec]"></div>
                  <p className="text-sm text-slate-700"><span className="font-semibold text-slate-900">10:00 AM</span> - Story Time</p>
                </div>
                <div className="flex items-center gap-3">
                  <div className="w-2 h-2 rounded-full bg-emerald-500"></div>
                  <p className="text-sm text-slate-700"><span className="font-semibold text-slate-900">2:00 PM</span> - Book Club</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
