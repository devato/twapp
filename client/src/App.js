import React, { Component } from 'react';
import './assets/styles/css/index.css';
import Loading from './components/Loading';
import TopicSelect from './components/TopicSelect';
import { Segment } from 'semantic-ui-react';

class App extends Component {

  state = {
    selectedTopic: '',
    tweetsList: []
  }

  render() {
    return (
      <div className="App">
        <div className="ui container">
          <h1>TweetBeat</h1>
          <div className="ui grid">
            <div className="four wide column">
              <Segment color="grey">
                <h4>Choose a Topic</h4>
                <TopicSelect onSelect={this.showTweets} />
              </Segment>
            </div>
            <div className="twelve wide column">
              <Segment color="grey">
                <h3>Recent Tweets</h3>
                <p>Select a topic to see the most recent tweets.</p>
              </Segment>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default App;
