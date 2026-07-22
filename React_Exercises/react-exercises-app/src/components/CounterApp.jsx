import React, { Component } from 'react';

class CounterApp extends Component {
    constructor(props) {
        super(props);
        this.state = { entryCount: 0, exitCount: 0 };
    }

    updateEntry = () => {
        this.setState({ entryCount: this.state.entryCount + 1 });
    };

    updateExit = () => {
        this.setState({ exitCount: this.state.exitCount + 1 });
    };

    render() {
        return (
            <div>
                <h2>Counter App</h2>
                <button onClick={this.updateEntry}>Login</button>
                <button onClick={this.updateExit}>Exit</button>
                <p>{this.state.entryCount} people entered</p>
                <p>{this.state.exitCount} people exited</p>
            </div>
        );
    }
}

export default CounterApp;
