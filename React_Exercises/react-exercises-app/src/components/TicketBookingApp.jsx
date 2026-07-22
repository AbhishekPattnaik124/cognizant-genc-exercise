import React, { useState } from 'react';

const TicketBookingApp = () => {
    const [isLoggedIn, setIsLoggedIn] = useState(false);

    return (
        <div>
            {isLoggedIn ? (
                <div>
                    <h2>User Page - Book Tickets</h2>
                    <button onClick={() => setIsLoggedIn(false)}>Logout</button>
                </div>
            ) : (
                <div>
                    <h2>Guest Page - Browse Flights</h2>
                    <button onClick={() => setIsLoggedIn(true)}>Login</button>
                </div>
            )}
        </div>
    );
};

export default TicketBookingApp;
