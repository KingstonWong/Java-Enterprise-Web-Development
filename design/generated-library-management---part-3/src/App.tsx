/**
 * @license
 * SPDX-License-Identifier: Apache-2.0
 */

import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import DiscoveryHome from './pages/DiscoveryHome';
import MemberProfile from './pages/MemberProfile';
import UpdateProfile from './pages/UpdateProfile';
import ChangePassword from './pages/ChangePassword';
import BorrowingHistory from './pages/BorrowingHistory';
import BorrowingDashboard from './pages/BorrowingDashboard';
import PendingRequests from './pages/PendingRequests';
import CurrentLoans from './pages/CurrentLoans';
import FinesFees from './pages/FinesFees';
import BookDetails from './pages/BookDetails';
import WriteReview from './pages/WriteReview';

export default function App() {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<DiscoveryHome />} />
        <Route path="/profile" element={<MemberProfile />} />
        <Route path="/profile/update" element={<UpdateProfile />} />
        <Route path="/profile/password" element={<ChangePassword />} />
        <Route path="/borrowing/dashboard" element={<BorrowingDashboard />} />
        <Route path="/borrowing/history" element={<BorrowingHistory />} />
        <Route path="/borrowing/requests" element={<PendingRequests />} />
        <Route path="/borrowing/loans" element={<CurrentLoans />} />
        <Route path="/borrowing/fines" element={<FinesFees />} />
        <Route path="/book/:id" element={<BookDetails />} />
        <Route path="/review/:id" element={<WriteReview />} />
      </Routes>
    </Router>
  );
}
