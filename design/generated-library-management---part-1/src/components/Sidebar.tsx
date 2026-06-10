import React from 'react';
import { LayoutDashboard, BookOpen, Users, Calendar, CreditCard, BarChart, Settings, HelpCircle, LogOut, Clock } from 'lucide-react';
import { cn } from '../utils';

interface SidebarProps {
  currentView: string;
  setCurrentView: (view: string) => void;
}

const navItems = [
  { id: 'dashboard', label: 'Dashboard', icon: LayoutDashboard },
  { id: 'inventory', label: 'Books Inventory', icon: BookOpen },
  { id: 'members', label: 'Members', icon: Users },
  { id: 'loans', label: 'Active Loans', icon: Calendar },
  { id: 'requests', label: 'Pending Requests', icon: Clock },
  { id: 'fines', label: 'Fines & Fees', icon: CreditCard },
  { id: 'reports', label: 'Reports', icon: BarChart },
];

const bottomItems = [
  { id: 'settings', label: 'Settings', icon: Settings },
  { id: 'help', label: 'Help Center', icon: HelpCircle },
];

export function Sidebar({ currentView, setCurrentView }: SidebarProps) {
  return (
    <aside className="w-64 bg-white border-r border-slate-200 flex flex-col h-screen sticky top-0">
      <div className="p-6 flex items-center gap-3">
        <div className="w-8 h-8 bg-[#137fec] rounded-lg flex items-center justify-center">
          <BookOpen className="w-5 h-5 text-white" />
        </div>
        <span className="text-xl font-bold text-slate-900">LibSys</span>
      </div>

      <div className="flex-1 px-4 py-6 space-y-1 overflow-y-auto">
        <div className="text-xs font-semibold text-slate-400 uppercase tracking-wider mb-4 px-3">Main Menu</div>
        {navItems.map((item) => {
          const Icon = item.icon;
          const isActive = currentView === item.id;
          return (
            <button
              key={item.id}
              onClick={() => setCurrentView(item.id)}
              className={cn(
                "w-full flex items-center gap-3 px-3 py-2.5 rounded-lg text-sm font-medium transition-colors",
                isActive 
                  ? "bg-blue-50 text-[#137fec]" 
                  : "text-slate-600 hover:bg-slate-50 hover:text-slate-900"
              )}
            >
              <Icon className={cn("w-5 h-5", isActive ? "text-[#137fec]" : "text-slate-400")} />
              {item.label}
            </button>
          );
        })}
      </div>

      <div className="p-4 border-t border-slate-200 space-y-1">
        {bottomItems.map((item) => {
          const Icon = item.icon;
          return (
            <button
              key={item.id}
              className="w-full flex items-center gap-3 px-3 py-2.5 rounded-lg text-sm font-medium text-slate-600 hover:bg-slate-50 hover:text-slate-900 transition-colors"
            >
              <Icon className="w-5 h-5 text-slate-400" />
              {item.label}
            </button>
          );
        })}
        <button className="w-full flex items-center gap-3 px-3 py-2.5 rounded-lg text-sm font-medium text-red-600 hover:bg-red-50 transition-colors mt-4">
          <LogOut className="w-5 h-5" />
          Log Out
        </button>
      </div>
    </aside>
  );
}
