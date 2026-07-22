import React from 'react';
import { BrowserRouter as Router, Routes, Route, Link } from 'react-router-dom';
import MyFirstReact from './components/MyFirstReact';
import OfficeSpaceRentalApp from './components/OfficeSpaceRentalApp';
import TicketBookingApp from './components/TicketBookingApp';
import CounterApp from './components/CounterApp';

function App() {
  return (
    <Router>
      <div style={{ padding: '20px' }}>
        <nav>
          <ul>
            <li><Link to="/myfirstreact">My First React</Link></li>
            <li><Link to="/officespace">Office Space Rental</Link></li>
            <li><Link to="/ticketbooking">Ticket Booking</Link></li>
            <li><Link to="/counter">Counter App</Link></li>
          </ul>
        </nav>
        <hr />
        <Routes>
          <Route path="/myfirstreact" element={<MyFirstReact />} />
          <Route path="/officespace" element={<OfficeSpaceRentalApp />} />
          <Route path="/ticketbooking" element={<TicketBookingApp />} />
          <Route path="/counter" element={<CounterApp />} />
          <Route path="/" element={<h2>Select an exercise from above</h2>} />
        </Routes>
      </div>
    </Router>
  );
}

export default App;
