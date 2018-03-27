import React from 'react';
import './assets/styles/index.css';
import Client from './components/Client';
import TopicSelect from './components/TopicSelect';
import Home from './components/Home';
import Tweets from './components/Tweets';

import { Route } from "react-router-dom";

class App extends React.Component {

  state = {
    selectedTopic: '',
    tweetsList: [],
    topics: [],
    loading: true
  }

  componentDidMount() {
    Client.getTopics(results => {
      this.setState({
        topics: this.buildTopics(results.data),
        loading: false
      })
    })
  }

  buildTopics(data) {
    const options = data.map((topic, i) => {
      return {
        key: i,
        name: topic.attributes.name,
        value: topic.attributes.slug,
      }
    })
    return options;
  }

  render() {

    const { loading, topics } = this.state;

    return (
      <div className="app">
        <div className="ui container app__container">
          <h1 className="app__heading">TweetBeat</h1>
          <div className="ui grid">
            <div className="four wide column">
              <TopicSelect loading={loading} topics={topics} />
            </div>
            <div className="twelve wide column">
              <Route exact path="/" component={Home} />
              <Route exact path="/:topicId" component={Tweets} />
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default App;
