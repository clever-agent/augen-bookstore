import React, { Component } from 'react';
import './App.scss';
import LandingPage from './LandingPage/LandingPage';


import {
  BrowserRouter as Router,
  Route,
  Switch,
} from "react-router-dom";

class App extends Component {
  

  render() {
    return (
    	<Router>
          <Switch>
          	<Route exact path="/" component={LandingPage} />
            
          </Switch>        
        </Router>
    );
  }
}

export default App;
