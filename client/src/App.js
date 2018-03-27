import React from 'react';
import './assets/styles/index.css';
import Client from './components/Client';
import TopicSelect from './components/TopicSelect';
import Home from './components/Home';
import Tweets from './components/Tweets';

import { Route, Switch, NavLink } from "react-router-dom";

class App extends React.Component {

  state = {
    tweetsList: [],
    topics: [],
    topicsLoading: true,
  }

  componentDidMount() {
    Client.getTopics(results => {
      this.setState({
        topics: this.buildTopics(results.data),
        topicsLoading: false
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

    const { topicsLoading, topics } = this.state;

    return (
      <div className="app">
        <div className="ui container app__container">
          <h1 className="app__heading">
            <NavLink to="/">TweetBeat</NavLink>
          </h1>
          <div className="ui grid">
            <div className="four wide column">
              <TopicSelect topicsLoading={topicsLoading} topics={topics} />
            </div>
            <div className="twelve wide column">
              <Switch>
                <Route exact path="/" component={Home} />
                <Route exact path="/:topicId" component={Tweets} />
              </Switch>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default App;
