import React from 'react';

const OfficeSpaceRentalApp = () => {
    const offices = [
        { name: 'Office 1', rent: 50000, address: '123 Tech Park' },
        { name: 'Office 2', rent: 70000, address: '456 Business Rd' }
    ];

    return (
        <div>
            <h1>Office Space Rental</h1>
            <img src="https://via.placeholder.com/150" alt="Office Space" />
            <ul>
                {offices.map((office, index) => (
                    <li key={index}>
                        <strong>{office.name}</strong> - 
                        <span style={{ color: office.rent < 60000 ? 'red' : 'green' }}>
                             Rent: {office.rent}
                        </span> - {office.address}
                    </li>
                ))}
            </ul>
        </div>
    );
};

export default OfficeSpaceRentalApp;
