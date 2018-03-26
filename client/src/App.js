import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import Loading from './components/Loading';

class App extends Component {

  state = {
    selectedTopic: '',
    tweetsList: []
  }

  render() {
    return (
      <div className="App">
        <div className="ui text container">
          <h1>TweetBeat</h1>
          <Loading />
        </div>
      </div>
    );
  }
}

export default App;
