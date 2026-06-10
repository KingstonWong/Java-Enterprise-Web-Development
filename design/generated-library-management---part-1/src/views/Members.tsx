import React, { useState } from 'react';
import { Plus, Search, ChevronDown, Edit2, Trash2, ChevronLeft, ChevronRight, Download } from 'lucide-react';
import { RegisterMember } from './RegisterMember';
import { EditMember } from './EditMember';

const members = [
  {
    id: 'MEM-2023-0842',
    name: 'Emma Thompson',
    email: 'emma.t@example.com',
    joinDate: 'Oct 12, 2023',
    status: 'Active',
    avatar: 'https://i.pravatar.cc/150?u=emma'
  },
  {
    id: 'MEM-2023-0843',
    name: 'James Wilson',
    email: 'j.wilson99@example.com',
    joinDate: 'Oct 15, 2023',
    status: 'Active',
    avatar: 'https://i.pravatar.cc/150?u=james'
  },
  {
    id: 'MEM-2023-0844',
    name: 'Sarah Connor',
    email: 's.connor@example.com',
    joinDate: 'Nov 02, 2023',
    status: 'Suspended',
    avatar: 'https://i.pravatar.cc/150?u=sarah'
  },
  {
    id: 'MEM-2023-0845',
    name: 'Michael Chang',
    email: 'm.chang@example.com',
    joinDate: 'Nov 10, 2023',
    status: 'Active',
    avatar: 'https://i.pravatar.cc/150?u=michael'
  },
  {
    id: 'MEM-2023-0846',
    name: 'Olivia Martinez',
    email: 'olivia.m@example.com',
    joinDate: 'Dec 01, 2023',
    status: 'Expired',
    avatar: 'https://i.pravatar.cc/150?u=olivia'
  }
];

export function Members() {
  const [isRegistering, setIsRegistering] = useState(false);
  const [editingMember, setEditingMember] = useState<any>(null);
  const [deletingMember, setDeletingMember] = useState<any>(null);

  if (isRegistering) {
    return <RegisterMember onBack={() => setIsRegistering(false)} />;
  }

  if (editingMember) {
    return <EditMember member={editingMember} onBack={() => setEditingMember(null)} />;
  }

  return (
    <div className="p-8 max-w-7xl mx-auto space-y-6">
      <div className="flex flex-col md:flex-row md:items-center justify-between gap-4">
        <div>
          <h1 className="text-3xl font-bold tracking-tight text-slate-900">Member Management</h1>
          <p className="text-slate-500 mt-1">View, register, and manage library member accounts.</p>
        </div>
        <button 
          onClick={() => setIsRegistering(true)}
          className="flex items-center gap-2 bg-[#137fec] hover:bg-blue-600 text-white px-5 py-2.5 rounded-lg font-semibold transition-colors shadow-sm"
        >
          <Plus className="w-5 h-5" />
          Register Member
        </button>
      </div>

      <div className="bg-white p-4 rounded-xl border border-slate-200 shadow-sm flex flex-col lg:flex-row gap-4">
        <div className="relative flex-1">
          <Search className="w-5 h-5 text-slate-400 absolute left-3 top-1/2 -translate-y-1/2" />
          <input
            type="text"
            placeholder="Search members by name, ID, or email..."
            className="w-full pl-10 pr-4 py-2.5 bg-white border border-slate-200 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-[#137fec] focus:border-transparent"
          />
        </div>
        <div className="flex gap-3 overflow-x-auto pb-2 lg:pb-0">
          <div className="relative min-w-[140px]">
            <select className="w-full appearance-none bg-slate-50 border border-slate-200 text-slate-700 py-2.5 pl-3 pr-10 rounded-lg text-sm font-medium focus:outline-none focus:ring-2 focus:ring-[#137fec]">
              <option>Status: All</option>
            </select>
            <ChevronDown className="w-4 h-4 text-slate-500 absolute right-3 top-1/2 -translate-y-1/2 pointer-events-none" />
          </div>
          <div className="relative min-w-[140px]">
            <select className="w-full appearance-none bg-slate-50 border border-slate-200 text-slate-700 py-2.5 pl-3 pr-10 rounded-lg text-sm font-medium focus:outline-none focus:ring-2 focus:ring-[#137fec]">
              <option>Sort By: Newest</option>
            </select>
            <ChevronDown className="w-4 h-4 text-slate-500 absolute right-3 top-1/2 -translate-y-1/2 pointer-events-none" />
          </div>
          <button className="flex items-center gap-2 px-4 py-2.5 bg-white border border-slate-200 text-slate-700 rounded-lg text-sm font-medium hover:bg-slate-50 transition-colors whitespace-nowrap">
            <Download className="w-4 h-4" />
            Export
          </button>
        </div>
      </div>

      <div className="bg-white rounded-xl border border-slate-200 shadow-sm overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full text-left text-sm text-slate-600">
            <thead className="bg-slate-50 text-xs uppercase text-slate-500 border-b border-slate-200">
              <tr>
                <th className="px-6 py-4 font-semibold min-w-[250px]">Name / Email</th>
                <th className="px-6 py-4 font-semibold">Member ID</th>
                <th className="px-6 py-4 font-semibold">Join Date</th>
                <th className="px-6 py-4 font-semibold">Status</th>
                <th className="px-6 py-4 font-semibold text-right">Actions</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100">
              {members.map((member) => (
                <tr key={member.id} className="hover:bg-slate-50 transition-colors">
                  <td className="px-6 py-4">
                    <div className="flex items-center gap-3">
                      <img src={member.avatar} alt={member.name} className="w-10 h-10 rounded-full object-cover shadow-sm border border-slate-200" referrerPolicy="no-referrer" />
                      <div className="flex flex-col">
                        <span className="text-sm font-semibold text-slate-900">{member.name}</span>
                        <span className="text-xs text-slate-500">{member.email}</span>
                      </div>
                    </div>
                  </td>
                  <td className="px-6 py-4 font-mono text-xs font-medium text-slate-600">{member.id}</td>
                  <td className="px-6 py-4 text-slate-600">{member.joinDate}</td>
                  <td className="px-6 py-4">
                    <span className={`inline-flex items-center rounded-full px-2.5 py-1 text-xs font-medium ring-1 ring-inset ${
                      member.status === 'Active' ? 'bg-emerald-50 text-emerald-700 ring-emerald-600/20' :
                      member.status === 'Suspended' ? 'bg-rose-50 text-rose-700 ring-rose-600/20' :
                      'bg-slate-100 text-slate-700 ring-slate-600/20'
                    }`}>
                      {member.status}
                    </span>
                  </td>
                  <td className="px-6 py-4 text-right">
                    <div className="flex items-center justify-end gap-2">
                      <button 
                        onClick={() => setEditingMember(member)}
                        className="p-1.5 text-slate-400 hover:text-[#137fec] hover:bg-blue-50 rounded transition-colors"
                      >
                        <Edit2 className="w-4 h-4" />
                      </button>
                      <button 
                        onClick={() => setDeletingMember(member)}
                        className="p-1.5 text-slate-400 hover:text-red-600 hover:bg-red-50 rounded transition-colors"
                      >
                        <Trash2 className="w-4 h-4" />
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
            Showing <span className="font-medium">1</span> to <span className="font-medium">5</span> of <span className="font-medium">3,842</span> results
          </p>
          <div className="flex gap-1">
            <button className="p-2 rounded-md border border-slate-300 bg-white text-slate-400 hover:bg-slate-50">
              <ChevronLeft className="w-4 h-4" />
            </button>
            <button className="px-3 py-1 rounded-md bg-[#137fec] text-white text-sm font-semibold">1</button>
            <button className="px-3 py-1 rounded-md border border-slate-300 bg-white text-slate-900 text-sm font-semibold hover:bg-slate-50">2</button>
            <button className="px-3 py-1 rounded-md border border-slate-300 bg-white text-slate-900 text-sm font-semibold hover:bg-slate-50">3</button>
            <span className="px-3 py-1 text-slate-700">...</span>
            <button className="px-3 py-1 rounded-md border border-slate-300 bg-white text-slate-900 text-sm font-semibold hover:bg-slate-50">769</button>
            <button className="p-2 rounded-md border border-slate-300 bg-white text-slate-400 hover:bg-slate-50">
              <ChevronRight className="w-4 h-4" />
            </button>
          </div>
        </div>
      </div>

      {deletingMember && (
        <div className="fixed inset-0 bg-slate-900/50 flex items-center justify-center z-50">
          <div className="bg-white rounded-2xl p-6 max-w-md w-full mx-4 shadow-xl">
            <h3 className="text-lg font-bold text-slate-900 mb-2">Delete Member</h3>
            <p className="text-slate-500 text-sm mb-6">Are you sure you want to delete member "{deletingMember.name}"? This action cannot be undone.</p>
            <div className="flex justify-end gap-3">
              <button onClick={() => setDeletingMember(null)} className="px-4 py-2 text-sm font-semibold text-slate-700 hover:bg-slate-100 rounded-lg transition-colors">Cancel</button>
              <button onClick={() => setDeletingMember(null)} className="px-4 py-2 text-sm font-semibold text-white bg-red-600 hover:bg-red-700 rounded-lg transition-colors">Delete</button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
