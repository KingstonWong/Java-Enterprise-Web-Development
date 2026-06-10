import React, { useState } from 'react';
import { Sidebar } from './components/Sidebar';
import { Header } from './components/Header';
import { Dashboard } from './views/Dashboard';
import { Inventory } from './views/Inventory';
import { Members } from './views/Members';
import { Fines } from './views/Fines';
import { Loans } from './views/Loans';
import { PendingRequests } from './views/PendingRequests';

export default function App() {
  const [currentView, setCurrentView] = useState('dashboard');

  const renderView = () => {
    switch (currentView) {
      case 'dashboard':
        return <Dashboard />;
      case 'inventory':
        return <Inventory />;
      case 'members':
        return <Members />;
      case 'loans':
        return <Loans />;
      case 'requests':
        return <PendingRequests />;
      case 'fines':
        return <Fines />;
      default:
        return <Dashboard />;
    }
  };

  return (
    <div className="flex h-screen bg-[#f6f7f8] font-sans text-slate-900 overflow-hidden">
      <Sidebar currentView={currentView} setCurrentView={setCurrentView} />
      <div className="flex-1 flex flex-col h-screen overflow-hidden">
        <Header />
        <main className="flex-1 overflow-y-auto">
          {renderView()}
        </main>
      </div>
    </div>
  );
}
