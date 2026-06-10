import React, { useState } from 'react';
import { Search, ChevronDown, CheckCircle, Clock, ChevronLeft, ChevronRight, XCircle, Check } from 'lucide-react';
import { ConfirmPickup } from './ConfirmPickup';

const initialRequests = [
  {
    id: 'REQ-2023-1042',
    member: 'Emma Thompson',
    memberId: 'MEM-2023-0842',
    book: 'The Great Gatsby',
    author: 'F. Scott Fitzgerald',
    date: 'Oct 24, 2023',
    status: 'Ready for Pickup',
    cover: 'https://picsum.photos/seed/gatsby/100/150',
    avatar: 'https://i.pravatar.cc/150?u=emma'
  },
  {
    id: 'REQ-2023-1043',
    member: 'James Wilson',
    memberId: 'MEM-2023-0843',
    book: 'Project Hail Mary',
    author: 'Andy Weir',
    date: 'Oct 25, 2023',
    status: 'Pending Processing',
    cover: 'https://picsum.photos/seed/hailmary/100/150',
    avatar: 'https://i.pravatar.cc/150?u=james'
  },
  {
    id: 'REQ-2023-1044',
    member: 'Sarah Connor',
    memberId: 'MEM-2023-0844',
    book: 'Dune',
    author: 'Frank Herbert',
    date: 'Oct 25, 2023',
    status: 'Ready for Pickup',
    cover: 'https://picsum.photos/seed/dune/100/150',
    avatar: 'https://i.pravatar.cc/150?u=sarah'
  },
  {
    id: 'REQ-2023-1045',
    member: 'Michael Chang',
    memberId: 'MEM-2023-0845',
    book: 'Atomic Habits',
    author: 'James Clear',
    date: 'Oct 26, 2023',
    status: 'Pending Processing',
    cover: 'https://picsum.photos/seed/atomic/100/150',
    avatar: 'https://i.pravatar.cc/150?u=michael'
  }
];

export function PendingRequests() {
  const [confirmingRequest, setConfirmingRequest] = useState<any>(null);
  const [requests, setRequests] = useState(initialRequests);

  const handleApprove = (id: string) => {
    setRequests(requests.map(req => 
      req.id === id ? { ...req, status: 'Ready for Pickup' } : req
    ));
  };

  const handleReject = (id: string) => {
    setRequests(requests.map(req => 
      req.id === id ? { ...req, status: 'Rejected' } : req
    ));
  };

  if (confirmingRequest) {
    return <ConfirmPickup request={confirmingRequest} onBack={() => setConfirmingRequest(null)} />;
  }

  return (
    <div className="p-8 max-w-7xl mx-auto space-y-6">
      <div className="flex flex-col md:flex-row md:items-center justify-between gap-4">
        <div>
          <h1 className="text-3xl font-bold tracking-tight text-slate-900">Pending Requests</h1>
          <p className="text-slate-500 mt-1">Manage book reservations and process member pickups.</p>
        </div>
      </div>

      <div className="bg-white p-4 rounded-xl border border-slate-200 shadow-sm flex flex-col lg:flex-row gap-4">
        <div className="relative flex-1">
          <Search className="w-5 h-5 text-slate-400 absolute left-3 top-1/2 -translate-y-1/2" />
          <input
            type="text"
            placeholder="Search requests by ID, member, or book..."
            className="w-full pl-10 pr-4 py-2.5 bg-white border border-slate-200 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-[#137fec] focus:border-transparent"
          />
        </div>
        <div className="flex gap-3 overflow-x-auto pb-2 lg:pb-0">
          <div className="relative min-w-[160px]">
            <select className="w-full appearance-none bg-slate-50 border border-slate-200 text-slate-700 py-2.5 pl-3 pr-10 rounded-lg text-sm font-medium focus:outline-none focus:ring-2 focus:ring-[#137fec]">
              <option>Status: All</option>
              <option>Ready for Pickup</option>
              <option>Pending Processing</option>
            </select>
            <ChevronDown className="w-4 h-4 text-slate-500 absolute right-3 top-1/2 -translate-y-1/2 pointer-events-none" />
          </div>
          <div className="relative min-w-[140px]">
            <select className="w-full appearance-none bg-slate-50 border border-slate-200 text-slate-700 py-2.5 pl-3 pr-10 rounded-lg text-sm font-medium focus:outline-none focus:ring-2 focus:ring-[#137fec]">
              <option>Sort By: Oldest</option>
              <option>Sort By: Newest</option>
            </select>
            <ChevronDown className="w-4 h-4 text-slate-500 absolute right-3 top-1/2 -translate-y-1/2 pointer-events-none" />
          </div>
        </div>
      </div>

      <div className="bg-white rounded-xl border border-slate-200 shadow-sm overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full text-left text-sm text-slate-600">
            <thead className="bg-slate-50 text-xs uppercase text-slate-500 border-b border-slate-200">
              <tr>
                <th className="px-6 py-4 font-semibold">Request ID</th>
                <th className="px-6 py-4 font-semibold min-w-[200px]">Member</th>
                <th className="px-6 py-4 font-semibold min-w-[200px]">Book</th>
                <th className="px-6 py-4 font-semibold">Request Date</th>
                <th className="px-6 py-4 font-semibold">Status</th>
                <th className="px-6 py-4 font-semibold text-right">Actions</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100">
              {requests.map((request) => (
                <tr key={request.id} className="hover:bg-slate-50 transition-colors">
                  <td className="px-6 py-4 font-mono text-xs font-medium text-slate-600">{request.id}</td>
                  <td className="px-6 py-4">
                    <div className="flex items-center gap-3">
                      <img src={request.avatar} alt={request.member} className="w-8 h-8 rounded-full object-cover shadow-sm border border-slate-200" referrerPolicy="no-referrer" />
                      <span className="text-sm font-semibold text-slate-900">{request.member}</span>
                    </div>
                  </td>
                  <td className="px-6 py-4">
                    <div className="flex items-center gap-3">
                      <img src={request.cover} alt={request.book} className="w-8 h-12 rounded object-cover shadow-sm" referrerPolicy="no-referrer" />
                      <div className="flex flex-col">
                        <span className="text-sm font-semibold text-slate-900">{request.book}</span>
                        <span className="text-xs text-slate-500">{request.author}</span>
                      </div>
                    </div>
                  </td>
                  <td className="px-6 py-4 text-slate-600">{request.date}</td>
                  <td className="px-6 py-4">
                    <span className={`inline-flex items-center rounded-full px-2.5 py-1 text-xs font-medium ring-1 ring-inset ${
                      request.status === 'Ready for Pickup' ? 'bg-emerald-50 text-emerald-700 ring-emerald-600/20' :
                      request.status === 'Rejected' ? 'bg-rose-50 text-rose-700 ring-rose-600/20' :
                      'bg-amber-50 text-amber-700 ring-amber-600/20'
                    }`}>
                      {request.status === 'Ready for Pickup' && <CheckCircle className="w-3 h-3 mr-1" />}
                      {request.status === 'Pending Processing' && <Clock className="w-3 h-3 mr-1" />}
                      {request.status === 'Rejected' && <XCircle className="w-3 h-3 mr-1" />}
                      {request.status}
                    </span>
                  </td>
                  <td className="px-6 py-4 text-right">
                    {request.status === 'Ready for Pickup' ? (
                      <button 
                        onClick={() => setConfirmingRequest(request)}
                        className="inline-flex items-center gap-1.5 px-3 py-1.5 bg-[#137fec] hover:bg-blue-600 text-white text-xs font-semibold rounded-lg transition-colors shadow-sm"
                      >
                        Process Pickup
                      </button>
                    ) : request.status === 'Pending Processing' ? (
                      <div className="flex items-center justify-end gap-2">
                        <button 
                          onClick={() => handleReject(request.id)}
                          className="p-1.5 text-slate-400 hover:text-rose-600 hover:bg-rose-50 rounded transition-colors"
                          title="Reject Request"
                        >
                          <XCircle className="w-4 h-4" />
                        </button>
                        <button 
                          onClick={() => handleApprove(request.id)}
                          className="p-1.5 text-slate-400 hover:text-emerald-600 hover:bg-emerald-50 rounded transition-colors"
                          title="Approve Request"
                        >
                          <Check className="w-4 h-4" />
                        </button>
                      </div>
                    ) : null}
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
        <div className="flex items-center justify-between border-t border-slate-200 bg-slate-50 px-6 py-3">
          <p className="text-sm text-slate-700">
            Showing <span className="font-medium">1</span> to <span className="font-medium">4</span> of <span className="font-medium">56</span> results
          </p>
          <div className="flex gap-1">
            <button className="p-2 rounded-md border border-slate-300 bg-white text-slate-400 hover:bg-slate-50">
              <ChevronLeft className="w-4 h-4" />
            </button>
            <button className="px-3 py-1 rounded-md bg-[#137fec] text-white text-sm font-semibold">1</button>
            <button className="px-3 py-1 rounded-md border border-slate-300 bg-white text-slate-900 text-sm font-semibold hover:bg-slate-50">2</button>
            <button className="px-3 py-1 rounded-md border border-slate-300 bg-white text-slate-900 text-sm font-semibold hover:bg-slate-50">3</button>
            <span className="px-3 py-1 text-slate-700">...</span>
            <button className="px-3 py-1 rounded-md border border-slate-300 bg-white text-slate-900 text-sm font-semibold hover:bg-slate-50">6</button>
            <button className="p-2 rounded-md border border-slate-300 bg-white text-slate-400 hover:bg-slate-50">
              <ChevronRight className="w-4 h-4" />
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}
